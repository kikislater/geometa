#' SWEAbstractDataComponent
#'
#' @docType class
#' @importFrom R6 R6Class
#' @export
#' @keywords ISO SWE
#' @return Object of \code{\link{R6Class}} for modelling an SWE Abstract data component
#' @format \code{\link{R6Class}} object.
#' 
#' @note Class used internally by geometa
#' 
#' @references 
#'   OGC Geography Markup Language. https://www.ogc.org/standards/swecommon
#' 
#' @author Emmanuel Blondel <emmanuel.blondel1@@gmail.com>
#'
SWEAbstractDataComponent <- R6Class("SWEAbstractDataComponent",
  inherit = SWEAbstractObject,
  private = list(
    xmlElement = "AbstractDataComponent",
    xmlNamespacePrefix = "SWE"
  ),
  public = list(
    #'@field definition definition
    definition = NULL,
    #'@field description description
    description = NULL,
    #'@field label label
    label = NULL,
    #'@field name name
    name = list(),
    #'@field identifier identifier
    identifier = NULL,
    
    #'@description Initializes an object of class \link{SWEAbstractDataComponent}
    #'@param xml object of class \link{XMLInternalNode-class} from \pkg{XML}
    #'@param element element
    #'@param updatable updatable
    #'@param optional optional
    #'@param definition definition
    initialize = function(xml = NULL, element = NULL, updatable = NULL, optional = FALSE, definition = NULL){
      if(is.null(element)) element <- private$xmlElement
      super$initialize(xml, element = element, attrs = list(), defaults = list(), wrap = FALSE)
      if(!is.null(updatable)) if(is.logical(updatable)) self$setAttr("updatable", tolower(updatable))
      self$setAttr("optional", tolower(optional))
      if(!is.null(definition)) self$setAttr("definition", definition)
    },
    
    #'@description Set definition
    #'@param definition definition
    setDefinition = function(definition){
      self$definition <- definition
    },
    
    #'@description Set description
    #'@param description description
    setDescription = function(description){
      self$description <- description
    },
    
    #'@description Adds name
    #'@param name name
    #'@param codeSpace codespace
    addName = function(name, codeSpace = NULL){
      name <- GMLCodeType$new(value = name, codeSpace = codeSpace)
      return(self$addListElement("name", name))
    },
    
    #'@description Deletes name
    #'@param name name
    #'@param codeSpace codespace
    delName = function(name, codeSpace = NULL){
      name <- GMLCodeType$new(value = name, codeSpace = codeSpace)
      return(self$delListElement("name", name))
    },
    
    #'@description Set identifier
    #'@param identifier identifier
    setIdentifier = function(identifier){
      self$identifier <- identifier
    }
  )                        
)