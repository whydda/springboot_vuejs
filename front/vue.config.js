module.exports = {
    assetsDir: "static",
    outputDir: "../src/main/resources/static",
    indexPath: "../templates/index.html",
    devServer: {
        proxy: "http://localhost"
    },
    chainWebpack: config => {
        const svgRule = config.module.rule("svg");

        svgRule.uses.clear();

        svgRule.use("vue-svg-loader").loader("vue-svg-loader");
    }
};