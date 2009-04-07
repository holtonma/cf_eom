/*
|-----------------------------------------------------------------------------|
|                                sDumper 1.1                                  |
|-----------------------------------------------------------------------------|
|                                Developed By:                                |
|                              Joshua Blackburn                               |
|                         (http://joshuablackburn.com)                        |
|-----------------------------------------------------------------------------|
| JavaScript data structure visualization.                                    |
| IE 6 + Firefox + Opera                                                      |
| Please email me any bugs or enhancements @ joshua.blackburn@gmail.com       |
|-----------------------------------------------------------------------------|
| GPL - The GNU General Public License    http://www.gnu.org/licenses/gpl.txt |
| Permits anyone the right to use and modify the software without limitations |
| as long as proper  credits are given  and the original  and modified source |
| code are included. Requires  that the final product, software derivate from |
| the original  source or any  software  utilizing a GPL  component, such  as |
| this, is also licensed under the GPL license.                               |
|-----------------------------------------------------------------------------|
| September 2004 | sDumper created                                            |
| March     2005 | sDumper 1.0.  Optimization and cross-browser support.      |
| November  2005 | sDumper 1.1.  Support for domelement and domcollection.    |
|-----------------------------------------------------------------------------|
| Usage:                                                                      |
|   sDumper(args [,args..N]);                                                 |
| Example:                                                                    |
|   SDumper([1,2,3], 'string', { a : 1 }, /[A-Z]/, 23, variable);             |
|-----------------------------------------------------------------------------|
*/

var sDumperRef = "", dumpObjs = 0;

function sDumper() {
  if ( sDumperRef == "" ) { sDumperRef = new _sDumper(); }
 
  switch ( arguments.length ) { 
    case 0:
      return;
      break;
    case 1:
      sDumperRef.sDrawDumper(arguments[0]);
      break;
    default:
      for ( var t = 0; t < arguments.length; t++ ) {
	sDumperRef.sDrawDumper(arguments[t]);
      }
  }

  sDumperRef.finishDumper();
}

function _sDumper() {
  this.str = ['<div>'];
  this.dumperColors = {
    varray             : ['#8b008b', '#FFF'],
    vobject            : ['#836fff', '#000'],
    vregex             : ['#cd3700', '#FFF'],
    vstring            : ['#66cd00', '#000'],
    vnumber            : ['#caff70', '#000'],
    vdate              : ['#EEEE00', '#000'],
    vmath              : ['#8b'    , '#FFF'],
    vfunction          : ['#53868b', '#FFF'],
    vboolean           : ['#ffa500', '#000'],
    vwindow            : ['#FFACAC', '#000'],
    vevent             : ['#000'   , '#fff'],
    vdomelement        : ['#cd6839', '#000'],
    vtextnode          : ['#cd6839', '#000'],
    vtextrange         : ['#cd6839', '#000'],
    verror             : ['#FFF'   , '#fff'],
    varguments         : ['#cd8500', '#000'],
    vdomcollection     : ['#cd6839', '#000'],
    vplugincollection  : ['#cd6839', '#000'],
    vmimetypecollection: ['#cd6839', '#000'],
    vnull              : ['#000'   , '#fff'],
    vundefined         : ['#000'   , '#fff']
  };
  this.myType;
  this.myCounter = 0;
  this.myTypeChild;
  this.htmldocument = false; // IE and Opera go into an infinite loop when dumping document.  Only allow document to recurse once.

  this.beginTags = '<tr><td onClick="if(this.parentNode.childNodes[1].style.display != \'none\'){this.parentNode.childNodes[1].style.display = \'none\';this.style.fontStyle = \'italic\';this.style.fontWeight = \'bold\';}else{ this.parentNode.childNodes[1].style.display = \'block\';this.style.fontStyle = \'normal\';this.style.fontWeight = \'normal\';}" onMouseOver="this.style.cursor = \'pointer\';" style="width:1.2em;padding:2px 2px 2px 2px;text-align:left;vertical-align:top;font-size:11px;color:#000;background:#CCC;border:1px solid #000;font-family:verdana;background:';

  this.middleTags = '</td><td style="padding:2px 2px 2px 2px;text-align:left;vertical-align:top;font-size:11px;color:#000;background:#DDD;font-family:verdana;border:1px solid #000;"><pre>';

  this.endTags = '</pre></td></tr>';

  this.nullTags = '<tr><td onClick="if(this.parentNode.childNodes[1].style.display != \'none\'){this.parentNode.childNodes[1].style.display = \'none\';this.style.fontStyle = \'italic\';this.style.fontWeight = \'bold\';}else{ this.parentNode.childNodes[1].style.display = \'block\';this.style.fontStyle = \'normal\';this.style.fontWeight = \'normal\';}" onMouseOver="this.style.cursor = \'pointer\';" class="dumper_type" style="width:1.2em;background:'+this.dumperColors['vnull'][0]+';color:'+this.dumperColors['vnull'][1]+';">';

  
}

