Take action when tsc compilation succeeds or fails.


Usage:
```bash
tsc --watch | tsc-do {on-success} {on-error} {on-start}
```

Examples:
```bash
tsc --watch | tsc-do 'say OK' 'say Failed' 'say Building'
tsc --watch | tsc-do ./on-success.sh ./on-error.sh ./on-start.sh
tsc --watch | tsc-do
```

To get back the functionality of `tsc` before https://github.com/Microsoft/TypeScript/pull/20389, 
so that the screen is *not* cleared before each compilation, use:

```bash
tsc --watch | tsc-do
```

To clear the screen after each successful compilation, use:
```bash
tsc --watch | tsc-do true true clear
```
