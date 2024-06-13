# quick-header Extension For Quarto

This is an extension for creating header text to be placed in the top margins of documents, intended for use in a Quarto-to-HTML-to-pagedjs workflow. Currently, rendering to PDF directly with a pdf engine like pagedjs doesn't seem to work; instead, render to HTML, then use the PDF engine.

## Installing

To install this extension in your current directory (or into the Quarto project that you're currently working in), use the following command:

```bash
quarto add CT-Data-Haven/quick-header
```

This will install the extension under the `_extensions` subdirectory.
If you're using version control, you will want to check in this directory.

## Using quick-header

There are 4 shortcodes included here, to create headers for the left, right, and center top margins, respectively. The 4th is a shorthand that takes an argument `side` to decide which type of header to make. For example, these will create the same thing:

```markdown
{{< header-right "Right header" >}}
{{< quick-header "Also a right header" side=right >}}
```

The shortcodes can take a `class` argument, which will assign a class to the elements for use with custom CSS classes:

```markdown
{{< header-center "Draft" class=gray-bold >}}
```

Then in your CSS:

```css
.gray-bold {
    color: #777;
    font-weight: bold;
}
```


Additionally, the filter `header-page` will help create the CSS necessary for moving header text to the margins, with the option of this happening for every page or just chapter-styled pages. Include this like any other filter:

```yaml
filters:
    - header-page
chapter-header-only: true # optional, will default false
```



See more in the example file.

## Example

Here is the source code for a minimal example: [example.qmd](example.qmd).

After rendering `example.qmd` to HTML, call

```bash
pagedjs-cli -i example.html -o example.pdf
```

to get a paged PDF document. The output of that is [example.pdf](./example.pdf).