_sDumper.prototype.sDrawDumper = function (dumpVar) {
  this.myCounter = this.myCounter + 1;
  this.myType = this.tf(dumpVar);

  this.str.push('<table cellspacing="0">');

  switch ( this.myType ) {
    case 'error':
    case 'object':
    case 'htmldocument':
      if ( this.htmldocument && this.myType == 'htmldocument' ) break; 
      this.htmldocument = true;
      for ( var i in dumpVar ) {
        try {
          this.myCounter = this.myCounter + 1;
          if ( dumpVar[i] != null ) {
            this.myTypeChild = this.tf(dumpVar[i]); 
            this.str.push(this.beginTags + (this.dumperColors["v" + this.myTypeChild] ? this.dumperColors["v" + this.myTypeChild][0] : "#FFF") + ';color:' + (this.dumperColors["v" + this.myTypeChild] ? this.dumperColors["v" + this.myTypeChild][1] : "#FFF")+';">' + i + this.middleTags);
            switch ( typeof(dumpVar[i]) ) {
              case 'object':
                this.sDrawDumper(dumpVar[i]);
                break;
              default:
                try { this.str.push(dumpVar[i].replace(/\</g, '&lt;').replace(/\>/g, '&gt;')); } catch(e) { this.str.push(dumpVar[i]); }
                break;
            }
            this.str.push(this.endTags);
          } else {
            this.str.push(this.nullTags + i + this.middleTags + "null" + this.endTags);
          }
        } catch(e) {};
      }
      break;
    case 'array':
      for ( var j = dumpVar.length - 1; j >= 0; j-- ) {
        try {
          this.myCounter = this.myCounter + 1;
          if ( dumpVar[j] != null ) {
            this.myTypeChild = this.tf(dumpVar[j]);
            this.str.push(this.beginTags + (this.dumperColors["v" + this.myTypeChild] ? this.dumperColors["v" + this.myTypeChild][0] : "#FFF") + ';color:' + (this.dumperColors["v" + this.myTypeChild] ? this.dumperColors["v" + this.myTypeChild][1] : "#FFF")+';">' + j + this.middleTags); 
            switch ( typeof(dumpVar[j]) ) {
              case 'object':
                this.sDrawDumper(dumpVar[j]);
                break;
              default:
                try { this.str.push(dumpVar[j].replace(/\</g, '&lt;').replace(/\>/g, '&gt;')); } catch(e) { this.str.push(dumpVar[j]); }
                break;
            }
            this.str.push(this.endTags);
          } else {
            this.str.push(this.nullTags + j + this.middleTags + "null" + this.endTags);
          }
        } catch(e) {};
      } 
      break;
    case 'domelement':
      this.str.push(this.beginTags + (this.dumperColors["v" + this.myType] ? this.dumperColors["v" + this.myType][0] : "#FFF") + ';color:' + (this.dumperColors["v" + this.myType] ? this.dumperColors["v" + this.myType][1] : "#FFF")+';">' + this.myType + this.middleTags);
      this.sDrawDumper({'tagName' : dumpVar.tagName, 'innerHTML' : (dumpVar.innerHTML).toString() });
      this.str.push(this.endTags);
      break;
    case 'domcollection':
      this.str.push(this.beginTags + (this.dumperColors["v" + this.myType] ? this.dumperColors["v" + this.myType][0] : "#FFF") + ';color:' + (this.dumperColors["v" + this.myType] ? this.dumperColors["v" + this.myType][1] : "#FFF")+';">' + this.myType + this.middleTags);
      try { this.str.push(((dumpVar.innerHTML).toString()).replace(/\</g, '&lt;').replace(/\>/g, '&gt;') + this.endTags); } catch(e) { this.str.push(dumpVar + this.endTags); }
      break;
    default:
      this.str.push(this.beginTags + (this.dumperColors["v" + this.myType] ? this.dumperColors["v" + this.myType][0] : "#FFF") + ';color:' + (this.dumperColors["v" + this.myType] ? this.dumperColors["v" + this.myType][1] : "#FFF")+';">' + this.myType + this.middleTags);
      try { this.str.push(dumpVar.replace(/\</g, '&lt;').replace(/\>/g, '&gt;') + this.endTags); } catch(e) { this.str.push(dumpVar + this.endTags); }
      break;
  } 
  this.str.push('</table>');
}

