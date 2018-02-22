Take action when tsc compilation succeeds or fails.

Installation:
```
npm install tsc-do
```

Usage:
```
    tsc --watch | tsc-do {run-on-success} {run-on-error}
    
    tsc-do --help
```

Examples:
```
    tsc --watch | tsc-do 'say OK' 'say Error'
    tsc --watch | tsc-do ./on-success.sh ./on-error.sh
```

To get back the functionality of `tsc` before https://github.com/Microsoft/TypeScript/pull/20389, 
so that the screen is *not* cleared before each compilation, use:

```
    tsc --watch | tsc-do
```

To clear the screen before each compilation, use:
```
    tsc --watch | tsc-do clear
```