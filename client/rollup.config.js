import commonjs         from "@rollup/plugin-commonjs";
import resolve          from "@rollup/plugin-node-resolve";
import typescript       from "@rollup/plugin-typescript";
import copy             from "rollup-plugin-copy";
import css              from "rollup-plugin-css-only";
import livereload       from "rollup-plugin-livereload";
import replaceHtmlVars  from "rollup-plugin-replace-html-vars";
import svelte           from "rollup-plugin-svelte";
import { terser }       from "rollup-plugin-terser";
import smelte           from "smelte/rollup-plugin-smelte";
import sveltePreprocess from "svelte-preprocess";
import { sass }         from "svelte-preprocess-sass";


const production = !process.env.ROLLUP_WATCH;
const fingerprint = new Date().valueOf()

function serve() {
	let server;

	function toExit() {
		if (server) server.kill(0);
	}

	return {
		writeBundle() {
			if (server) return;
			server = require("child_process").spawn("npm", ["run", "start", "--", "--dev"], {
				stdio: ["ignore", "inherit", "inherit"],
				shell: true
			});

			process.on("SIGTERM", toExit);
			process.on("exit", toExit);
		}
	};
}

export default {
	input: "src/main.ts",
	output: {
		sourcemap: true,
		format: "iife",
		name: "app",
    entryFileNames: `bundle.${fingerprint}.js`,
    dir: "../public/build", // Path for storing prebuilt bundle files
	},
	plugins: [
    // If you have external dependencies installed from
		// npm, you"ll most likely need these plugins. In
		// some cases you"ll need additional configuration -
		// consult the documentation for details:
		// https://github.com/rollup/plugins/tree/master/packages/commonjs
    commonjs(),
		resolve({ browser: true, dedupe: ["svelte"] }),
		typescript({ sourceMap: true, inlineSources: !production }),

    // we"ll extract any component CSS out into a separate file - better for performance
    css({ output: `bundle.${fingerprint}.css`, sourceMap: true }),

    // Replace fingerprints of prebuilt bundle in index.html
    replaceHtmlVars({ files: "../public/index.html", from: /[0-9]{13,13}/gi, to: fingerprint }),

		svelte({
			preprocess: sveltePreprocess({
        sourceMap: !production,
        style: sass(),
      }),
      compilerOptions: {
        dev: !production,             // enable run-time checks when not in production
        enableSourcemap: !production  // Set to  true if you want them
      }
		}),

    smelte({
      purge: production,
      output: `../public/build/global.${fingerprint}.css`, // it defaults to static/global.css which is probably what you expect in Sapper
      postcss: [], // Your PostCSS plugins
      whitelist: [], // Array of classnames whitelisted from purging
      whitelistPatterns: [], // Same as above, but list of regexes
      tailwind: {
        colors: {
          primary: "#b027b0",
          secondary: "#009688",
          error: "#f44336",
          success: "#4caf50",
          alert: "#ff9800",
          blue: "#2196f3",
          dark: "#212121"
        }, // Object of colors to generate a palette from, and then all the utility classes
        darkMode: true,
      }
    })

    // Copy files from node_modules to build
    copy({ targets: [], verbose: !production }),

		!production && serve(),               // In dev mode, call `npm run start` once the bundle has been generated
		!production && livereload("public"),  // Watch the `public` directory and refresh the browser on changes when not in production
		production && terser()                // If we"re building for production (npm run build instead of npm run dev), minify
	],
	watch: { clearScreen: false }
};