_sDumper.prototype.finishDumper = function () {
  this.str.push('</div>');
  this.standAlone();
}

_sDumper.prototype.standAlone = function () {
  if ( ! document.getElementById('sDumperHolder') ) {
    var o = document.createElement("div");
    o.setAttribute("style","width:100%;");
    o.setAttribute("id","sDumperHolder");
    oB = document.body;
    vContains = oB.insertBefore(o, null); 
    vContains.innerHTML = this.str.join('');
    
    this.str = null;this.str = ['<div>'];
  } else { 
    document.getElementById("sDumperHolder").innerHTML = this.str.join('');
    this.str = null;this.str = ['<div>'];
  }
}

_sDumper.prototype.tf = function ( obj ) {
  var vType = typeof(obj);

  if( vType == "function" ) {
    var vFunction = obj.toString();
    if( ( /^\/.*\/[gi]??[gi]??$/ ).test( vFunction ) ) {
      return "regex";
    } else if( ( /^\[object.*\]$/i ).test( vFunction ) ) {
      vType = "object"
    }
  }

  if( vType != "object" ) {
    return vType;
  }

  switch( obj ) {
    case null:
      return "null";
    case window:
      return "window";
    case window.event:
      return "event";
  }

  if( window.event && ( event.type == obj.type ) ) {
    return "event";
  }

  var fConstructor = obj.constructor;
  if( fConstructor != null ) {
    switch( fConstructor ) {
      case Array:
        vType = "array";
        break;
      case Date:
        return "date";
      case RegExp:
        return "regex";
      case Object:
        vType = "object";
      break;
      case ReferenceError:
        return "error";
      default:
        var sConstructor = fConstructor.toString();
        var aMatch = sConstructor.match( /\s*function (.*)\(/ );
        if( aMatch != null ) {
          return 'object';
        }
    }
  }

  var nNodeType = obj.nodeType;
  if( nNodeType != null ) {
    switch( nNodeType ) {
      case 1:
        if( obj.item == null ) {
          return "domelement";
        }
        break;
      case 3:
        return "textnode";
    }
  }

  if( obj.toString != null ) {
    var sExpression = obj.toString();
    var aMatch = sExpression.match( /^\[object (.*)\]$/i );
    if( aMatch != null ) {
      var sMatch = aMatch[ 1 ];
      switch( sMatch.toLowerCase() ) {
        case "event":
          return "event";
        case "math":
          return "math";
        case "error":
          return "error";
        case "mimetypearray":
          return "mimetypecollection";
        case "pluginarray":
          return "plugincollection";
        case "windowcollection":
          return "window";
        case "nodelist":
        case "htmlcollection":
        case "elementarray":
          return "domcollection";
        case "htmldocument":
          return "htmldocument";
      }
    }
  }

  if( obj.moveToBookmark && obj.moveToElementText ) {
    return "textrange";
  } else if( obj.callee != null ) {
    return "array";
  } else if( obj.item != null ) {
    return "domcollection";
  }

  return vType;

}
