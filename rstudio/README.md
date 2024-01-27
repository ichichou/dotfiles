1. patch.css を RStudio のテーマファイルと同じディレクトリに配置する（シンボリックリンク）。

テーマファイルの場所：

```shell
/applications/rstudio.app/contents/resources/app/resources/themes/*.rstheme
```

2. 以下のコードを反映させたいテーマファイルの冒頭に追加する。

```css
@import "patch.css";
```
