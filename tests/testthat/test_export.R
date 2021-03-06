context("Data is exported from the UI")

# skip_on_cran()

# try(ui$close())
# ui <- iNZGUI$new()
# ui$initializeGui(census.at.school.500)
# on.exit(gWidgets2::dispose(ui$win))

test_that("Export RDA", {
    fp <- tempfile(fileext = ".rda")
    on.exit(unlink(fp))
    expect_true(
        iNZSaveFile(fp, "rda",
            data = census.at.school.500,
            dataname = "cas"
        )
    )
    load(fp)
    expect_equal(cas, census.at.school.500)
})


if (FALSE) {
    ## Run manually (cannot be automated at this point in time)
    svalue(ui$ctrlWidget$V1box) <- "height"
    svalue(ui$ctrlWidget$V2box) <- "travel"
    ui$getActiveDoc()$setSettings(
        list(
            colby = census.at.school.500$gender,
            varnames = list(colby = "gender")
        )
    )
    ui$plotWidget$savePlot()
}
