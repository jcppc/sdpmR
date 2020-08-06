
writeTable <- function(table, path, rownames = TRUE, colnames = TRUE, quote = FALSE)
{

  tablename <- deparse(substitute(table))

    filename <- paste0( path, "/", tablename, ".tex")
    file.create(filename)
    fileConn <- file(filename)
    write.table(table, file = filename, sep = " & ", row.names = rownames, col.names = colnames, quote = quote)
    close(fileConn)

}
