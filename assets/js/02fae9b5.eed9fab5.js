"use strict";(self.webpackChunkdocs=self.webpackChunkdocs||[]).push([[331],{3905:function(e,n,t){t.d(n,{Zo:function(){return p},kt:function(){return f}});var r=t(67294);function a(e,n,t){return n in e?Object.defineProperty(e,n,{value:t,enumerable:!0,configurable:!0,writable:!0}):e[n]=t,e}function l(e,n){var t=Object.keys(e);if(Object.getOwnPropertySymbols){var r=Object.getOwnPropertySymbols(e);n&&(r=r.filter((function(n){return Object.getOwnPropertyDescriptor(e,n).enumerable}))),t.push.apply(t,r)}return t}function i(e){for(var n=1;n<arguments.length;n++){var t=null!=arguments[n]?arguments[n]:{};n%2?l(Object(t),!0).forEach((function(n){a(e,n,t[n])})):Object.getOwnPropertyDescriptors?Object.defineProperties(e,Object.getOwnPropertyDescriptors(t)):l(Object(t)).forEach((function(n){Object.defineProperty(e,n,Object.getOwnPropertyDescriptor(t,n))}))}return e}function o(e,n){if(null==e)return{};var t,r,a=function(e,n){if(null==e)return{};var t,r,a={},l=Object.keys(e);for(r=0;r<l.length;r++)t=l[r],n.indexOf(t)>=0||(a[t]=e[t]);return a}(e,n);if(Object.getOwnPropertySymbols){var l=Object.getOwnPropertySymbols(e);for(r=0;r<l.length;r++)t=l[r],n.indexOf(t)>=0||Object.prototype.propertyIsEnumerable.call(e,t)&&(a[t]=e[t])}return a}var u=r.createContext({}),m=function(e){var n=r.useContext(u),t=n;return e&&(t="function"==typeof e?e(n):i(i({},n),e)),t},p=function(e){var n=m(e.components);return r.createElement(u.Provider,{value:n},e.children)},s={inlineCode:"code",wrapper:function(e){var n=e.children;return r.createElement(r.Fragment,{},n)}},c=r.forwardRef((function(e,n){var t=e.components,a=e.mdxType,l=e.originalType,u=e.parentName,p=o(e,["components","mdxType","originalType","parentName"]),c=m(t),f=a,d=c["".concat(u,".").concat(f)]||c[f]||s[f]||l;return t?r.createElement(d,i(i({ref:n},p),{},{components:t})):r.createElement(d,i({ref:n},p))}));function f(e,n){var t=arguments,a=n&&n.mdxType;if("string"==typeof e||a){var l=t.length,i=new Array(l);i[0]=c;var o={};for(var u in n)hasOwnProperty.call(n,u)&&(o[u]=n[u]);o.originalType=e,o.mdxType="string"==typeof e?e:a,i[1]=o;for(var m=2;m<l;m++)i[m]=t[m];return r.createElement.apply(null,i)}return r.createElement.apply(null,t)}c.displayName="MDXCreateElement"},76647:function(e,n,t){t.r(n),t.d(n,{frontMatter:function(){return o},contentTitle:function(){return u},metadata:function(){return m},toc:function(){return p},default:function(){return c}});var r=t(87462),a=t(63366),l=(t(67294),t(3905)),i=["components"],o={},u="LuaEnum",m={type:"mdx",permalink:"/lua-enum-simple/",source:"@site/pages/index.md"},p=[],s={toc:p};function c(e){var n=e.components,t=(0,a.Z)(e,i);return(0,l.kt)("wrapper",(0,r.Z)({},s,t,{components:n,mdxType:"MDXLayout"}),(0,l.kt)("h1",{id:"luaenum"},"LuaEnum"),(0,l.kt)("p",null,"A super-simple enum type and a super-simple enum collection type."),(0,l.kt)("p",null,(0,l.kt)("a",{parentName:"p",href:"https://corecii.github.io/lua-enum-simple/"},"Documentation")),(0,l.kt)("p",null,"Install with ",(0,l.kt)("a",{parentName:"p",href:"https://wally.run"},"wally"),":"),(0,l.kt)("pre",null,(0,l.kt)("code",{parentName:"pre",className:"language-toml"},'# wally.toml\n[dependencies]\nLuaEnum = "corecii/lua-enum-simple@0.1.0"\n')),(0,l.kt)("p",null,(0,l.kt)("a",{parentName:"p",href:"https://github.com/Corecii/lua-enum-simple/releases/latest"},"or use a packaged release model")),(0,l.kt)("hr",null),(0,l.kt)("p",null,"Think Roblox's enums, not Rust's enums."),(0,l.kt)("p",null,"I couldn't find a good mix between serializability, debugability, and simplicity, so this module lets you choose between:"),(0,l.kt)("ul",null,(0,l.kt)("li",{parentName:"ul"},'"Id" representation, ',(0,l.kt)("inlineCode",{parentName:"li"},'"Animal.Dog"')),(0,l.kt)("li",{parentName:"ul"},'"ValueId" representation, ',(0,l.kt)("inlineCode",{parentName:"li"},'"Animal.1"')),(0,l.kt)("li",{parentName:"ul"},'"Name" representation, ',(0,l.kt)("inlineCode",{parentName:"li"},'"Dog"')),(0,l.kt)("li",{parentName:"ul"},'"Value" representation, ',(0,l.kt)("inlineCode",{parentName:"li"},"1")),(0,l.kt)("li",{parentName:"ul"},'"Symbol" representation, a userdata with ',(0,l.kt)("inlineCode",{parentName:"li"},'tostring(symbol) == "<Symbol Animal.Dog>"'))),(0,l.kt)("p",null,"It defaults to ",(0,l.kt)("inlineCode",{parentName:"p"},"Id")," representation."),(0,l.kt)("p",null,"Additionally, this module provides a way to turn a tree of modulescripts and folders into a tree of EnumCollections and Enums."),(0,l.kt)("hr",null),(0,l.kt)("p",null,"LuaEnum Example:"),(0,l.kt)("pre",null,(0,l.kt)("code",{parentName:"pre",className:"language-lua"},'local Animals = LuaEnum.new("Animals", {\n  Dog = 1,\n  Cat = 2,\n  Mouse = 3,\n})\n\nprint(Animals.Dog) --\x3e "Animals.Dog"\n\nprint(LuaEnum.is(Animals)) --\x3e true\n\nprint(LuaEnum.isItem(Animals, Animals.Dog)) --\x3e true\nprint(LuaEnum.isItem(Animals, "x")) --\x3e false\n\nlocal function speak(animal)\n  assert(LuaEnum.isItem(Animals, animal))\n\n  if animal == Animals.Dog then\n    print("woof")\n  elseif animal == Animals.Cat then\n    print("meow")\n  elseif animal == Animals.Mouse then\n    print("sque")\n  end\nend\n\nspeak(Animals.Cat) --\x3e "meow"\n\n-- Errors:\n\nlocal x = Animals.Lizard --\x3e Error: Item "Lizard" does not exist in LuaEnum Animals\n\nAnimals.Cat = 5 --\x3e Error: Attempt to modify a readonly table\n')))}c.isMDXComponent=!0}}]);