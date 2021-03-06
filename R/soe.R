## #' Soft Ordinal Embedding
## #'
## #' Instance of \code{\link{dimRedMethod}} for Soft Ordinal Embedding.
## #'
## #' For details see \code{\link[loe]{SOE}}.
## #'
## #'
## #' @examples
## #' dat <- loadDataSet("3D S Curve", n = 50)
## #' soe <- SOE()
## #' emb <- soe@fun(dat, soe@stdpars)
## #'
## #'
## #' plot(emb@data@data)
## #'
## #'
## #' @include dimRedResult-class.R
## #' @include dimRedMethod-class.R
## #' @export
## SOE <- setClass(
##     "SOE",
##     contains = "dimRedMethod",
##     prototype = list(
##         stdpars = list(d = stats::dist, knn = 50, ndim = 2),
##         fun = function (data,
##                         pars,
##                         keep.org.data = TRUE) {
##         chckpkg("loe")

##         meta <- data@meta
##         orgdata <- if (keep.org.data) data@data else NULL
##         indata <- data@data

##         outdata <- loe::SOE(loe::get.order(as.matrix(pars$d(indata))),
##                             N = nrow(indata), p = pars$ndim)$X

##         colnames(outdata) <- paste0("SOE", 1:ncol(outdata))

##         return(new(
##             "dimRedResult",
##             data         = new("dimRedData",
##                                data = outdata,
##                                meta = meta),
##             org.data     = orgdata,
##             has.org.data = keep.org.data,
##             method       = "soe",
##             pars         = pars
##         ))
##     })
## )
