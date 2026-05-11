# 字体说明

本模板使用的字体为 Windows 系统自带字体，通常无需额外安装：

- **宋体** (simsun.ttc)
- **黑体** (simhei.ttf)  
- **仿宋** (FangSong_GB2312.ttf)

## Windows

上述字体已随系统预装，**无需任何额外操作**。

## macOS

```bash
# 从 Windows 系统复制字体文件到 ~/Library/Fonts/
# 或使用第三方字体包
brew install --cask font-simsun  # 可能需要手动安装
```

## Linux

```bash
# Ubuntu/Debian
sudo apt install fonts-wqy-zenhei fonts-wqy-microhei

# 或手动复制 Windows 字体到 ~/.fonts/ 后执行
fc-cache -fv
```

## 手动安装

如编译时提示缺少字体，从 Windows 系统 `C:\Windows\Fonts\` 复制以下文件到本目录：

- `simsun.ttc`（宋体）
- `simhei.ttf`（黑体）
- `FangSong_GB2312.ttf`（仿宋）

> ⚠️ 字体文件约 40MB+ 且涉及版权，已通过 `.gitignore` 排除。请自行安装。
