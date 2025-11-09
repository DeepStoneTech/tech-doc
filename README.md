# DeepStone RWA 多签平台技术说明文档

这是 DeepStone RWA 多签平台的技术说明文档，使用 Jekyll 构建，可部署到 GitHub Pages。

## 📋 目录结构

```
.
├── _config.yml          # Jekyll 配置文件
├── _layouts/
│   └── default.html     # 默认布局模板
├── assets/
│   └── css/
│       └── style.css    # 自定义样式
├── index.md             # 主页面内容
└── README.md            # 本文件
```

## 🚀 部署到 GitHub Pages

### 方法一：使用 GitHub Pages 自动构建（推荐）

1. **创建 GitHub 仓库**
   - 在 GitHub 上创建一个新仓库（例如：`deepstone-tech-docs`）
   - 将仓库设置为公开（Public）或启用 GitHub Pages 功能

2. **上传文件**
   ```bash
   git init
   git add .
   git commit -m "Initial commit: Add technical documentation"
   git branch -M main
   git remote add origin https://github.com/你的用户名/deepstone-tech-docs.git
   git push -u origin main
   ```

3. **启用 GitHub Pages**
   - 进入仓库的 Settings（设置）
   - 找到 Pages 选项
   - 在 Source 中选择 "Deploy from a branch"
   - 选择 `main` 分支和 `/ (root)` 目录
   - 点击 Save

4. **等待构建完成**
   - GitHub 会自动使用 Jekyll 构建网站
   - 通常几分钟后，网站会在 `https://你的用户名.github.io/deepstone-tech-docs` 上线

### 方法二：使用 GitHub Actions（更灵活）

如果需要更多控制，可以创建 `.github/workflows/jekyll.yml`：

```yaml
name: Jekyll site CI

on:
  push:
    branches: [ main ]
  pull_request:
    branches: [ main ]

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v3
    - uses: actions/setup-ruby@v1
      with:
        ruby-version: '3.1'
    - name: Install Jekyll
      run: gem install bundler jekyll
    - name: Build site
      run: jekyll build
    - name: Deploy to GitHub Pages
      uses: peaceiris/actions-gh-pages@v3
      with:
        github_token: ${{ secrets.GITHUB_TOKEN }}
        publish_dir: ./_site
```

## 🔧 本地预览

如果你想在本地预览网站：

1. **安装 Ruby 和 Jekyll**
   ```bash
   # Windows (使用 RubyInstaller)
   # 下载并安装 Ruby: https://rubyinstaller.org/
   
   # 安装 Jekyll
   gem install bundler jekyll
   ```

2. **运行本地服务器**
   ```bash
   jekyll serve
   ```

3. **访问网站**
   - 打开浏览器访问 `http://localhost:4000`

## 📝 更新内容

要更新文档内容，只需编辑 `index.md` 文件，然后：

1. 提交更改
   ```bash
   git add index.md
   git commit -m "Update documentation"
   git push
   ```

2. GitHub Pages 会自动重新构建网站

## 🎨 自定义样式

样式文件位于 `assets/css/style.css`，你可以根据需要修改颜色、字体等。

## 📄 许可证

本文档内容归 DeepStone Tech 所有。

## 📧 联系方式

- **技术支持**：deepstonetech@gmail.com
- **GitHub**：https://github.com/DeepStoneTech

