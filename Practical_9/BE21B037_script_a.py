# -*- coding: utf-8 -*-
"""CBL9b.ipynb

Automatically generated by Colab.

Original file is located at
    https://colab.research.google.com/drive/1OKaFblA2d8uye5DAjeOuzEIsIiOFscWx
"""

!pip install pydeseq2 matplotlib seaborn

#import library
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
import numpy as np

df = pd.read_csv('/content/Tissue_Comp.csv')
df1 = pd.read_csv("/content/Gtex_metadata_tissue - Gtex_metadata_tissue.csv")

df = df.T
df.columns = df.iloc[0]
df
df = df.drop(df.index[0])
df

# Rename columns in metadata
df1.rename(columns={"Tissue":"Group"}, inplace=True)
df.index.name = 'Gene'
df1.set_index('Gene', inplace=True)

# Remove the current index
df1.reset_index(drop=False, inplace=False)
df1

from pydeseq2.dds import DeseqDataSet
from pydeseq2.default_inference import DefaultInference
from pydeseq2.ds import DeseqStats

inference = DefaultInference(n_cpus=8)
dds = DeseqDataSet(
    counts=df,
    metadata=df1,
    design_factors="Group",
    refit_cooks=True,
    inference=inference,
)
dds.deseq2()
stat_res = DeseqStats(dds, inference=inference, contrast = ["Group","Ovary","Others"])
stat_res.summary()

# Save the results
df_temp = stat_res.results_df

# Filter the dataframe
def filter_dataframe(df):
    df_filtered = df.dropna(subset=['pvalue'])
    df_filtered = df_filtered[df_filtered['pvalue'] < 0.05]
    return df_filtered

df_temp_filtered = filter_dataframe(df_temp)
df_temp_filtered.to_csv("result_filtered.csv")
df_temp_filtered['regulation'] = np.where(df_temp_filtered['log2FoldChange'] > 0, 'up', 'down')

# Volcano plot
def volcano_plot(df):
    plt.figure(figsize=(10, 8))
    sns.scatterplot(x='log2FoldChange', y=-np.log10(df['pvalue']), data=df, hue='regulation', palette={'up': 'red', 'down': 'blue'}, alpha=0.7)
    plt.title('Volcano Plot')
    plt.xlabel('Log2 Fold Change')
    plt.ylabel('-Log10 p-value')
    plt.axhline(y=-np.log10(0.05), color='grey', linestyle='--')
    plt.axvline(x=1, color='grey', linestyle='--')
    plt.axvline(x=-1, color='grey', linestyle='--')
    plt.legend(title='Regulation')
    plt.show()

volcano_plot(df_temp_filtered)
upregulated_genes = df_temp_filtered[df_temp_filtered['regulation'] == 'up']
downregulated_genes = df_temp_filtered[df_temp_filtered['regulation'] == 'down']

upregulated_genes.to_csv("upregulated_genes.csv")
downregulated_genes.to_csv("downregulated_genes.csv")