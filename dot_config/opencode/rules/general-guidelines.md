# Agent Rules & Workflow Constraints

## 🛠 技术栈偏好 (Tech Stack & Environment)
- **Node.js**: 强制使用 `pnpm` 和 `pnpx`；**严禁**使用 `npm` 或 `npx`。
- **Python**: 统一使用 `uv` 进行项目管理（包括环境创建、依赖解析及脚本执行）。
- **容器化**: 强制使用 `podman` 执行所有容器相关指令；**严禁**使用 `docker`。

## ⚠️ 执行准则
- 若环境中缺失上述指定工具（如 `uv` 或 `pnpm`），应提示安装，而非擅自退回到旧工具。
- 在给出任何代码建议或执行指令时，应严格遵守上述工具链限制。

## 🔧 Build & Verify Commands (构建与验证命令)
- `pnpm dev` — 启动开发服务器
- `pnpm build` — 生产构建（提交 PR 前必须通过）
- `pnpm test` — 运行单元测试
- `pnpm lint` — ESLint + Prettier 检查
- `pnpm type-check` — TypeScript 类型检查

## 🚧 Boundaries (边界约束)

### Always (始终执行)
- 提交前运行 `pnpm type-check` 和 `pnpm lint`
- 为所有新增导出添加类型注解
- 遵循现有代码风格和模式

### Ask First (请先询问)
- 添加新依赖前
- 修改认证逻辑前
- 变更数据库 schema 前

### Never (禁止事项)
- 使用 `npm`、`npx`、`docker`
- 提交密钥、凭证或 .env 文件
- 在生产 API 响应中暴露堆栈信息

## ✅ Definition of Done (完成标准)
任务完成必须同时满足：
1. `pnpm type-check` 退出码为 0
2. `pnpm lint` 零警告
3. `pnpm test` 全部通过
4. 新增代码具有类型注解
5. 公共 API 已更新文档
