# Skill Metadata Check

Run from the repository root.

## Validate Frontmatter

```bash
bad=0; count=0; for f in skills/**/SKILL.md; do count=$((count+1)); exec 3< "$f"; IFS= read -r l1 <&3; IFS= read -r l2 <&3; IFS= read -r l3 <&3; IFS= read -r l4 <&3; exec 3<&-; name=${l2#name: }; desc=${l3#description: }; if [ "$l1" != "---" ] || [ "$l4" != "---" ]; then print -- "bad delimiters: $f"; bad=1; fi; if [[ ! "$l2" == name:\ * ]] || [[ ! "$name" =~ '^[a-z0-9-]+$' ]]; then print -- "bad name: $f -> $l2"; bad=1; fi; if [[ ! "$l3" == description:\ Use\ when* ]]; then print -- "bad description trigger: $f -> $l3"; bad=1; fi; if [ ${#desc} -gt 500 ]; then print -- "description too long: $f"; bad=1; fi; done; print -- "checked $count skill files"; exit $bad
```

Expected result:

```txt
checked N skill files
```

Exit code must be `0`.

## Validate Whitespace

```bash
git diff --check
```

Expected: no output.

## Validate Old ACM Workflow Paths

Use repository search for:

```txt
.acm/agent
.acm/templates
.acm/product
```

Expected: matches only in historical task records or migration notes.
