import pandas as pd
import numpy as np
import matplotlib.pylab as plt
Airlines_data = pd.read_csv("C:/Users/USER/Desktop/k_means_clust/EastWestAirlines.csv")
###for normalizing the data
def norm_fun(i):
    x=(i-i.min())/(i.max()-i.min())
    return(x)

df_norm=norm_fun(Airlines_data.iloc[:,1:])

#####for linkage function and dist
from scipy.cluster.hierarchy import linkage 
import scipy.cluster.hierarchy as sch

dist=linkage(df_norm, method="complete",metric="euclidean")

plt.figure(figsize=(15, 5));plt.title('Hierarchical Clustering Dendrogram');plt.xlabel('Index');plt.ylabel('Distance')
sch.dendrogram(
    dist,
    leaf_rotation=0.,  # rotates the x axis labels
    leaf_font_size=8.,  # font size for the x axis labels
)
plt.show()

from	sklearn.cluster	import	AgglomerativeClustering 
h_complete	=	AgglomerativeClustering(n_clusters=3
                                     ,	linkage='complete',affinity = "euclidean").fit(df_norm) 

cluster_labels=pd.Series(h_complete.labels_)
crime_data['clust']=cluster_labels # creating a  new column and assigning it to new column 
crime_data = crime_data.iloc[:,[5,0,1,2,3,4]]
crime_data.head()
