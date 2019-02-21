# -------- >> Chart and feild objects --------------
# Information about a specific feilds
var_obj <- function(feild=NA,feild_type = NA,req = FALSE) {
  info <- list(feild = feild, feild_type = feild_type, req = req)
  attr(info, "class") <- "channel_info"
  info
}

# Specification for a single chart
chart_spec<-function(chart_type=NA,data=NA,...){
  chart_spec<-list(chart_type = chart_type,
                   data = data)
  chan_param<-list(...)
  
  for(item in names(chan_param)){
    if(item == "") next
    chart_spec<-append(chart_spec,chan_param[item])
  }
  
  attr(chart_spec,"class")<-"chart_spec"
  chart_spec
}

#Helper function to return the required feilds for a chart
get_req_feilds<-function(spec_val){
  param_name<-names(spec_val)
  req<-c()
  for(item in param_name){
    tmp<-spec_val[[item]]
    if(class(tmp) == "channel_info"){
      if(tmp$req){
        req<-c(req,item)
      }
    }
  }
  return(req)
}

# -------- >> Chart Templates --------------
chart_required_specs<-list()

# ---- Histogram ----
#specifications for a histogram
chart_required_specs[["histogram"]]<-chart_spec(chart_type = "histogram",
                data = NA,
                x = var_obj(NA,"quant",TRUE),
                color = var_obj(NA,"qual-12",FALSE))

# ---- Density Plot 1-D ----
#specifications for a density plot
chart_required_specs[["density_1D"]]<-chart_spec(chart_type = "density_1D",
                      data = NA,
                      x = var_obj(NA,"quant",TRUE),
                      color = var_obj(NA,"qual-12",FALSE))

# ---- Bar Chart ----
#specifications for a bar chart
chart_required_specs[["bar"]]<-chart_spec(chart_type = "bar",
                     data = NA,
                     x = var_obj(NA,"qual",TRUE),
                     y = var_obj(NA,"quant",FALSE),
                     color = var_obj(NA,"qual-12",FALSE))

# ---- Line Chart ----
#specifications of a line chart
chart_required_specs[["line"]]<-chart_spec(chart_type = "line",
                      data = NA,
                      x = var_obj(NA,"any",TRUE),
                      y = var_obj(NA,"any",TRUE),
                      color = var_obj(NA,"qual-12",FALSE),
                      shape = var_obj(NA,"qual-6",FALSE))

# ---- Scatter Chart ----
#specifications for a scatter charts
chart_required_specs[["scatter"]]<-chart_spec(chart_type = "scatter",
                       data = NA,
                       x=var_obj(NA,"quant|qual-many",TRUE),
                       y=var_obj(NA,"quant|qual-many",TRUE),
                       color = var_obj(NA,"qual-12",FALSE),
                       shape = var_obj(NA,"qual-6",FALSE))

# ---- Boxplot ----
#specifications for a box_plot
chart_required_specs[["boxplot"]]<-chart_spec(chart_type = "boxplot",
                 data = NA,
                 x = var_obj(NA,"qual",TRUE),
                 y = var_obj(NA,"quant",TRUE),
                 color = var_obj(NA,"qual",FALSE))

# ---- Heatmap ----
#specifications for a heatmap
chart_required_specs[["heatmap"]]<-chart_spec(chart_type = "heatmap",
                 data = NA,
                 x = var_obj(NA,"qual",TRUE),
                 y = var_obj(NA,"qual",TRUE),
                 color = var_obj(NA,"quant",TRUE))

# ---- Tile chart----
#specifications for a tile chart
#an alternative to the heatmap that lets the colour variable
#be a qualtitative value
chart_required_specs[["tile"]]<-chart_spec(chart_type = "tile",
                                     data = NA,
                                     x = var_obj(NA,"qual",TRUE),
                                     y = var_obj(NA,"qual",TRUE),
                                     color = var_obj(NA,"qual-12",TRUE))



