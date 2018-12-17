iNZStatusWidget <- setRefClass(
    "iNZStatusWidget",
    fields = list(
        GUI = "ANY",
        status = "character",
        timer = "ANY",
        progress = "character",
        loading = "numeric",
        statusbar = "ANY"
    ),
    methods = list(
        initialize = function(gui) {
            initFields(
                GUI = gui, 
                status = "Please wait while iNZight loads ...", 
                timer = NULL
            )

            statusbar <<- gstatusbar(status)
        },
        set = function(text, time = 0) {
            status <<- text
            svalue(statusbar) <<- status
            if (!is.null(timer) && timer$started) timer$stop_timer()
            timer <<- NULL
            if (time > 0) {
                timer <<- gtimer(time, function(...) .self$clear(), one.shot = TRUE)
            }
        },
        clear = function(text) {
            .self$set("")
        }
    )
)
