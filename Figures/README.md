# Figures 目录

请将论文所需图片放置在此目录。

支持的格式：PNG、JPG、PDF、EPS

## 使用示例

```latex
\begin{generalfig}[htb]{图片标题}{fig:myfigure}
    \includegraphics[width=\textwidth]{Figures/myimage.png}
\end{generalfig}
```

引用图片：`\autoref{fig:myfigure}` 或 `图~\ref{fig:myfigure}`

## 子图 (subfigure)

```latex
\begin{figure}[H]
    \centering
    \begin{subfigure}[b]{0.45\textwidth}
        \centering
        \includegraphics[width=\textwidth]{Figures/left.png}
        \caption{左图说明}
    \end{subfigure}
    \hspace{1em}
    \begin{subfigure}[b]{0.45\textwidth}
        \centering
        \includegraphics[width=\textwidth]{Figures/right.png}
        \caption{右图说明}
    \end{subfigure}
    \caption{总标题}
    \label{fig:subfig-demo}
\end{figure}
```

> ⚠️ 图片请使用有意义的英文文件名，避免中文路径可能导致的问题。
