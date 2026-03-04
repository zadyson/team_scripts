# install & load required packages
install.packages("genoPlotR")
library(genoPlotR)

# import alignment
bbone <- read_mauve_backbone("mauve.backbone")

# hide LCB annotations
dna_segs_invisible <- lapply(bbone$dna_segs, function(df) {
  df$col <- NA       # remove fill
  df$lwd <- 0        # remove border
  df
})

# plot
plot_gene_map(dna_segs=dna_segs_invisible,
              comparisons=bbone$comparisons,
              #annotations=NULL,
              #annotation_height=0,
              #seg_plots = NULL,
              gene_type="points",
              dna_seg_labels = NULL,
              gene_types = "arrow",
              seg_plot_height = 0.2)
