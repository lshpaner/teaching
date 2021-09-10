## <b> Requisite packages and libraries for this task in RStudio </b>

1. Install the following packages and load relevant library(ies) as shown in the R chunk below:  

* [devtools](https://cran.r-project.org/web/packages/devtools/index.html) - development tools package   
* [factoextra](https://cran.r-project.org/web/packages/factoextra/index.html) - used for extracting and visualizing results of multivariate analyses  
* [gganimate](https://cran.r-project.org/web/packages/gganimate/index.html)- used animating ggplots.

```{r, eval=F}
install.packages("devtools")
library(devtools)
install_github("kassambara/factoextra")
install.packages("gganimate")
```

2. Load the necessary libraries.
```{r}
library(factoextra)
library(gganimate)
```

## <b> Applying gganimate to Principal Component Analysis from iris dataset </b>
3. Read in the iris flower dataset by calling `data(iris)` and inspect it with `head(iris)`

```{r}
data(iris)
head(iris)
```


4. Principal Component Analysis (PCA) is a dimensionality reduction/ feature selection technique aimed at increasing the comprehensibility of a model with a goal of minimizing information loss in the process. Create a variable to perform Principal Component Analysis (PCA) and name it `res.pca`, assigning it to only the numerical columns (negating the last one). Ensure to normalize the data by scaling it.

```{r}
res.pca <- prcomp(iris[, -5],  scale = TRUE)
```

5. Each principal component carries with it a percentage of variance that it accounts for in the model. Create a new variable to measure variance explained and assign it to `var_explained`. 
*Note* Keep in mind that this next line will be useful for subsequent renditions of PCA involving other datasets. 

```{r}
var_explained <- round(res.pca$sdev^2/sum((res.pca$sdev)^2)*100, 4)
```

6. Obtain the eigenvalues of the PCA function using `get_eig()`.

```{r}
get_eig(res.pca)
```

7. Create a visualization function using `fviz_eig()`, parse in the relevant parameters, and store it in a new dataframe `fviz`.

```{r}
fviz <- fviz_eig(res.pca, addlabels = TRUE, ggtheme=theme_classic())+
  geom_line(size=1, color="blue")
```


8. This step finally leverages `gganimate()` to add animation to the visualization. Add the `fviz` dataframe to the transition effect `transition_reveal()`, ensuring to correct the animation direction by making the transition a function of a sequence along the explained variance `var_explained`. Assign this to a new dataframe `animated`.

```{r}
animated <- fviz + transition_reveal(seq_along(var_explained))
```

9. Animate the scree plot visualization by calling `animate` on the animated dataframe, parsing in a suitable renderer, height, and resolution parameters.

```{r}
animate(animated, renderer = gifski_renderer(), width = 1200, height=550, res=150)
```


