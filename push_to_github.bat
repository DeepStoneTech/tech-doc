@echo off
chcp 65001 >nul
echo ========================================
echo 推送代码到 GitHub
echo ========================================
echo.

echo [1/4] 更新远程仓库地址...
git remote set-url origin https://github.com/DeepStoneTech/tech-doc.git
if %errorlevel% neq 0 (
    echo 错误: 更新远程仓库地址失败
    pause
    exit /b 1
)
echo 完成！

echo.
echo [2/4] 添加所有文件...
git add .
if %errorlevel% neq 0 (
    echo 错误: 添加文件失败
    pause
    exit /b 1
)
echo 完成！

echo.
echo [3/4] 提交更改...
git commit -m "Initial commit: DeepStone RWA 多签平台技术说明文档"
if %errorlevel% neq 0 (
    echo 警告: 提交可能失败（可能是没有更改或已提交）
)
echo 完成！

echo.
echo [4/4] 推送到 GitHub...
git branch -M main
git push -u origin main
if %errorlevel% neq 0 (
    echo.
    echo 错误: 推送失败
    echo 可能的原因:
    echo 1. 需要身份验证（用户名和 Personal Access Token）
    echo 2. 网络连接问题
    echo.
    pause
    exit /b 1
)

echo.
echo ========================================
echo 推送成功！
echo ========================================
echo.
pause

