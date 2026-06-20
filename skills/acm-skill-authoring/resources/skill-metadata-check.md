# Skill Metadata Check

Run from the repository root.

## Validate Frontmatter

Portable POSIX shell — runs under both `bash` and `zsh`:

```bash
bad=0; count=0
for f in skills/*/SKILL.md; do
  count=$((count+1))
  l1=$(sed -n '1p' "$f"); l2=$(sed -n '2p' "$f")
  l3=$(sed -n '3p' "$f"); l4=$(sed -n '4p' "$f")
  name=${l2#name: }; desc=${l3#description: }
  [ "$l1" = "---" ] && [ "$l4" = "---" ] || { echo "bad delimiters: $f"; bad=1; }
  case "$l2" in name:\ *) ;; *) echo "bad name key: $f -> $l2"; bad=1;; esac
  printf '%s' "$name" | grep -Eq '^[a-z0-9-]+$' || { echo "bad name: $f -> $name"; bad=1; }
  case "$l3" in description:\ Use\ when*) ;; *) echo "bad description trigger: $f -> $l3"; bad=1;; esac
  [ "${#desc}" -le 500 ] || { echo "description too long: $f"; bad=1; }
done
echo "checked $count skill files"
exit $bad
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
