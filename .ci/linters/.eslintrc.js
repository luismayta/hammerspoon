module.exports = {
  root: true,
  parser: "@typescript-eslint/parser",
  plugins: ["@typescript-eslint"],
  extends: [
    "eslint:recommended",
    "plugin:@typescript-eslint/recommended",
    "plugin:@typescript-eslint/recommended-requiring-type-checking",
    "prettier"
  ],
  parserOptions: {
    project: "./tsconfig.json",
    ecmaVersion: 2022,
    sourceType: "module"
  },
  env: {
    node: true,
    es2022: true
  },
  rules: {
    // TypeScript rules
    "@typescript-eslint/no-explicit-any": "warn",
    "@typescript-eslint/explicit-function-return-type": "off",
    "@typescript-eslint/explicit-module-boundary-types": "off",
    "@typescript-eslint/no-unused-vars": ["error", { argsIgnorePattern: "^_" }],
    "@typescript-eslint/no-floating-promises": "error",
    "@typescript-eslint/no-misused-promises": "error",
    "@typescript-eslint/require-await": "error",
    "@typescript-eslint/await-thenable": "error",
    "@typescript-eslint/no-unnecessary-type-assertion": "error",
    "@typescript-eslint/no-unsafe-argument": "warn",
    "@typescript-eslint/no-unsafe-assignment": "warn",
    "@typescript-eslint/no-unsafe-call": "warn",
    "@typescript-eslint/no-unsafe-member-access": "warn",
    "@typescript-eslint/no-unsafe-return": "warn",
    "@typescript-eslint/restrict-template-expressions": "warn",
    "@typescript-eslint/unbound-method": "warn",

    // General rules
    "no-console": ["warn", { allow: ["warn", "error"] }],
    eqeqeq: ["error", "always"],
    curly: ["error", "all"],
    "no-var": "error",
    "prefer-const": "error",
    "object-shorthand": "error",
    "quote-props": ["error", "as-needed"],
    "no-duplicate-imports": "error",
    "sort-imports": ["warn", { ignoreCase: true, ignoreDeclarationSort: true }],

    // Disabled rules from previous config
    "@typescript-eslint/semicolon": "off",
    "@typescript-eslint/member-delimiter-style": "off",
    "@typescript-eslint/semi": "off",
    semi: "off"
  },
  overrides: [
    {
      files: ["**/*.test.ts", "**/*.spec.ts"],
      env: {
        jest: true
      },
      rules: {
        "@typescript-eslint/no-explicit-any": "off",
        "@typescript-eslint/no-unsafe-assignment": "off",
        "@typescript-eslint/no-unsafe-call": "off",
        "@typescript-eslint/no-unsafe-member-access": "off",
        "@typescript-eslint/no-unsafe-return": "off"
      }
    }
  ],
  ignorePatterns: ["**/*.d.ts", "dist/", "node_modules/"]
}
