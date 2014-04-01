/* parser generated by jison 0.4.13 */
/*
  Returns a Parser object of the following structure:

  Parser: {
    yy: {}
  }

  Parser.prototype: {
    yy: {},
    trace: function(),
    symbols_: {associative list: name ==> number},
    terminals_: {associative list: number ==> name},
    productions_: [...],
    performAction: function anonymous(yytext, yyleng, yylineno, yy, yystate, $$, _$),
    table: [...],
    defaultActions: {...},
    parseError: function(str, hash),
    parse: function(input),

    lexer: {
        EOF: 1,
        parseError: function(str, hash),
        setInput: function(input),
        input: function(),
        unput: function(str),
        more: function(),
        less: function(n),
        pastInput: function(),
        upcomingInput: function(),
        showPosition: function(),
        test_match: function(regex_match_array, rule_index),
        next: function(),
        lex: function(),
        begin: function(condition),
        popState: function(),
        _currentRules: function(),
        topState: function(),
        pushState: function(condition),

        options: {
            ranges: boolean           (optional: true ==> token location info will include a .range[] member)
            flex: boolean             (optional: true ==> flex-like lexing behaviour where the rules are tested exhaustively to find the longest match)
            backtrack_lexer: boolean  (optional: true ==> lexer regexes are tested in order and for each matching regex the action code is invoked; the lexer terminates the scan when a token is returned by the action code)
        },

        performAction: function(yy, yy_, $avoiding_name_collisions, YY_START),
        rules: [...],
        conditions: {associative list: name ==> set},
    }
  }


  token location info (@$, _$, etc.): {
    first_line: n,
    last_line: n,
    first_column: n,
    last_column: n,
    range: [start_number, end_number]       (where the numbers are indexes into the input string, regular zero-based)
  }


  the parseError function receives a 'hash' object with these members for lexer and parser errors: {
    text:        (matched text)
    token:       (the produced terminal token, if any)
    line:        (yylineno)
  }
  while parser (grammar) errors will also provide these members, i.e. parser errors deliver a superset of attributes: {
    loc:         (yylloc)
    expected:    (string describing the set of expected tokens)
    recoverable: (boolean: TRUE when the parser has a error recovery rule available for this particular error)
  }
*/
var kaladin = (function(){
var parser = {trace: function trace() { },
yy: {},
symbols_: {"error":2,"expressions":3,"program":4,"EOF":5,"op":6,"*":7,"+":8,"-":9,"^":10,"/":11,"function":12,";":13,"DEF":14,"NAME":15,"(":16,"optargs":17,")":18,"body":19,",":20,"args":21,"expr":22,"{":23,"exprs":24,"}":25,"decl":26,"=":27,"cond":28,"OR":29,"AND":30,"NOT":31,"COMP":32,"ifrest":33,"ELSE":34,"ELSEIF":35,"ifst":36,"IF":37,"whilest":38,"WHILE":39,"operand":40,"NONE":41,"NUMBER":42,"STRING":43,"DEC":44,"INC":45,"opreand":46,"RETURN":47,"$accept":0,"$end":1},
terminals_: {2:"error",5:"EOF",7:"*",8:"+",9:"-",10:"^",11:"/",13:";",14:"DEF",15:"NAME",16:"(",18:")",20:",",23:"{",25:"}",27:"=",29:"OR",30:"AND",31:"NOT",32:"COMP",34:"ELSE",35:"ELSEIF",37:"IF",39:"WHILE",41:"NONE",42:"NUMBER",43:"STRING",44:"DEC",45:"INC",46:"opreand",47:"RETURN"},
productions_: [0,[3,2],[6,1],[6,1],[6,1],[6,1],[6,1],[4,3],[4,2],[12,6],[17,0],[17,3],[17,1],[21,0],[21,3],[21,1],[19,3],[26,3],[28,1],[28,3],[28,3],[28,2],[28,3],[33,0],[33,2],[33,6],[36,6],[38,5],[40,1],[40,1],[40,1],[40,1],[40,2],[40,2],[40,4],[40,5],[40,4],[40,3],[22,2],[22,2],[22,3],[22,1],[22,1],[22,1],[24,3],[24,3],[24,2],[24,2]],
performAction: function anonymous(yytext, yyleng, yylineno, yy, yystate /* action[1] */, $$ /* vstack */, _$ /* lstack */) {
/* this == yyval */

var $0 = $$.length - 1;
switch (yystate) {
}
},
table: [{3:1,4:2,12:3,14:[1,4]},{1:[3]},{5:[1,5],12:6,14:[1,4]},{13:[1,7]},{15:[1,8]},{1:[2,1]},{13:[1,9]},{5:[2,8],14:[2,8]},{16:[1,10]},{5:[2,7],14:[2,7]},{15:[1,12],17:11,18:[2,10],20:[2,10]},{18:[1,13],20:[1,14]},{18:[2,12],20:[2,12]},{19:15,23:[1,16]},{15:[1,17]},{13:[2,9]},{6:22,7:[1,27],8:[1,28],9:[1,29],10:[1,30],11:[1,31],15:[1,26],16:[1,35],22:19,24:18,26:20,36:24,37:[1,36],38:25,39:[1,37],40:23,41:[1,32],42:[1,33],43:[1,34],47:[1,21]},{18:[2,11],20:[2,11]},{6:22,7:[1,27],8:[1,28],9:[1,29],10:[1,30],11:[1,31],15:[1,26],16:[1,35],22:40,25:[1,38],26:39,36:24,37:[1,36],38:25,39:[1,37],40:23,41:[1,32],42:[1,33],43:[1,34],47:[1,21]},{13:[1,41]},{13:[1,42]},{6:22,7:[1,27],8:[1,28],9:[1,29],10:[1,30],11:[1,31],15:[1,44],16:[1,35],22:43,36:24,37:[1,36],38:25,39:[1,37],40:23,41:[1,32],42:[1,33],43:[1,34],47:[1,21]},{15:[1,44],16:[1,35],40:45,41:[1,32],42:[1,33],43:[1,34]},{6:46,7:[1,27],8:[1,28],9:[1,29],10:[1,30],11:[1,31],13:[2,43],18:[2,43],20:[2,43],29:[2,43],30:[2,43],32:[2,43]},{13:[2,41],18:[2,41],20:[2,41],29:[2,41],30:[2,41],32:[2,41]},{13:[2,42],18:[2,42],20:[2,42],29:[2,42],30:[2,42],32:[2,42]},{7:[2,29],8:[2,29],9:[2,29],10:[2,29],11:[2,29],13:[2,29],16:[1,50],27:[1,47],44:[1,48],45:[1,49]},{15:[2,2],16:[2,2],41:[2,2],42:[2,2],43:[2,2],46:[2,2]},{15:[2,3],16:[2,3],41:[2,3],42:[2,3],43:[2,3],46:[2,3]},{15:[2,4],16:[2,4],41:[2,4],42:[2,4],43:[2,4],46:[2,4]},{15:[2,5],16:[2,5],41:[2,5],42:[2,5],43:[2,5],46:[2,5]},{15:[2,6],16:[2,6],41:[2,6],42:[2,6],43:[2,6],46:[2,6]},{7:[2,28],8:[2,28],9:[2,28],10:[2,28],11:[2,28],13:[2,28],18:[2,28],20:[2,28],29:[2,28],30:[2,28],32:[2,28]},{7:[2,30],8:[2,30],9:[2,30],10:[2,30],11:[2,30],13:[2,30],18:[2,30],20:[2,30],29:[2,30],30:[2,30],32:[2,30]},{7:[2,31],8:[2,31],9:[2,31],10:[2,31],11:[2,31],13:[2,31],18:[2,31],20:[2,31],29:[2,31],30:[2,31],32:[2,31]},{6:52,7:[1,27],8:[1,28],9:[1,29],10:[1,30],11:[1,31],15:[1,44],16:[1,35],40:51,41:[1,32],42:[1,33],43:[1,34]},{16:[1,53]},{16:[1,54]},{13:[2,16],18:[2,16],20:[2,16],29:[2,16],30:[2,16],32:[2,16],34:[2,16],35:[2,16]},{13:[1,55]},{13:[1,56]},{7:[2,46],8:[2,46],9:[2,46],10:[2,46],11:[2,46],15:[2,46],16:[2,46],25:[2,46],37:[2,46],39:[2,46],41:[2,46],42:[2,46],43:[2,46],47:[2,46]},{7:[2,47],8:[2,47],9:[2,47],10:[2,47],11:[2,47],15:[2,47],16:[2,47],25:[2,47],37:[2,47],39:[2,47],41:[2,47],42:[2,47],43:[2,47],47:[2,47]},{13:[2,38],18:[2,38],20:[2,38],29:[2,38],30:[2,38],32:[2,38]},{7:[2,29],8:[2,29],9:[2,29],10:[2,29],11:[2,29],13:[2,29],16:[1,50],18:[2,29],20:[2,29],29:[2,29],30:[2,29],32:[2,29],44:[1,48],45:[1,49]},{13:[2,39],18:[2,39],20:[2,39],29:[2,39],30:[2,39],32:[2,39]},{15:[1,44],16:[1,35],40:57,41:[1,32],42:[1,33],43:[1,34]},{6:22,7:[1,27],8:[1,28],9:[1,29],10:[1,30],11:[1,31],15:[1,44],16:[1,35],22:58,36:24,37:[1,36],38:25,39:[1,37],40:23,41:[1,32],42:[1,33],43:[1,34],47:[1,21]},{7:[2,32],8:[2,32],9:[2,32],10:[2,32],11:[2,32],13:[2,32],18:[2,32],20:[2,32],29:[2,32],30:[2,32],32:[2,32]},{7:[2,33],8:[2,33],9:[2,33],10:[2,33],11:[2,33],13:[2,33],18:[2,33],20:[2,33],29:[2,33],30:[2,33],32:[2,33]},{6:22,7:[1,27],8:[1,28],9:[1,29],10:[1,30],11:[1,31],15:[1,44],16:[1,35],18:[2,13],20:[2,13],21:59,22:60,36:24,37:[1,36],38:25,39:[1,37],40:23,41:[1,32],42:[1,33],43:[1,34],47:[1,21]},{6:61,7:[1,27],8:[1,28],9:[1,29],10:[1,30],11:[1,31],18:[1,62]},{46:[1,63]},{6:22,7:[1,27],8:[1,28],9:[1,29],10:[1,30],11:[1,31],15:[1,44],16:[1,35],22:65,28:64,31:[1,66],36:24,37:[1,36],38:25,39:[1,37],40:23,41:[1,32],42:[1,33],43:[1,34],47:[1,21]},{6:22,7:[1,27],8:[1,28],9:[1,29],10:[1,30],11:[1,31],15:[1,44],16:[1,35],22:65,28:67,31:[1,66],36:24,37:[1,36],38:25,39:[1,37],40:23,41:[1,32],42:[1,33],43:[1,34],47:[1,21]},{7:[2,44],8:[2,44],9:[2,44],10:[2,44],11:[2,44],15:[2,44],16:[2,44],25:[2,44],37:[2,44],39:[2,44],41:[2,44],42:[2,44],43:[2,44],47:[2,44]},{7:[2,45],8:[2,45],9:[2,45],10:[2,45],11:[2,45],15:[2,45],16:[2,45],25:[2,45],37:[2,45],39:[2,45],41:[2,45],42:[2,45],43:[2,45],47:[2,45]},{13:[2,40],18:[2,40],20:[2,40],29:[2,40],30:[2,40],32:[2,40]},{13:[2,17]},{18:[1,68],20:[1,69]},{18:[2,15],20:[2,15]},{15:[1,44],16:[1,35],40:70,41:[1,32],42:[1,33],43:[1,34]},{7:[2,37],8:[2,37],9:[2,37],10:[2,37],11:[2,37],13:[2,37],18:[2,37],20:[2,37],29:[2,37],30:[2,37],32:[2,37]},{18:[1,71]},{18:[1,72]},{18:[2,18],29:[1,73],30:[1,74],32:[1,75]},{6:22,7:[1,27],8:[1,28],9:[1,29],10:[1,30],11:[1,31],15:[1,44],16:[1,35],22:65,28:76,31:[1,66],36:24,37:[1,36],38:25,39:[1,37],40:23,41:[1,32],42:[1,33],43:[1,34],47:[1,21]},{18:[1,77]},{7:[2,34],8:[2,34],9:[2,34],10:[2,34],11:[2,34],13:[2,34],18:[2,34],20:[2,34],29:[2,34],30:[2,34],32:[2,34]},{6:22,7:[1,27],8:[1,28],9:[1,29],10:[1,30],11:[1,31],15:[1,44],16:[1,35],22:78,36:24,37:[1,36],38:25,39:[1,37],40:23,41:[1,32],42:[1,33],43:[1,34],47:[1,21]},{18:[1,79]},{7:[2,36],8:[2,36],9:[2,36],10:[2,36],11:[2,36],13:[2,36],18:[2,36],20:[2,36],29:[2,36],30:[2,36],32:[2,36]},{19:80,23:[1,16]},{6:22,7:[1,27],8:[1,28],9:[1,29],10:[1,30],11:[1,31],15:[1,44],16:[1,35],22:65,28:81,31:[1,66],36:24,37:[1,36],38:25,39:[1,37],40:23,41:[1,32],42:[1,33],43:[1,34],47:[1,21]},{6:22,7:[1,27],8:[1,28],9:[1,29],10:[1,30],11:[1,31],15:[1,44],16:[1,35],22:65,28:82,31:[1,66],36:24,37:[1,36],38:25,39:[1,37],40:23,41:[1,32],42:[1,33],43:[1,34],47:[1,21]},{6:22,7:[1,27],8:[1,28],9:[1,29],10:[1,30],11:[1,31],15:[1,44],16:[1,35],22:83,36:24,37:[1,36],38:25,39:[1,37],40:23,41:[1,32],42:[1,33],43:[1,34],47:[1,21]},{18:[2,21]},{19:84,23:[1,16]},{18:[2,14],20:[2,14]},{7:[2,35],8:[2,35],9:[2,35],10:[2,35],11:[2,35],13:[2,35],18:[2,35],20:[2,35],29:[2,35],30:[2,35],32:[2,35]},{13:[2,23],18:[2,23],20:[2,23],29:[2,23],30:[2,23],32:[2,23],33:85,34:[1,86],35:[1,87]},{18:[2,19]},{18:[2,20]},{18:[2,22]},{13:[2,27],18:[2,27],20:[2,27],29:[2,27],30:[2,27],32:[2,27]},{13:[2,26],18:[2,26],20:[2,26],29:[2,26],30:[2,26],32:[2,26]},{19:88,23:[1,16]},{16:[1,89]},{13:[2,24],18:[2,24],20:[2,24],29:[2,24],30:[2,24],32:[2,24]},{6:22,7:[1,27],8:[1,28],9:[1,29],10:[1,30],11:[1,31],15:[1,44],16:[1,35],22:65,28:90,31:[1,66],36:24,37:[1,36],38:25,39:[1,37],40:23,41:[1,32],42:[1,33],43:[1,34],47:[1,21]},{18:[1,91]},{19:92,23:[1,16]},{13:[2,23],18:[2,23],20:[2,23],29:[2,23],30:[2,23],32:[2,23],33:93,34:[1,86],35:[1,87]},{13:[2,25],18:[2,25],20:[2,25],29:[2,25],30:[2,25],32:[2,25]}],
defaultActions: {5:[2,1],15:[2,9],58:[2,17],76:[2,21],81:[2,19],82:[2,20],83:[2,22]},
parseError: function parseError(str, hash) {
    if (hash.recoverable) {
        this.trace(str);
    } else {
        throw new Error(str);
    }
},
parse: function parse(input) {
    var self = this, stack = [0], vstack = [null], lstack = [], table = this.table, yytext = '', yylineno = 0, yyleng = 0, recovering = 0, TERROR = 2, EOF = 1;
    var args = lstack.slice.call(arguments, 1);
    this.lexer.setInput(input);
    this.lexer.yy = this.yy;
    this.yy.lexer = this.lexer;
    this.yy.parser = this;
    if (typeof this.lexer.yylloc == 'undefined') {
        this.lexer.yylloc = {};
    }
    var yyloc = this.lexer.yylloc;
    lstack.push(yyloc);
    var ranges = this.lexer.options && this.lexer.options.ranges;
    if (typeof this.yy.parseError === 'function') {
        this.parseError = this.yy.parseError;
    } else {
        this.parseError = Object.getPrototypeOf(this).parseError;
    }
    function popStack(n) {
        stack.length = stack.length - 2 * n;
        vstack.length = vstack.length - n;
        lstack.length = lstack.length - n;
    }
    function lex() {
        var token;
        token = self.lexer.lex() || EOF;
        if (typeof token !== 'number') {
            token = self.symbols_[token] || token;
        }
        return token;
    }
    var symbol, preErrorSymbol, state, action, a, r, yyval = {}, p, len, newState, expected;
    while (true) {
        state = stack[stack.length - 1];
        if (this.defaultActions[state]) {
            action = this.defaultActions[state];
        } else {
            if (symbol === null || typeof symbol == 'undefined') {
                symbol = lex();
            }
            action = table[state] && table[state][symbol];
        }
                    if (typeof action === 'undefined' || !action.length || !action[0]) {
                var errStr = '';
                expected = [];
                for (p in table[state]) {
                    if (this.terminals_[p] && p > TERROR) {
                        expected.push('\'' + this.terminals_[p] + '\'');
                    }
                }
                if (this.lexer.showPosition) {
                    errStr = 'Parse error on line ' + (yylineno + 1) + ':\n' + this.lexer.showPosition() + '\nExpecting ' + expected.join(', ') + ', got \'' + (this.terminals_[symbol] || symbol) + '\'';
                } else {
                    errStr = 'Parse error on line ' + (yylineno + 1) + ': Unexpected ' + (symbol == EOF ? 'end of input' : '\'' + (this.terminals_[symbol] || symbol) + '\'');
                }
                this.parseError(errStr, {
                    text: this.lexer.match,
                    token: this.terminals_[symbol] || symbol,
                    line: this.lexer.yylineno,
                    loc: yyloc,
                    expected: expected
                });
            }
        if (action[0] instanceof Array && action.length > 1) {
            throw new Error('Parse Error: multiple actions possible at state: ' + state + ', token: ' + symbol);
        }
        switch (action[0]) {
        case 1:
            stack.push(symbol);
            vstack.push(this.lexer.yytext);
            lstack.push(this.lexer.yylloc);
            stack.push(action[1]);
            symbol = null;
            if (!preErrorSymbol) {
                yyleng = this.lexer.yyleng;
                yytext = this.lexer.yytext;
                yylineno = this.lexer.yylineno;
                yyloc = this.lexer.yylloc;
                if (recovering > 0) {
                    recovering--;
                }
            } else {
                symbol = preErrorSymbol;
                preErrorSymbol = null;
            }
            break;
        case 2:
            len = this.productions_[action[1]][1];
            yyval.$ = vstack[vstack.length - len];
            yyval._$ = {
                first_line: lstack[lstack.length - (len || 1)].first_line,
                last_line: lstack[lstack.length - 1].last_line,
                first_column: lstack[lstack.length - (len || 1)].first_column,
                last_column: lstack[lstack.length - 1].last_column
            };
            if (ranges) {
                yyval._$.range = [
                    lstack[lstack.length - (len || 1)].range[0],
                    lstack[lstack.length - 1].range[1]
                ];
            }
            r = this.performAction.apply(yyval, [
                yytext,
                yyleng,
                yylineno,
                this.yy,
                action[1],
                vstack,
                lstack
            ].concat(args));
            if (typeof r !== 'undefined') {
                return r;
            }
            if (len) {
                stack = stack.slice(0, -1 * len * 2);
                vstack = vstack.slice(0, -1 * len);
                lstack = lstack.slice(0, -1 * len);
            }
            stack.push(this.productions_[action[1]][0]);
            vstack.push(yyval.$);
            lstack.push(yyval._$);
            newState = table[stack[stack.length - 2]][stack[stack.length - 1]];
            stack.push(newState);
            break;
        case 3:
            return true;
        }
    }
    return true;
}};

/* generated by jison-lex 0.2.1 */
var lexer = (function(){
var lexer = {

EOF:1,

parseError:function parseError(str, hash) {
        if (this.yy.parser) {
            this.yy.parser.parseError(str, hash);
        } else {
            throw new Error(str);
        }
    },

// resets the lexer, sets new input
setInput:function (input) {
        this._input = input;
        this._more = this._backtrack = this.done = false;
        this.yylineno = this.yyleng = 0;
        this.yytext = this.matched = this.match = '';
        this.conditionStack = ['INITIAL'];
        this.yylloc = {
            first_line: 1,
            first_column: 0,
            last_line: 1,
            last_column: 0
        };
        if (this.options.ranges) {
            this.yylloc.range = [0,0];
        }
        this.offset = 0;
        return this;
    },

// consumes and returns one char from the input
input:function () {
        var ch = this._input[0];
        this.yytext += ch;
        this.yyleng++;
        this.offset++;
        this.match += ch;
        this.matched += ch;
        var lines = ch.match(/(?:\r\n?|\n).*/g);
        if (lines) {
            this.yylineno++;
            this.yylloc.last_line++;
        } else {
            this.yylloc.last_column++;
        }
        if (this.options.ranges) {
            this.yylloc.range[1]++;
        }

        this._input = this._input.slice(1);
        return ch;
    },

// unshifts one char (or a string) into the input
unput:function (ch) {
        var len = ch.length;
        var lines = ch.split(/(?:\r\n?|\n)/g);

        this._input = ch + this._input;
        this.yytext = this.yytext.substr(0, this.yytext.length - len - 1);
        //this.yyleng -= len;
        this.offset -= len;
        var oldLines = this.match.split(/(?:\r\n?|\n)/g);
        this.match = this.match.substr(0, this.match.length - 1);
        this.matched = this.matched.substr(0, this.matched.length - 1);

        if (lines.length - 1) {
            this.yylineno -= lines.length - 1;
        }
        var r = this.yylloc.range;

        this.yylloc = {
            first_line: this.yylloc.first_line,
            last_line: this.yylineno + 1,
            first_column: this.yylloc.first_column,
            last_column: lines ?
                (lines.length === oldLines.length ? this.yylloc.first_column : 0)
                 + oldLines[oldLines.length - lines.length].length - lines[0].length :
              this.yylloc.first_column - len
        };

        if (this.options.ranges) {
            this.yylloc.range = [r[0], r[0] + this.yyleng - len];
        }
        this.yyleng = this.yytext.length;
        return this;
    },

// When called from action, caches matched text and appends it on next action
more:function () {
        this._more = true;
        return this;
    },

// When called from action, signals the lexer that this rule fails to match the input, so the next matching rule (regex) should be tested instead.
reject:function () {
        if (this.options.backtrack_lexer) {
            this._backtrack = true;
        } else {
            return this.parseError('Lexical error on line ' + (this.yylineno + 1) + '. You can only invoke reject() in the lexer when the lexer is of the backtracking persuasion (options.backtrack_lexer = true).\n' + this.showPosition(), {
                text: "",
                token: null,
                line: this.yylineno
            });

        }
        return this;
    },

// retain first n characters of the match
less:function (n) {
        this.unput(this.match.slice(n));
    },

// displays already matched input, i.e. for error messages
pastInput:function () {
        var past = this.matched.substr(0, this.matched.length - this.match.length);
        return (past.length > 20 ? '...':'') + past.substr(-20).replace(/\n/g, "");
    },

// displays upcoming input, i.e. for error messages
upcomingInput:function () {
        var next = this.match;
        if (next.length < 20) {
            next += this._input.substr(0, 20-next.length);
        }
        return (next.substr(0,20) + (next.length > 20 ? '...' : '')).replace(/\n/g, "");
    },

// displays the character position where the lexing error occurred, i.e. for error messages
showPosition:function () {
        var pre = this.pastInput();
        var c = new Array(pre.length + 1).join("-");
        return pre + this.upcomingInput() + "\n" + c + "^";
    },

// test the lexed token: return FALSE when not a match, otherwise return token
test_match:function (match, indexed_rule) {
        var token,
            lines,
            backup;

        if (this.options.backtrack_lexer) {
            // save context
            backup = {
                yylineno: this.yylineno,
                yylloc: {
                    first_line: this.yylloc.first_line,
                    last_line: this.last_line,
                    first_column: this.yylloc.first_column,
                    last_column: this.yylloc.last_column
                },
                yytext: this.yytext,
                match: this.match,
                matches: this.matches,
                matched: this.matched,
                yyleng: this.yyleng,
                offset: this.offset,
                _more: this._more,
                _input: this._input,
                yy: this.yy,
                conditionStack: this.conditionStack.slice(0),
                done: this.done
            };
            if (this.options.ranges) {
                backup.yylloc.range = this.yylloc.range.slice(0);
            }
        }

        lines = match[0].match(/(?:\r\n?|\n).*/g);
        if (lines) {
            this.yylineno += lines.length;
        }
        this.yylloc = {
            first_line: this.yylloc.last_line,
            last_line: this.yylineno + 1,
            first_column: this.yylloc.last_column,
            last_column: lines ?
                         lines[lines.length - 1].length - lines[lines.length - 1].match(/\r?\n?/)[0].length :
                         this.yylloc.last_column + match[0].length
        };
        this.yytext += match[0];
        this.match += match[0];
        this.matches = match;
        this.yyleng = this.yytext.length;
        if (this.options.ranges) {
            this.yylloc.range = [this.offset, this.offset += this.yyleng];
        }
        this._more = false;
        this._backtrack = false;
        this._input = this._input.slice(match[0].length);
        this.matched += match[0];
        token = this.performAction.call(this, this.yy, this, indexed_rule, this.conditionStack[this.conditionStack.length - 1]);
        if (this.done && this._input) {
            this.done = false;
        }
        if (token) {
            return token;
        } else if (this._backtrack) {
            // recover context
            for (var k in backup) {
                this[k] = backup[k];
            }
            return false; // rule action called reject() implying the next rule should be tested instead.
        }
        return false;
    },

// return next match in input
next:function () {
        if (this.done) {
            return this.EOF;
        }
        if (!this._input) {
            this.done = true;
        }

        var token,
            match,
            tempMatch,
            index;
        if (!this._more) {
            this.yytext = '';
            this.match = '';
        }
        var rules = this._currentRules();
        for (var i = 0; i < rules.length; i++) {
            tempMatch = this._input.match(this.rules[rules[i]]);
            if (tempMatch && (!match || tempMatch[0].length > match[0].length)) {
                match = tempMatch;
                index = i;
                if (this.options.backtrack_lexer) {
                    token = this.test_match(tempMatch, rules[i]);
                    if (token !== false) {
                        return token;
                    } else if (this._backtrack) {
                        match = false;
                        continue; // rule action called reject() implying a rule MISmatch.
                    } else {
                        // else: this is a lexer rule which consumes input without producing a token (e.g. whitespace)
                        return false;
                    }
                } else if (!this.options.flex) {
                    break;
                }
            }
        }
        if (match) {
            token = this.test_match(match, rules[index]);
            if (token !== false) {
                return token;
            }
            // else: this is a lexer rule which consumes input without producing a token (e.g. whitespace)
            return false;
        }
        if (this._input === "") {
            return this.EOF;
        } else {
            return this.parseError('Lexical error on line ' + (this.yylineno + 1) + '. Unrecognized text.\n' + this.showPosition(), {
                text: "",
                token: null,
                line: this.yylineno
            });
        }
    },

// return next match that has a token
lex:function lex() {
        var r = this.next();
        if (r) {
            return r;
        } else {
            return this.lex();
        }
    },

// activates a new lexer condition state (pushes the new lexer condition state onto the condition stack)
begin:function begin(condition) {
        this.conditionStack.push(condition);
    },

// pop the previously active lexer condition state off the condition stack
popState:function popState() {
        var n = this.conditionStack.length - 1;
        if (n > 0) {
            return this.conditionStack.pop();
        } else {
            return this.conditionStack[0];
        }
    },

// produce the lexer rule set which is active for the currently active lexer condition state
_currentRules:function _currentRules() {
        if (this.conditionStack.length && this.conditionStack[this.conditionStack.length - 1]) {
            return this.conditions[this.conditionStack[this.conditionStack.length - 1]].rules;
        } else {
            return this.conditions["INITIAL"].rules;
        }
    },

// return the currently active lexer condition state; when an index argument is provided it produces the N-th previous condition state, if available
topState:function topState(n) {
        n = this.conditionStack.length - 1 - Math.abs(n || 0);
        if (n >= 0) {
            return this.conditionStack[n];
        } else {
            return "INITIAL";
        }
    },

// alias for begin(condition)
pushState:function pushState(condition) {
        this.begin(condition);
    },

// return the number of states currently on the stack
stateStackSize:function stateStackSize() {
        return this.conditionStack.length;
    },
options: {},
performAction: function anonymous(yy,yy_,$avoiding_name_collisions,YY_START) {

var YYSTATE=YY_START;
switch($avoiding_name_collisions) {
case 0:return false;
break;
case 1:return false;
break;
case 2:return "DEF";
break;
case 3:return "WHILE";
break;
case 4:return "IF";
break;
case 5:return "ELSEIF";
break;
case 6:return "ELSE";
break;
case 7:return "AND";
break;
case 8:return "OR";
break;
case 9:return "NOT";
break;
case 10:return "TRUE";
break;
case 11:return "FALSE";
break;
case 12:return "RETURN";
break;
case 13:return "(";
break;
case 14:return ")";
break;
case 15:return "{";
break;
case 16:return "}";
break;
case 17:return "NONE";
break;
case 18:return "COMP";
break;
case 19:return "=";
break;
case 20:return 10;
break;
case 21:return 7;
break;
case 22:return 11;
break;
case 23:return 45;
break;
case 24:return 44;
break;
case 25:return 9;
break;
case 26:return 8;
break;
case 27:return ",";
break;
case 28:return ":";
break;
case 29:return ";";
break;
case 30:return "COMP";
break;
case 31:return "STRING";
break;
case 32:return "NUMBER";
break;
case 33:return "NAME";
break;
case 34:return 5;
break;
}
},
rules: [/^(?:^#.*)/,/^(?:\s)/,/^(?:def\b)/,/^(?:while\b)/,/^(?:if\b)/,/^(?:else if\b)/,/^(?:else\b)/,/^(?:and\b)/,/^(?:or\b)/,/^(?:not\b)/,/^(?:true\b)/,/^(?:false\b)/,/^(?:return\b)/,/^(?:\()/,/^(?:\))/,/^(?:\{)/,/^(?:\})/,/^(?:None\b)/,/^(?:==)/,/^(?:=)/,/^(?:\^)/,/^(?:\*)/,/^(?:\/)/,/^(?:\+\+)/,/^(?:--)/,/^(?:-)/,/^(?:\+)/,/^(?:,)/,/^(?::)/,/^(?:;)/,/^(?:[\<\>][\=]?)/,/^(?:"[^\"]*")/,/^(?:[0-9]+(\.[0-9]+)?\b)/,/^(?:[A-Za-z]([A-Za-z0-9])*)/,/^(?:$)/],
conditions: {"INITIAL":{"rules":[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34],"inclusive":true}}
};
return lexer;
})();
parser.lexer = lexer;
function Parser () {
  this.yy = {};
}
Parser.prototype = parser;parser.Parser = Parser;
return new Parser;
})();


if (typeof require !== 'undefined' && typeof exports !== 'undefined') {
exports.parser = kaladin;
exports.Parser = kaladin.Parser;
exports.parse = function () { return kaladin.parse.apply(kaladin, arguments); };
exports.main = function commonjsMain(args) {
    if (!args[1]) {
        console.log('Usage: '+args[0]+' FILE');
        process.exit(1);
    }
    var source = require('fs').readFileSync(require('path').normalize(args[1]), "utf8");
    return exports.parser.parse(source);
};
if (typeof module !== 'undefined' && require.main === module) {
  exports.main(process.argv.slice(1));
}
}