FasdUAS 1.101.10   ��   ��    k             l      ��  ��   � TypeSupport -- various standardized handlers for coercing and checking parameters and throwing errors

Notes:

- Because AS errors don't include stack traces, a library's public handlers must trap and rethrow all errors, prefixing error string with library and handler name (and, in script object methods, the object's display/documentation name) so that user can identify the handler in which an error occurred. Special attention should also be paid to coercing and/or validating public handlers' parameters, and throwing descriptive errors if an inappropriate value is given.

- This library wouldn't be necessary if AppleScript had decent parameter type annotations and proper exception objects (with full stack trace support). But as it doesn't these handlers at least take some of the endless pain out of sanitizing user-supplied inputs and generating consistent error messages when those inputs are inappropriate, or anything else in the handler needs to throw an error (or just goes plain old wrong).

- When coercing a text value to integer/real/number, or an integer or real value to text, AppleScript parses/formats the text using the current user's localization settings. This is a pain for portability as the same script will require/use different formats for reals and dates depending on the localization settings of each machine on which it runs; however, it's standard AS behavior and quicker than the alternatives so is used as standard. (Code that requires stable conversions should use the parse and format commands in Date and Number libraries instead.)

- When coercing a list to text, AppleScript's current text item delimiters are used. (This may change in future.) -- TO DO: need to make a decision on whether to allow or reject lists where text is required (it's standard AS behavior to convert them, but the semantics are nonsensical - at least localization sort of makes sense - so it's not the same as dates and numbers).

- Library handlers that work with the file system should use asPOSIXPathParameter(...) to check and normalize user-supplied alias/file/�class furl�/POSIX path string parameters as POSIX path strings. (If a file object is specifically required, just coerce the returned POSIX path to `POSIX file`.) This should insulate library handlers from the worst of the mess that is AS's file identifier types.

- Be aware that AS follows special dispatch rules for terminology-based commands where the command is dispatched to its own direct parameter if that parameter is a script object, application object specifier, or other type that 'responds' directly to commands. Therefore, library handlers that use SDEF terminology must not use those types as direct parameters, only keyword parameters, otherwise error -1708 or unexpected behavior will occur when AS sends the command to that object instead of the library. (Basic data types that do not respond to commands themselves - numbers, text, dates, lists, etc - are safe to use as direct parameters.)


Caution:

- When checking if a string is empty in a library handler, it is *essential* either to check its length=0 or else wrap the string comparison (e.g. `aString is ""`) in a `considering hyphens, punctuation and white space block` to ensure that it really is empty and not a non-empty text value that contains only characters being ignored by the caller's current considering/ignoring settings. Similarly, when comparing for a non-empty string, the considering block *must* be used.

- When performing comparisons using <,�,>,� operators or concatenating values with & operator, it is *essential* to ensure the left operand is of the correct type (number/text/date/list) as AS will coerce the RH operand to the same type as the LH operand, and in some cases even casts *both* (e.g. `1&2`->`{1}&{2}`->`{1,2}`). Conversely, when using =/� operators, if the two operands are not the same type then this will almost always result in `false` (the obvious exception being integer/real comparisons, e.g. `1=1.0`->true), even though type-only differences are often ignored by other operators/commands (e.g. `1<"1"->false, `1<{1}`->false). Fully sanitizing all handler parameters before using them should generally avoid such problems subsequently manifesting in the handler, but eternal vigilance is still required to ensure extremely obscure/nasty/unpredictable/almost-impossible-to-troubleshoot bugs don't sneak in.

- When coercing values, `theValue as anything` will fail when the value is an AS record (presumably due to a stupid AS bug). There is no ideal workaround for this, e.g. checking first if `count {theValue} each record` will return false when passed a reference to a record, but then fail on the subsequent `as anything` coercion. (TBH, these sorts of bugs and omissions can only be reliably addressed by fixing AS itself.)


Example:

The following template illustrates the basic structure for an SDEF-based library containing a keyword handler named 'SOME HANDLER' that takes three parameters (although the same approach works just as well for non-terminology libraries):

	(* LIBRARY_NAME -- short description
	
		� 2015-2017 J Smith <www.example.org>
	*)
	
	----------------------------------------------------------------------	-- support

	property _support : a reference to script "TypeSupport"

	to _error(handlerName, eText, eNumber, eFrom, eTo)
		_support's throwCommandError("LIBRARY_NAME", handlerName, eText, eNumber, eFrom, eTo)
	end _error

	----------------------------------------------------------------------	-- handlers

	to SOME HANDLER directParam USING usingParam FLAG flagParam : (false)
		try
			set directParam to _support's asTextParameter(directParam, "")
			set usingParam to _support's asWholeNumberParameter(usingParam, "USING")
			set flagParam to _support's asBooleanParameter(flagParam, "FLAG")
		
			-- handler code goes here...
		
		on error eText number eNumber from eFrom to eTo
			_error("SOME HANDLER", eText, eNumber, eFrom, eTo)
		end try
	end SOME HANDLER
	

The 'support' section contains standard boilerplate code for rethrowing handler errors with the name of the library included; only the `_error` handler's "LIBRARY_NAME" text needs changed to contain the library's actual name.

Each public handler should also contain a `try` block that catches all errors occurring within that handler, and rethrow them via the supporting `_error` handler; again, "SOME HANDLER" should be changed to match the handler's actual name.

These boilerplate idioms help to compensate for AppleScript's own weak error reporting, which only indicates that an error has occurred but does not tell the user where.

     � 	 	3�   T y p e S u p p o r t   - -   v a r i o u s   s t a n d a r d i z e d   h a n d l e r s   f o r   c o e r c i n g   a n d   c h e c k i n g   p a r a m e t e r s   a n d   t h r o w i n g   e r r o r s 
 
 N o t e s : 
 
 -   B e c a u s e   A S   e r r o r s   d o n ' t   i n c l u d e   s t a c k   t r a c e s ,   a   l i b r a r y ' s   p u b l i c   h a n d l e r s   m u s t   t r a p   a n d   r e t h r o w   a l l   e r r o r s ,   p r e f i x i n g   e r r o r   s t r i n g   w i t h   l i b r a r y   a n d   h a n d l e r   n a m e   ( a n d ,   i n   s c r i p t   o b j e c t   m e t h o d s ,   t h e   o b j e c t ' s   d i s p l a y / d o c u m e n t a t i o n   n a m e )   s o   t h a t   u s e r   c a n   i d e n t i f y   t h e   h a n d l e r   i n   w h i c h   a n   e r r o r   o c c u r r e d .   S p e c i a l   a t t e n t i o n   s h o u l d   a l s o   b e   p a i d   t o   c o e r c i n g   a n d / o r   v a l i d a t i n g   p u b l i c   h a n d l e r s '   p a r a m e t e r s ,   a n d   t h r o w i n g   d e s c r i p t i v e   e r r o r s   i f   a n   i n a p p r o p r i a t e   v a l u e   i s   g i v e n . 
 
 -   T h i s   l i b r a r y   w o u l d n ' t   b e   n e c e s s a r y   i f   A p p l e S c r i p t   h a d   d e c e n t   p a r a m e t e r   t y p e   a n n o t a t i o n s   a n d   p r o p e r   e x c e p t i o n   o b j e c t s   ( w i t h   f u l l   s t a c k   t r a c e   s u p p o r t ) .   B u t   a s   i t   d o e s n ' t   t h e s e   h a n d l e r s   a t   l e a s t   t a k e   s o m e   o f   t h e   e n d l e s s   p a i n   o u t   o f   s a n i t i z i n g   u s e r - s u p p l i e d   i n p u t s   a n d   g e n e r a t i n g   c o n s i s t e n t   e r r o r   m e s s a g e s   w h e n   t h o s e   i n p u t s   a r e   i n a p p r o p r i a t e ,   o r   a n y t h i n g   e l s e   i n   t h e   h a n d l e r   n e e d s   t o   t h r o w   a n   e r r o r   ( o r   j u s t   g o e s   p l a i n   o l d   w r o n g ) . 
 
 -   W h e n   c o e r c i n g   a   t e x t   v a l u e   t o   i n t e g e r / r e a l / n u m b e r ,   o r   a n   i n t e g e r   o r   r e a l   v a l u e   t o   t e x t ,   A p p l e S c r i p t   p a r s e s / f o r m a t s   t h e   t e x t   u s i n g   t h e   c u r r e n t   u s e r ' s   l o c a l i z a t i o n   s e t t i n g s .   T h i s   i s   a   p a i n   f o r   p o r t a b i l i t y   a s   t h e   s a m e   s c r i p t   w i l l   r e q u i r e / u s e   d i f f e r e n t   f o r m a t s   f o r   r e a l s   a n d   d a t e s   d e p e n d i n g   o n   t h e   l o c a l i z a t i o n   s e t t i n g s   o f   e a c h   m a c h i n e   o n   w h i c h   i t   r u n s ;   h o w e v e r ,   i t ' s   s t a n d a r d   A S   b e h a v i o r   a n d   q u i c k e r   t h a n   t h e   a l t e r n a t i v e s   s o   i s   u s e d   a s   s t a n d a r d .   ( C o d e   t h a t   r e q u i r e s   s t a b l e   c o n v e r s i o n s   s h o u l d   u s e   t h e   p a r s e   a n d   f o r m a t   c o m m a n d s   i n   D a t e   a n d   N u m b e r   l i b r a r i e s   i n s t e a d . ) 
 
 -   W h e n   c o e r c i n g   a   l i s t   t o   t e x t ,   A p p l e S c r i p t ' s   c u r r e n t   t e x t   i t e m   d e l i m i t e r s   a r e   u s e d .   ( T h i s   m a y   c h a n g e   i n   f u t u r e . )   - -   T O   D O :   n e e d   t o   m a k e   a   d e c i s i o n   o n   w h e t h e r   t o   a l l o w   o r   r e j e c t   l i s t s   w h e r e   t e x t   i s   r e q u i r e d   ( i t ' s   s t a n d a r d   A S   b e h a v i o r   t o   c o n v e r t   t h e m ,   b u t   t h e   s e m a n t i c s   a r e   n o n s e n s i c a l   -   a t   l e a s t   l o c a l i z a t i o n   s o r t   o f   m a k e s   s e n s e   -   s o   i t ' s   n o t   t h e   s a m e   a s   d a t e s   a n d   n u m b e r s ) . 
 
 -   L i b r a r y   h a n d l e r s   t h a t   w o r k   w i t h   t h e   f i l e   s y s t e m   s h o u l d   u s e   a s P O S I X P a t h P a r a m e t e r ( . . . )   t o   c h e c k   a n d   n o r m a l i z e   u s e r - s u p p l i e d   a l i a s / f i l e / � c l a s s   f u r l � / P O S I X   p a t h   s t r i n g   p a r a m e t e r s   a s   P O S I X   p a t h   s t r i n g s .   ( I f   a   f i l e   o b j e c t   i s   s p e c i f i c a l l y   r e q u i r e d ,   j u s t   c o e r c e   t h e   r e t u r n e d   P O S I X   p a t h   t o   ` P O S I X   f i l e ` . )   T h i s   s h o u l d   i n s u l a t e   l i b r a r y   h a n d l e r s   f r o m   t h e   w o r s t   o f   t h e   m e s s   t h a t   i s   A S ' s   f i l e   i d e n t i f i e r   t y p e s . 
 
 -   B e   a w a r e   t h a t   A S   f o l l o w s   s p e c i a l   d i s p a t c h   r u l e s   f o r   t e r m i n o l o g y - b a s e d   c o m m a n d s   w h e r e   t h e   c o m m a n d   i s   d i s p a t c h e d   t o   i t s   o w n   d i r e c t   p a r a m e t e r   i f   t h a t   p a r a m e t e r   i s   a   s c r i p t   o b j e c t ,   a p p l i c a t i o n   o b j e c t   s p e c i f i e r ,   o r   o t h e r   t y p e   t h a t   ' r e s p o n d s '   d i r e c t l y   t o   c o m m a n d s .   T h e r e f o r e ,   l i b r a r y   h a n d l e r s   t h a t   u s e   S D E F   t e r m i n o l o g y   m u s t   n o t   u s e   t h o s e   t y p e s   a s   d i r e c t   p a r a m e t e r s ,   o n l y   k e y w o r d   p a r a m e t e r s ,   o t h e r w i s e   e r r o r   - 1 7 0 8   o r   u n e x p e c t e d   b e h a v i o r   w i l l   o c c u r   w h e n   A S   s e n d s   t h e   c o m m a n d   t o   t h a t   o b j e c t   i n s t e a d   o f   t h e   l i b r a r y .   ( B a s i c   d a t a   t y p e s   t h a t   d o   n o t   r e s p o n d   t o   c o m m a n d s   t h e m s e l v e s   -   n u m b e r s ,   t e x t ,   d a t e s ,   l i s t s ,   e t c   -   a r e   s a f e   t o   u s e   a s   d i r e c t   p a r a m e t e r s . ) 
 
 
 C a u t i o n : 
 
 -   W h e n   c h e c k i n g   i f   a   s t r i n g   i s   e m p t y   i n   a   l i b r a r y   h a n d l e r ,   i t   i s   * e s s e n t i a l *   e i t h e r   t o   c h e c k   i t s   l e n g t h = 0   o r   e l s e   w r a p   t h e   s t r i n g   c o m p a r i s o n   ( e . g .   ` a S t r i n g   i s   " " ` )   i n   a   ` c o n s i d e r i n g   h y p h e n s ,   p u n c t u a t i o n   a n d   w h i t e   s p a c e   b l o c k `   t o   e n s u r e   t h a t   i t   r e a l l y   i s   e m p t y   a n d   n o t   a   n o n - e m p t y   t e x t   v a l u e   t h a t   c o n t a i n s   o n l y   c h a r a c t e r s   b e i n g   i g n o r e d   b y   t h e   c a l l e r ' s   c u r r e n t   c o n s i d e r i n g / i g n o r i n g   s e t t i n g s .   S i m i l a r l y ,   w h e n   c o m p a r i n g   f o r   a   n o n - e m p t y   s t r i n g ,   t h e   c o n s i d e r i n g   b l o c k   * m u s t *   b e   u s e d . 
 
 -   W h e n   p e r f o r m i n g   c o m p a r i s o n s   u s i n g   < ,"d , > ,"e   o p e r a t o r s   o r   c o n c a t e n a t i n g   v a l u e s   w i t h   &   o p e r a t o r ,   i t   i s   * e s s e n t i a l *   t o   e n s u r e   t h e   l e f t   o p e r a n d   i s   o f   t h e   c o r r e c t   t y p e   ( n u m b e r / t e x t / d a t e / l i s t )   a s   A S   w i l l   c o e r c e   t h e   R H   o p e r a n d   t o   t h e   s a m e   t y p e   a s   t h e   L H   o p e r a n d ,   a n d   i n   s o m e   c a s e s   e v e n   c a s t s   * b o t h *   ( e . g .   ` 1 & 2 ` - > ` { 1 } & { 2 } ` - > ` { 1 , 2 } ` ) .   C o n v e r s e l y ,   w h e n   u s i n g   = /"`   o p e r a t o r s ,   i f   t h e   t w o   o p e r a n d s   a r e   n o t   t h e   s a m e   t y p e   t h e n   t h i s   w i l l   a l m o s t   a l w a y s   r e s u l t   i n   ` f a l s e `   ( t h e   o b v i o u s   e x c e p t i o n   b e i n g   i n t e g e r / r e a l   c o m p a r i s o n s ,   e . g .   ` 1 = 1 . 0 ` - > t r u e ) ,   e v e n   t h o u g h   t y p e - o n l y   d i f f e r e n c e s   a r e   o f t e n   i g n o r e d   b y   o t h e r   o p e r a t o r s / c o m m a n d s   ( e . g .   ` 1 < " 1 " - > f a l s e ,   ` 1 < { 1 } ` - > f a l s e ) .   F u l l y   s a n i t i z i n g   a l l   h a n d l e r   p a r a m e t e r s   b e f o r e   u s i n g   t h e m   s h o u l d   g e n e r a l l y   a v o i d   s u c h   p r o b l e m s   s u b s e q u e n t l y   m a n i f e s t i n g   i n   t h e   h a n d l e r ,   b u t   e t e r n a l   v i g i l a n c e   i s   s t i l l   r e q u i r e d   t o   e n s u r e   e x t r e m e l y   o b s c u r e / n a s t y / u n p r e d i c t a b l e / a l m o s t - i m p o s s i b l e - t o - t r o u b l e s h o o t   b u g s   d o n ' t   s n e a k   i n . 
 
 -   W h e n   c o e r c i n g   v a l u e s ,   ` t h e V a l u e   a s   a n y t h i n g `   w i l l   f a i l   w h e n   t h e   v a l u e   i s   a n   A S   r e c o r d   ( p r e s u m a b l y   d u e   t o   a   s t u p i d   A S   b u g ) .   T h e r e   i s   n o   i d e a l   w o r k a r o u n d   f o r   t h i s ,   e . g .   c h e c k i n g   f i r s t   i f   ` c o u n t   { t h e V a l u e }   e a c h   r e c o r d `   w i l l   r e t u r n   f a l s e   w h e n   p a s s e d   a   r e f e r e n c e   t o   a   r e c o r d ,   b u t   t h e n   f a i l   o n   t h e   s u b s e q u e n t   ` a s   a n y t h i n g `   c o e r c i o n .   ( T B H ,   t h e s e   s o r t s   o f   b u g s   a n d   o m i s s i o n s   c a n   o n l y   b e   r e l i a b l y   a d d r e s s e d   b y   f i x i n g   A S   i t s e l f . ) 
 
 
 E x a m p l e : 
 
 T h e   f o l l o w i n g   t e m p l a t e   i l l u s t r a t e s   t h e   b a s i c   s t r u c t u r e   f o r   a n   S D E F - b a s e d   l i b r a r y   c o n t a i n i n g   a   k e y w o r d   h a n d l e r   n a m e d   ' S O M E   H A N D L E R '   t h a t   t a k e s   t h r e e   p a r a m e t e r s   ( a l t h o u g h   t h e   s a m e   a p p r o a c h   w o r k s   j u s t   a s   w e l l   f o r   n o n - t e r m i n o l o g y   l i b r a r i e s ) : 
 
 	 ( *   L I B R A R Y _ N A M E   - -   s h o r t   d e s c r i p t i o n 
 	 
 	 	 �   2 0 1 5 - 2 0 1 7   J   S m i t h   < w w w . e x a m p l e . o r g > 
 	 * ) 
 	 
 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  	 - -   s u p p o r t  
 
 	 p r o p e r t y   _ s u p p o r t   :   a   r e f e r e n c e   t o   s c r i p t   " T y p e S u p p o r t " 
 
 	 t o   _ e r r o r ( h a n d l e r N a m e ,   e T e x t ,   e N u m b e r ,   e F r o m ,   e T o ) 
 	 	 _ s u p p o r t ' s   t h r o w C o m m a n d E r r o r ( " L I B R A R Y _ N A M E " ,   h a n d l e r N a m e ,   e T e x t ,   e N u m b e r ,   e F r o m ,   e T o ) 
 	 e n d   _ e r r o r 
 
 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  	 - -   h a n d l e r s 
 
 	 t o   S O M E   H A N D L E R   d i r e c t P a r a m   U S I N G   u s i n g P a r a m   F L A G   f l a g P a r a m   :   ( f a l s e ) 
 	 	 t r y 
 	 	 	 s e t   d i r e c t P a r a m   t o   _ s u p p o r t ' s   a s T e x t P a r a m e t e r ( d i r e c t P a r a m ,   " " ) 
 	 	 	 s e t   u s i n g P a r a m   t o   _ s u p p o r t ' s   a s W h o l e N u m b e r P a r a m e t e r ( u s i n g P a r a m ,   " U S I N G " ) 
 	 	 	 s e t   f l a g P a r a m   t o   _ s u p p o r t ' s   a s B o o l e a n P a r a m e t e r ( f l a g P a r a m ,   " F L A G " ) 
 	 	 
 	 	 	 - -   h a n d l e r   c o d e   g o e s   h e r e . . . 
 	 	 
 	 	 o n   e r r o r   e T e x t   n u m b e r   e N u m b e r   f r o m   e F r o m   t o   e T o 
 	 	 	 _ e r r o r ( " S O M E   H A N D L E R " ,   e T e x t ,   e N u m b e r ,   e F r o m ,   e T o ) 
 	 	 e n d   t r y 
 	 e n d   S O M E   H A N D L E R 
 	 
 
 T h e   ' s u p p o r t '   s e c t i o n   c o n t a i n s   s t a n d a r d   b o i l e r p l a t e   c o d e   f o r   r e t h r o w i n g   h a n d l e r   e r r o r s   w i t h   t h e   n a m e   o f   t h e   l i b r a r y   i n c l u d e d ;   o n l y   t h e   ` _ e r r o r `   h a n d l e r ' s   " L I B R A R Y _ N A M E "   t e x t   n e e d s   c h a n g e d   t o   c o n t a i n   t h e   l i b r a r y ' s   a c t u a l   n a m e . 
 
 E a c h   p u b l i c   h a n d l e r   s h o u l d   a l s o   c o n t a i n   a   ` t r y `   b l o c k   t h a t   c a t c h e s   a l l   e r r o r s   o c c u r r i n g   w i t h i n   t h a t   h a n d l e r ,   a n d   r e t h r o w   t h e m   v i a   t h e   s u p p o r t i n g   ` _ e r r o r `   h a n d l e r ;   a g a i n ,   " S O M E   H A N D L E R "   s h o u l d   b e   c h a n g e d   t o   m a t c h   t h e   h a n d l e r ' s   a c t u a l   n a m e . 
 
 T h e s e   b o i l e r p l a t e   i d i o m s   h e l p   t o   c o m p e n s a t e   f o r   A p p l e S c r i p t ' s   o w n   w e a k   e r r o r   r e p o r t i n g ,   w h i c h   o n l y   i n d i c a t e s   t h a t   a n   e r r o r   h a s   o c c u r r e d   b u t   d o e s   n o t   t e l l   t h e   u s e r   w h e r e . 
 
   
  
 l     ��������  ��  ��        x     �� ����    4    �� 
�� 
frmk  m       �    F o u n d a t i o n��        l     ��������  ��  ��        l     ��  ��    J D--------------------------------------------------------------------     �   � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -      l     ��  ��    ? 9 HACK: check if a handler exists before trying to call it     �   r   H A C K :   c h e c k   i f   a   h a n d l e r   e x i s t s   b e f o r e   t r y i n g   t o   c a l l   i t      l     ��������  ��  ��       !   l     �� " #��   "VP used to check for the existence of an optional 'callback' handler before calling it, as AS doesn't distinguish between an error -1708 that occurs because handler wasn't defined (in which case don't call it) and an error -1708 that occurs because the handler was found but went on to call another handler that doesn't exist (i.e. a bug)    # � $ $�   u s e d   t o   c h e c k   f o r   t h e   e x i s t e n c e   o f   a n   o p t i o n a l   ' c a l l b a c k '   h a n d l e r   b e f o r e   c a l l i n g   i t ,   a s   A S   d o e s n ' t   d i s t i n g u i s h   b e t w e e n   a n   e r r o r   - 1 7 0 8   t h a t   o c c u r s   b e c a u s e   h a n d l e r   w a s n ' t   d e f i n e d   ( i n   w h i c h   c a s e   d o n ' t   c a l l   i t )   a n d   a n   e r r o r   - 1 7 0 8   t h a t   o c c u r s   b e c a u s e   t h e   h a n d l e r   w a s   f o u n d   b u t   w e n t   o n   t o   c a l l   a n o t h e r   h a n d l e r   t h a t   d o e s n ' t   e x i s t   ( i . e .   a   b u g ) !  % & % l     ��������  ��  ��   &  ' ( ' l     �� ) *��   )93 CAUTION: `hasHander` relies on AS handlers' partial ability to behave as AS objects in that they can be retrieved by name, assigned to variables, and coerced to `handler` type. Be aware, however, this object-like behavior is undocumented and essentially undefined: AS handlers are not closures, so moving them around will completely break their lexical and dynamic bindings, causing seriously bizarre and incorrect behavior if subsequently called. The only reason `hasHandler` resorts to such hackery because AS lacks the introspection/stack trace capabilites to do the job right (either by asking the containing script object to describe its contents, or by calling the handler speculatively then examining the stack trace to determine if error -1708 was due to the handler not existing or a bug occurring within it).    * � + +f   C A U T I O N :   ` h a s H a n d e r `   r e l i e s   o n   A S   h a n d l e r s '   p a r t i a l   a b i l i t y   t o   b e h a v e   a s   A S   o b j e c t s   i n   t h a t   t h e y   c a n   b e   r e t r i e v e d   b y   n a m e ,   a s s i g n e d   t o   v a r i a b l e s ,   a n d   c o e r c e d   t o   ` h a n d l e r `   t y p e .   B e   a w a r e ,   h o w e v e r ,   t h i s   o b j e c t - l i k e   b e h a v i o r   i s   u n d o c u m e n t e d   a n d   e s s e n t i a l l y   u n d e f i n e d :   A S   h a n d l e r s   a r e   n o t   c l o s u r e s ,   s o   m o v i n g   t h e m   a r o u n d   w i l l   c o m p l e t e l y   b r e a k   t h e i r   l e x i c a l   a n d   d y n a m i c   b i n d i n g s ,   c a u s i n g   s e r i o u s l y   b i z a r r e   a n d   i n c o r r e c t   b e h a v i o r   i f   s u b s e q u e n t l y   c a l l e d .   T h e   o n l y   r e a s o n   ` h a s H a n d l e r `   r e s o r t s   t o   s u c h   h a c k e r y   b e c a u s e   A S   l a c k s   t h e   i n t r o s p e c t i o n / s t a c k   t r a c e   c a p a b i l i t e s   t o   d o   t h e   j o b   r i g h t   ( e i t h e r   b y   a s k i n g   t h e   c o n t a i n i n g   s c r i p t   o b j e c t   t o   d e s c r i b e   i t s   c o n t e n t s ,   o r   b y   c a l l i n g   t h e   h a n d l e r   s p e c u l a t i v e l y   t h e n   e x a m i n i n g   t h e   s t a c k   t r a c e   t o   d e t e r m i n e   i f   e r r o r   - 1 7 0 8   w a s   d u e   t o   t h e   h a n d l e r   n o t   e x i s t i n g   o r   a   b u g   o c c u r r i n g   w i t h i n   i t ) . (  , - , l     ��������  ��  ��   -  . / . l     �� 0 1��   0 � � CAUTION: `hasHandler` only works for handlers with identifier-based names; do not use to check for existence of handlers with keyword-based names as that will result in incorrect behavior.    1 � 2 2z   C A U T I O N :   ` h a s H a n d l e r `   o n l y   w o r k s   f o r   h a n d l e r s   w i t h   i d e n t i f i e r - b a s e d   n a m e s ;   d o   n o t   u s e   t o   c h e c k   f o r   e x i s t e n c e   o f   h a n d l e r s   w i t h   k e y w o r d - b a s e d   n a m e s   a s   t h a t   w i l l   r e s u l t   i n   i n c o r r e c t   b e h a v i o r . /  3 4 3 l     ��������  ��  ��   4  5 6 5 i    7 8 7 I      �� 9���� 0 
hashandler 
hasHandler 9  :�� : o      ���� 0 
handlerref 
handlerRef��  ��   8 l     ; < = ; Q      > ? @ > l   	 A B C A k    	 D D  E F E l    G H I G c     J K J o    ���� 0 
handlerref 
handlerRef K m    ��
�� 
hand H ? 9 dereference and type check; this raises -1700 on failure    I � L L r   d e r e f e r e n c e   a n d   t y p e   c h e c k ;   t h i s   r a i s e s   - 1 7 0 0   o n   f a i l u r e F  M�� M L    	 N N m    ��
�� boovtrue��   B G A horrible hack to check if a script object has a specific handler    C � O O �   h o r r i b l e   h a c k   t o   c h e c k   i f   a   s c r i p t   o b j e c t   h a s   a   s p e c i f i c   h a n d l e r ? R      ���� P
�� .ascrerr ****      � ****��   P �� Q��
�� 
errn Q d       R R m      �������   @ l    S T U S L     V V m    ��
�� boovfals T K E the referred-to script object slot doesn't exist, or isn't a handler    U � W W �   t h e   r e f e r r e d - t o   s c r i p t   o b j e c t   s l o t   d o e s n ' t   e x i s t ,   o r   i s n ' t   a   h a n d l e r < < 6 handlerRef must be `a reference to HANDLER of SCRIPT`    = � X X l   h a n d l e r R e f   m u s t   b e   ` a   r e f e r e n c e   t o   H A N D L E R   o f   S C R I P T ` 6  Y Z Y l     ��������  ��  ��   Z  [ \ [ l     ��������  ��  ��   \  ] ^ ] l     �� _ `��   _ J D--------------------------------------------------------------------    ` � a a � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - ^  b c b l     �� d e��   d � � convenience handlers for raising common errors; using these improves consistency, ensuring all error messages and parameters follow same general structure, and that all library handlers automatically benefit from any future improvements made here    e � f f�   c o n v e n i e n c e   h a n d l e r s   f o r   r a i s i n g   c o m m o n   e r r o r s ;   u s i n g   t h e s e   i m p r o v e s   c o n s i s t e n c y ,   e n s u r i n g   a l l   e r r o r   m e s s a g e s   a n d   p a r a m e t e r s   f o l l o w   s a m e   g e n e r a l   s t r u c t u r e ,   a n d   t h a t   a l l   l i b r a r y   h a n d l e r s   a u t o m a t i c a l l y   b e n e f i t   f r o m   a n y   f u t u r e   i m p r o v e m e n t s   m a d e   h e r e c  g h g l     ��������  ��  ��   h  i j i i    k l k I      �� m���� 00 _throwinvalidparameter _throwInvalidParameter m  n o n o      ���� 0 thevalue theValue o  p q p o      ���� 0 parametername parameterName q  r s r o      ���� 0 expectedtype expectedType s  t u t o      ���� $0 errordescription errorDescription u  v�� v o      ���� 0 errornumber errorNumber��  ��   l l    & w x y w k     & z z  { | { Z      } ~��  } =      � � � n     � � � 1    ��
�� 
leng � o     ���� 0 parametername parameterName � m    ����   ~ r     � � � m    	 � � � � �  d i r e c t � o      ���� 0 parametername parameterName��    r     � � � b     � � � b     � � � m     � � � � �   � o    ���� 0 parametername parameterName � m     � � � � �   � o      ���� 0 parametername parameterName |  ��� � R    &�� � �
�� .ascrerr ****      � **** � b    % � � � b    # � � � b    ! � � � m     � � � � �  I n v a l i d   � o     ���� 0 parametername parameterName � m   ! " � � � � �    p a r a m e t e r :   � o   # $���� $0 errordescription errorDescription � �� � �
�� 
errn � o    ���� 0 errornumber errorNumber � �� � �
�� 
erob � o    ���� 0 thevalue theValue � �� ���
�� 
errt � o    ���� 0 expectedtype expectedType��  ��   x   private    y � � �    p r i v a t e j  � � � l     ��������  ��  ��   �  � � � l     ��������  ��  ��   �  � � � i    � � � I      �� ����� .0 throwinvalidparameter throwInvalidParameter �  � � � o      ���� 0 thevalue theValue �  � � � o      ���� 0 parametername parameterName �  � � � o      ���� 0 expectedtype expectedType �  ��� � o      ���� $0 errordescription errorDescription��  ��   � I     
�� ����� 00 _throwinvalidparameter _throwInvalidParameter �  � � � o    ���� 0 thevalue theValue �  � � � o    ���� 0 parametername parameterName �  � � � o    ���� 0 expectedtype expectedType �  � � � o    ���� $0 errordescription errorDescription �  ��� � m    �����Y��  ��   �  � � � l     ��������  ��  ��   �  � � � l     ��������  ��  ��   �  � � � i    � � � I      �� ����� 80 throwinvalidparameterindex throwInvalidParameterIndex �  � � � o      ���� 0 thevalue theValue �  ��� � o      ���� 0 parametername parameterName��  ��   � l    
 � � � � k     
 � �  � � � l     �� � ���   �wq note that error -1719 (errAEIllegalIndex) or -10006 (errAEWriteDenied) may also be used to indicate out-of-range indexes when setting/inserting items; however, -1728 is the most commonly used and easily recognized error code for index-related failures so it's probably best to use it as standard unless there is a particular use case where the distinction must be made    � � � ��   n o t e   t h a t   e r r o r   - 1 7 1 9   ( e r r A E I l l e g a l I n d e x )   o r   - 1 0 0 0 6   ( e r r A E W r i t e D e n i e d )   m a y   a l s o   b e   u s e d   t o   i n d i c a t e   o u t - o f - r a n g e   i n d e x e s   w h e n   s e t t i n g / i n s e r t i n g   i t e m s ;   h o w e v e r ,   - 1 7 2 8   i s   t h e   m o s t   c o m m o n l y   u s e d   a n d   e a s i l y   r e c o g n i z e d   e r r o r   c o d e   f o r   i n d e x - r e l a t e d   f a i l u r e s   s o   i t ' s   p r o b a b l y   b e s t   t o   u s e   i t   a s   s t a n d a r d   u n l e s s   t h e r e   i s   a   p a r t i c u l a r   u s e   c a s e   w h e r e   t h e   d i s t i n c t i o n   m u s t   b e   m a d e �  ��� � I     
�� ����� 00 _throwinvalidparameter _throwInvalidParameter �  � � � o    ���� 0 thevalue theValue �  � � � o    ���� 0 parametername parameterName �  � � � m    ��
�� 
long �  � � � m     � � � � � , I n d e x   i s   o u t   o f   r a n g e . �  ��� � m    �����@��  ��  ��   �   can't get list item    � � � � (   c a n ' t   g e t   l i s t   i t e m �  � � � l     ��������  ��  ��   �  � � � l     ��������  ��  ��   �  � � � i    � � � I      �� ����� 60 throwinvalidparametertype throwInvalidParameterType �  � � � o      �� 0 thevalue theValue �  � � � o      �~�~ 0 parametername parameterName �  � � � o      �}�} 0 expectedtype expectedType �  ��| � o      �{�{ $0 expectedtypename expectedTypeName�|  ��   � k     9 � �  � � � Q     ) � � � � Z     � ��z � � >     � � � l    ��y�x � I   �w � �
�w .corecnte****       **** � J       �v o    �u�u 0 thevalue theValue�v   � �t�s
�t 
kocl m    �r
�r 
obj �s  �y  �x   � m    �q�q   � r     m     � .   b u t   r e c e i v e d   s p e c i f i e r o      �p�p  0 actualtypename actualTypeName�z   � l   	 r    

 b     m     �    b u t   r e c e i v e d   l   �o�n n    m    �m
�m 
pcls o    �l�l 0 thevalue theValue�o  �n   o      �k�k  0 actualtypename actualTypeName include the value's type name in error message; note: this will display as raw four-char code when terminology isn't available, or may be a custom value in the case of records and scripts, but this can't be helped as it's a limitation of AppleScript itself   	 �   i n c l u d e   t h e   v a l u e ' s   t y p e   n a m e   i n   e r r o r   m e s s a g e ;   n o t e :   t h i s   w i l l   d i s p l a y   a s   r a w   f o u r - c h a r   c o d e   w h e n   t e r m i n o l o g y   i s n ' t   a v a i l a b l e ,   o r   m a y   b e   a   c u s t o m   v a l u e   i n   t h e   c a s e   o f   r e c o r d s   a n d   s c r i p t s ,   b u t   t h i s   c a n ' t   b e   h e l p e d   a s   i t ' s   a   l i m i t a t i o n   o f   A p p l e S c r i p t   i t s e l f � R      �j�i�h
�j .ascrerr ****      � ****�i  �h   � r   & ) m   & ' �   o      �g�g  0 actualtypename actualTypeName � �f I   * 9�e�d�e .0 throwinvalidparameter throwInvalidParameter  o   + ,�c�c 0 thevalue theValue  o   , -�b�b 0 parametername parameterName  o   - .�a�a 0 expectedtype expectedType  �`  b   . 5!"! b   . 3#$# b   . 1%&% m   . /'' �((  E x p e c t e d  & o   / 0�_�_ $0 expectedtypename expectedTypeName$ o   1 2�^�^  0 actualtypename actualTypeName" m   3 4)) �**  .�`  �d  �f   � +,+ l     �]�\�[�]  �\  �[  , -.- l     �Z�Y�X�Z  �Y  �X  . /0/ i   "121 I      �W3�V�W >0 throwinvalidconstantparameter throwInvalidConstantParameter3 454 o      �U�U 0 thevalue theValue5 6�T6 o      �S�S 0 parametername parameterName�T  �V  2 I     	�R7�Q�R .0 throwinvalidparameter throwInvalidParameter7 898 o    �P�P 0 thevalue theValue9 :;: o    �O�O 0 parametername parameterName; <=< m    �N
�N 
enum= >�M> m    ?? �@@ 0 N o t   a n   a l l o w e d   c o n s t a n t .�M  �Q  0 ABA l     �L�K�J�L  �K  �J  B CDC l     �I�H�G�I  �H  �G  D EFE l     �F�E�D�F  �E  �D  F GHG l     �C�B�A�C  �B  �A  H IJI l     �@�?�>�@  �?  �>  J KLK i  # &MNM I      �=O�<�= 0 rethrowerror rethrowErrorO PQP o      �;�; 0 libraryname libraryNameQ RSR o      �:�: 0 handlername handlerNameS TUT o      �9�9 0 etext eTextU VWV o      �8�8 0 enumber eNumberW XYX o      �7�7 0 efrom eFromY Z[Z o      �6�6 
0 eto eTo[ \]\ o      �5�5 $0 targetobjectname targetObjectName] ^�4^ o      �3�3 0 partialresult partialResult�4  �<  N l    C_`a_ k     Cbb cdc Z     #ef�2ge =    hih o     �1�1 $0 targetobjectname targetObjectNamei m    �0
�0 
msngf r    jkj b    lml b    non b    pqp b    	rsr o    �/�/ 0 libraryname libraryNames m    tt �uu    l i b r a r y   c a n  t  q o   	 
�.�. 0 handlername handlerNameo m    vv �ww  :  m o    �-�- 0 etext eTextk o      �,�, 0 etext eText�2  g r    #xyx b    !z{z b    |}| b    ~~ b    ��� b    ��� b    ��� o    �+�+ 0 libraryname libraryName� m    �� ���    l i b r a r y  s  � o    �*�* $0 targetobjectname targetObjectName� m    �� ���    c a n  t   o    �)�) 0 handlername handlerName} m    �� ���  :  { o     �(�( 0 etext eTexty o      �'�' 0 etext eTextd ��&� Z   $ C���%�� =  $ '��� o   $ %�$�$ 0 partialresult partialResult� m   % &�#
�# 
msng� R   * 4�"��
�" .ascrerr ****      � ****� o   2 3�!�! 0 etext eText� � ��
�  
errn� o   , -�� 0 enumber eNumber� ���
� 
erob� o   . /�� 0 efrom eFrom� ���
� 
errt� o   0 1�� 
0 eto eTo�  �%  � R   7 C���
� .ascrerr ****      � ****� o   A B�� 0 etext eText� ���
� 
errn� o   9 :�� 0 enumber eNumber� ���
� 
erob� o   ; <�� 0 efrom eFrom� ���
� 
errt� o   = >�� 
0 eto eTo� ���
� 
ptlr� o   ? @�� 0 partialresult partialResult�  �&  ` ~ x targetObjectName and partialResult should be `missing value` if unused; if eTo is unused, AS seems to be to pass `item`   a ��� �   t a r g e t O b j e c t N a m e   a n d   p a r t i a l R e s u l t   s h o u l d   b e   ` m i s s i n g   v a l u e `   i f   u n u s e d ;   i f   e T o   i s   u n u s e d ,   A S   s e e m s   t o   b e   t o   p a s s   ` i t e m `L ��� l     ����  �  �  � ��� l     ��
�	�  �
  �	  � ��� l     ����  � � � convenience shortcuts for rethrowError() when targetObjectName and/or partialResult parameters aren't used (since AS handlers don't support optional parameters unless SDEFs are used, which only creates more complexity and challenges)   � ����   c o n v e n i e n c e   s h o r t c u t s   f o r   r e t h r o w E r r o r ( )   w h e n   t a r g e t O b j e c t N a m e   a n d / o r   p a r t i a l R e s u l t   p a r a m e t e r s   a r e n ' t   u s e d   ( s i n c e   A S   h a n d l e r s   d o n ' t   s u p p o r t   o p t i o n a l   p a r a m e t e r s   u n l e s s   S D E F s   a r e   u s e d ,   w h i c h   o n l y   c r e a t e s   m o r e   c o m p l e x i t y   a n d   c h a l l e n g e s )� ��� l     ����  �  �  � ��� i  ' *��� I      ���� &0 throwcommanderror throwCommandError� ��� o      �� 0 libraryname libraryName� ��� o      �� 0 handlername handlerName� ��� o      � �  0 etext eText� ��� o      ���� 0 enumber eNumber� ��� o      ���� 0 efrom eFrom� ���� o      ���� 
0 eto eTo��  �  � R     �����
�� .ascrerr ****      � ****� I    ������� 0 rethrowerror rethrowError� ��� o    ���� 0 libraryname libraryName� ��� o    ���� 0 handlername handlerName� ��� o    ���� 0 etext eText� ��� o    ���� 0 enumber eNumber� ��� o    ���� 0 efrom eFrom� ��� o    	���� 
0 eto eTo� ��� m   	 
��
�� 
msng� ���� m   
 ��
�� 
msng��  ��  ��  � ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� i  + .��� I      ������� $0 throwmethoderror throwMethodError� ��� o      ���� 0 libraryname libraryName� ��� o      ���� $0 targetobjectname targetObjectName� ��� o      ���� 0 handlername handlerName� ��� o      ���� 0 etext eText� ��� o      ���� 0 enumber eNumber� ��� o      ���� 0 efrom eFrom� ���� o      ���� 
0 eto eTo��  ��  � R     �����
�� .ascrerr ****      � ****� I    ������� 0 rethrowerror rethrowError� ��� o    ���� 0 libraryname libraryName� ��� o    ���� 0 handlername handlerName� ��� o    ���� 0 etext eText� ��� o    ���� 0 enumber eNumber� ��� o    ���� 0 efrom eFrom� ��� o    	���� 
0 eto eTo� ��� o   	 
���� $0 targetobjectname targetObjectName� ���� m   
 ��
�� 
msng��  ��  ��  � ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� l     ������  � J D--------------------------------------------------------------------   � ��� � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -� � � l     ����   convenience handlers for coercing values to commonly-used AppleScript types; these are more strict than AppleScript�s basic �VALUE as TYPE� coercions as they also reject ambiguous or problematic values, e.g. `asNumber(Wednesday)` or `asText({"foo", "bar"})`    �   c o n v e n i e n c e   h a n d l e r s   f o r   c o e r c i n g   v a l u e s   t o   c o m m o n l y - u s e d   A p p l e S c r i p t   t y p e s ;   t h e s e   a r e   m o r e   s t r i c t   t h a n   A p p l e S c r i p t  s   b a s i c    V A L U E   a s   T Y P E    c o e r c i o n s   a s   t h e y   a l s o   r e j e c t   a m b i g u o u s   o r   p r o b l e m a t i c   v a l u e s ,   e . g .   ` a s N u m b e r ( W e d n e s d a y ) `   o r   ` a s T e x t ( { " f o o " ,   " b a r " } ) `   l     ��������  ��  ��    l     ��������  ��  ��   	 i  / 2

 I      ������ 0 asnumber asNumber �� o      ���� 0 thevalue theValue��  ��   k     r  l      ����   � �
	This is more strict than AS's `NUMBER as number` coercion as it prevents booleans, month/weekday constants, empty text, or other possibly unintended values coercing to numbers.
	    �h 
 	 T h i s   i s   m o r e   s t r i c t   t h a n   A S ' s   ` N U M B E R   a s   n u m b e r `   c o e r c i o n   a s   i t   p r e v e n t s   b o o l e a n s ,   m o n t h / w e e k d a y   c o n s t a n t s ,   e m p t y   t e x t ,   o r   o t h e r   p o s s i b l y   u n i n t e n d e d   v a l u e s   c o e r c i n g   t o   n u m b e r s . 
 	  Q     e k    \  l    r      c    !"! o    ���� 0 thevalue theValue" m    ��
�� 
****  o      ���� 0 thevalue theValue ; 5 make sure ASOC objects are coerced to AS equivalents    �## j   m a k e   s u r e   A S O C   o b j e c t s   a r e   c o e r c e d   t o   A S   e q u i v a l e n t s $%$ Z   	 +&'����& F   	 ()( =   	 *+* l  	 ,����, I  	 ��-.
�� .corecnte****       ****- J   	 // 0��0 o   	 
���� 0 thevalue theValue��  . ��1��
�� 
kocl1 m    ��
�� 
list��  ��  ��  + m    ���� ) =    232 n   454 1    ��
�� 
leng5 o    ���� 0 thevalue theValue3 m    ���� ' l  ! '6786 r   ! '9:9 n  ! %;<; 4   " %��=
�� 
cobj= m   # $���� < o   ! "���� 0 thevalue theValue: o      ���� 0 thevalue theValue7   unwrap single-item list   8 �>> 0   u n w r a p   s i n g l e - i t e m   l i s t��  ��  % ?@? l  , ,��AB��  A � � (note that `count {theValue} each type/constant` doesn't work as `count` command *always* returns 0 for these types, therefore it's necessary to use a whitelist rather than blacklist check)   B �CC|   ( n o t e   t h a t   ` c o u n t   { t h e V a l u e }   e a c h   t y p e / c o n s t a n t `   d o e s n ' t   w o r k   a s   ` c o u n t `   c o m m a n d   * a l w a y s *   r e t u r n s   0   f o r   t h e s e   t y p e s ,   t h e r e f o r e   i t ' s   n e c e s s a r y   t o   u s e   a   w h i t e l i s t   r a t h e r   t h a n   b l a c k l i s t   c h e c k )@ D��D Z   , \EF����E l  , QG����G G   , QHIH =   , 7JKJ l  , 5L����L I  , 5��MN
�� .corecnte****       ****M J   , /OO P��P o   , -���� 0 thevalue theValue��  N ��Q��
�� 
koclQ m   0 1��
�� 
nmbr��  ��  ��  K m   5 6���� I F   : ORSR =   : ETUT l  : CV����V I  : C��WX
�� .corecnte****       ****W J   : =YY Z��Z o   : ;���� 0 thevalue theValue��  X ��[��
�� 
kocl[ m   > ?��
�� 
ctxt��  ��  ��  U m   C D���� S ?   H M\]\ n  H K^_^ 1   I K��
�� 
leng_ o   H I���� 0 thevalue theValue] m   K L����  ��  ��  F L   T X`` c   T Waba o   T U���� 0 thevalue theValueb m   U V��
�� 
nmbr��  ��  ��   R      ����c
�� .ascrerr ****      � ****��  c ��d��
�� 
errnd d      ee m      �������   l  d d��fg��  f S M `theValue as anything` will fail if value is a record (presumably an AS bug)   g �hh �   ` t h e V a l u e   a s   a n y t h i n g `   w i l l   f a i l   i f   v a l u e   i s   a   r e c o r d   ( p r e s u m a b l y   a n   A S   b u g ) i��i R   f r��jk
�� .ascrerr ****      � ****j m   n qll �mm X C a n  t   c o e r c e   t o   n u m b e r   ( n o t   a   v a l i d   n u m b e r ) .k ��no
�� 
errnn m   h i�����\o ��pq
�� 
erobp o   j k���� 0 thevalue theValueq ��r�
�� 
errtr l  l ms�~�}s m   l m�|
�| 
nmbr�~  �}  �  ��  	 tut l     �{�z�y�{  �z  �y  u vwv l     �x�w�v�x  �w  �v  w xyx i  3 6z{z I      �u|�t�u 0 aswholenumber asWholeNumber| }�s} o      �r�r 0 thevalue theValue�s  �t  { k     K~~ � l      �q���q  �%
		Like `asNumber`, this prevents potentially inappropriate or unintended values coercing to numbers; conversely, it accepts non-fractional real numbers, allowing whole numbers outside the range supported by AppleScript's native 30-bit integer type (which is limited to approx. �500M).
	   � ���> 
 	 	 L i k e   ` a s N u m b e r ` ,   t h i s   p r e v e n t s   p o t e n t i a l l y   i n a p p r o p r i a t e   o r   u n i n t e n d e d   v a l u e s   c o e r c i n g   t o   n u m b e r s ;   c o n v e r s e l y ,   i t   a c c e p t s   n o n - f r a c t i o n a l   r e a l   n u m b e r s ,   a l l o w i n g   w h o l e   n u m b e r s   o u t s i d e   t h e   r a n g e   s u p p o r t e d   b y   A p p l e S c r i p t ' s   n a t i v e   3 0 - b i t   i n t e g e r   t y p e   ( w h i c h   i s   l i m i t e d   t o   a p p r o x .   � 5 0 0 M ) . 
 	� ��� r     ��� I     �p��o�p 0 asnumber asNumber� ��n� o    �m�m 0 thevalue theValue�n  �o  � o      �l�l 0 	thenumber 	theNumber� ��� Z  	 ���k�j� >   	 ��� `   	 ��� o   	 
�i�i 0 	thenumber 	theNumber� m   
 �h�h � m    �g�g  � R    �f��
�f .ascrerr ****      � ****� m    �� ��� � C a n  t   c o e r c e   t o   w h o l e   n u m b e r   ( n o t   a n   i n t e g e r   o r   n o n - f r a c t i o n a l   r e a l ) .� �e��
�e 
errn� m    �d�d�\� �c��
�c 
erob� o    �b�b 0 thevalue theValue� �a��`
�a 
errt� l   ��_�^� m    �]
�] 
nmbr�_  �^  �`  �k  �j  � ��� Z    H���\�[� G     7��� l    -��Z�Y� F     -��� A     #��� o     !�X�X 0 	thenumber 	theNumber� m   ! "�W�W  � =   & +��� \   & )��� o   & '�V�V 0 	thenumber 	theNumber� m   ' (�U�U � o   ) *�T�T 0 	thenumber 	theNumber�Z  �Y  � l  0 5��S�R� =   0 5��� [   0 3��� o   0 1�Q�Q 0 	thenumber 	theNumber� m   1 2�P�P � o   3 4�O�O 0 	thenumber 	theNumber�S  �R  � R   : D�N��
�N .ascrerr ****      � ****� m   B C�� ��� � C a n  t   c o e r c e   t o   w h o l e   n u m b e r   ( c a n ' t   b e   r e p r e s e n t e d   a s   r e a l   n u m b e r   w i t h o u t   l o s i n g   p r e c i s i o n ) .� �M��
�M 
errn� m   < =�L�L�\� �K��
�K 
erob� o   > ?�J�J 0 thevalue theValue� �I��H
�I 
errt� l  @ A��G�F� m   @ A�E
�E 
nmbr�G  �F  �H  �\  �[  � ��D� L   I K�� o   I J�C�C 0 	thenumber 	theNumber�D  y ��� l     �B�A�@�B  �A  �@  � ��� l     �?�>�=�?  �>  �=  � ��� i  7 :��� I      �<��;�< 0 	asinteger 	asInteger� ��:� o      �9�9 0 thevalue theValue�:  �;  � k     $�� ��� l      �8���8  � � �
		Like `asNumber`, this prevents potentially inappropriate or unintended values coercing to integers; in addition, it raises a coercion error if the number cannot be represented .
	   � ���l 
 	 	 L i k e   ` a s N u m b e r ` ,   t h i s   p r e v e n t s   p o t e n t i a l l y   i n a p p r o p r i a t e   o r   u n i n t e n d e d   v a l u e s   c o e r c i n g   t o   i n t e g e r s ;   i n   a d d i t i o n ,   i t   r a i s e s   a   c o e r c i o n   e r r o r   i f   t h e   n u m b e r   c a n n o t   b e   r e p r e s e n t e d   . 
 	� ��� r     ��� I     �7��6�7 0 asnumber asNumber� ��5� o    �4�4 0 thevalue theValue�5  �6  � o      �3�3 0 	thenumber 	theNumber� ��� Z  	 ���2�1� >   	 ��� `   	 ��� o   	 
�0�0 0 	thenumber 	theNumber� m   
 �/�/ � m    �.�.  � R    �-��
�- .ascrerr ****      � ****� m    �� ��� 0 C a n  t   c o e r c e   t o   i n t e g e r .� �,��
�, 
errn� m    �+�+�\� �*��
�* 
erob� o    �)�) 0 thevalue theValue� �(��'
�( 
errt� l   ��&�%� m    �$
�$ 
long�&  �%  �'  �2  �1  � ��#� L     $�� c     #��� o     !�"�" 0 	thenumber 	theNumber� m   ! "�!
�! 
long�#  � ��� l     � ���   �  �  � ��� l     ����  �  �  � ��� i  ; >��� I      ���� 0 astext asText� ��� o      �� 0 thevalue theValue�  �  � k     X�� ��� l      ����  � � �
		Unlike AppleScript�s �VALUE as text� coercion, this disallows multi-item lists as the result of coercing a multi-item list to text is highly dependent on the user�s current TIDs setting and therefore unpredictable.
	   � ���� 
 	 	 U n l i k e   A p p l e S c r i p t  s    V A L U E   a s   t e x t    c o e r c i o n ,   t h i s   d i s a l l o w s   m u l t i - i t e m   l i s t s   a s   t h e   r e s u l t   o f   c o e r c i n g   a   m u l t i - i t e m   l i s t   t o   t e x t   i s   h i g h l y   d e p e n d e n t   o n   t h e   u s e r  s   c u r r e n t   T I D s   s e t t i n g   a n d   t h e r e f o r e   u n p r e d i c t a b l e . 
 	� ��� Z     S����� =     ��� l    	���� I    	�� 
� .corecnte****       ****� J      � o     �� 0 thevalue theValue�    ��
� 
kocl m    �
� 
list�  �  �  � m   	 
�� � k    O  Z    D	�
 =    

 n    1    �	
�	 
leng o    �� 0 thevalue theValue m    ��  k    3  l    r     n    4    �
� 
cobj m    ��  o    �� 0 thevalue theValue o      �� 0 thevalue theValue K E unwrap single-item list (note that nested lists are also disallowed)    � �   u n w r a p   s i n g l e - i t e m   l i s t   ( n o t e   t h a t   n e s t e d   l i s t s   a r e   a l s o   d i s a l l o w e d ) � Z   3��  =    ( l   &���� I   &�� !
�� .corecnte****       ****  J     "" #��# o    ���� 0 thevalue theValue��  ! ��$��
�� 
kocl$ m   ! "��
�� 
list��  ��  ��   m   & '����   L   + /%% c   + .&'& o   + ,���� 0 thevalue theValue' m   , -��
�� 
ctxt�  �   �  	 ()( =   6 ;*+* n  6 9,-, 1   7 9��
�� 
leng- o   6 7���� 0 thevalue theValue+ m   9 :����  ) .��. L   > @// m   > ?00 �11  ��  �
   2��2 R   E O��34
�� .ascrerr ****      � ****3 m   M N55 �66 * C a n  t   c o e r c e   t o   t e x t .4 ��78
�� 
errn7 m   G H�����\8 ��9:
�� 
erob9 o   I J���� 0 thevalue theValue: ��;��
�� 
errt; l  K L<����< m   K L��
�� 
ctxt��  ��  ��  ��  �  �  � =��= L   T X>> c   T W?@? o   T U���� 0 thevalue theValue@ m   U V��
�� 
ctxt��  � ABA l     ��������  ��  ��  B CDC l     ��������  ��  ��  D EFE i  ? BGHG I      ��I���� 0 aslist asListI J��J o      ���� 0 thevalue theValue��  ��  H k     =KK LML l      ��NO��  Nrl 
	A more robust alternative to `theValue as list` that handles records correctly, e.g. `asList({a:1,b:2})` returns `{{a:1,b:2}}` instead of `{1,2}` (AS's record-to-list coercion handler stupidly strips the record's keys, returning just its values, whereas its other TYPE-to-list coercion handlers simply wrap non-list values as a single-item list)	
	Caution: if the value is a list, it is returned as-is; handlers should not modify user-supplied lists in-place (unless that is an explicitly documented feature), but instead shallow copy it when needed, e.g. `set theListCopy to ITEMS OF asListParameter(theList,"")`.
	   O �PP�   
 	 A   m o r e   r o b u s t   a l t e r n a t i v e   t o   ` t h e V a l u e   a s   l i s t `   t h a t   h a n d l e s   r e c o r d s   c o r r e c t l y ,   e . g .   ` a s L i s t ( { a : 1 , b : 2 } ) `   r e t u r n s   ` { { a : 1 , b : 2 } } `   i n s t e a d   o f   ` { 1 , 2 } `   ( A S ' s   r e c o r d - t o - l i s t   c o e r c i o n   h a n d l e r   s t u p i d l y   s t r i p s   t h e   r e c o r d ' s   k e y s ,   r e t u r n i n g   j u s t   i t s   v a l u e s ,   w h e r e a s   i t s   o t h e r   T Y P E - t o - l i s t   c o e r c i o n   h a n d l e r s   s i m p l y   w r a p   n o n - l i s t   v a l u e s   a s   a   s i n g l e - i t e m   l i s t )  	 
 	 C a u t i o n :   i f   t h e   v a l u e   i s   a   l i s t ,   i t   i s   r e t u r n e d   a s - i s ;   h a n d l e r s   s h o u l d   n o t   m o d i f y   u s e r - s u p p l i e d   l i s t s   i n - p l a c e   ( u n l e s s   t h a t   i s   a n   e x p l i c i t l y   d o c u m e n t e d   f e a t u r e ) ,   b u t   i n s t e a d   s h a l l o w   c o p y   i t   w h e n   n e e d e d ,   e . g .   ` s e t   t h e L i s t C o p y   t o   I T E M S   O F   a s L i s t P a r a m e t e r ( t h e L i s t , " " ) ` . 
 	M QRQ Z     #ST����S F     UVU I     ��W���� 0 
isnsobject 
isNSObjectW X��X o    ���� 0 thevalue theValue��  ��  V l  	 Y����Y n  	 Z[Z I   
 ��\����  0 iskindofclass_ isKindOfClass_\ ]��] l  
 ^����^ n  
 _`_ I    �������� 	0 class  ��  ��  ` n  
 aba o    ���� 0 nsarray NSArrayb m   
 ��
�� misccura��  ��  ��  ��  [ o   	 
���� 0 thevalue theValue��  ��  T l   cdec l   fghf r    iji c    klk o    ���� 0 thevalue theValuel m    ��
�� 
listj o      ���� 0 thevalue theValueg � � note: this also coerces all of the items in the array, which may not be ideal; however, if a handler is coercing to AS list then it probably wants to work with its contents as well, and will most likely want those to be AS values too   h �mm�   n o t e :   t h i s   a l s o   c o e r c e s   a l l   o f   t h e   i t e m s   i n   t h e   a r r a y ,   w h i c h   m a y   n o t   b e   i d e a l ;   h o w e v e r ,   i f   a   h a n d l e r   i s   c o e r c i n g   t o   A S   l i s t   t h e n   i t   p r o b a b l y   w a n t s   t o   w o r k   w i t h   i t s   c o n t e n t s   a s   w e l l ,   a n d   w i l l   m o s t   l i k e l y   w a n t   t h o s e   t o   b e   A S   v a l u e s   t o od 0 * if value is NSArray, coerce it to AS list   e �nn T   i f   v a l u e   i s   N S A r r a y ,   c o e r c e   i t   t o   A S   l i s t��  ��  R opo Z  $ 8qr����q =   $ /sts l  $ -u����u I  $ -��vw
�� .corecnte****       ****v J   $ 'xx y��y o   $ %���� 0 thevalue theValue��  w ��z��
�� 
koclz m   ( )��
�� 
list��  ��  ��  t m   - .���� r L   2 4{{ o   2 3���� 0 thevalue theValue��  ��  p |��| L   9 =}} J   9 <~~ �� o   9 :���� 0 thevalue theValue��  ��  F ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� l     ������  � J D--------------------------------------------------------------------   � ��� � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -� ��� l     ������  � � � convenience handlers for coercing parameters to commonly-used AppleScript types, throwing a descriptive error if the coercion fails; use these to ensure parameters to library handlers are of the correct type   � ����   c o n v e n i e n c e   h a n d l e r s   f o r   c o e r c i n g   p a r a m e t e r s   t o   c o m m o n l y - u s e d   A p p l e S c r i p t   t y p e s ,   t h r o w i n g   a   d e s c r i p t i v e   e r r o r   i f   t h e   c o e r c i o n   f a i l s ;   u s e   t h e s e   t o   e n s u r e   p a r a m e t e r s   t o   l i b r a r y   h a n d l e r s   a r e   o f   t h e   c o r r e c t   t y p e� ��� l     ��������  ��  ��  � ��� l      ������  �ga
	theValue : anything -- the parameter value to check/coerce
	parameterName : text -- the name of the parameter; this will appear in error message if the coercion fails
	
	The result is a value of the specified type, or an error -1703 (bad parameter) giving the parameter name and the reason it failed.
	
	Notes:
	
	- While AS handlers in 10.9+ allow parameters to be directly annotated with `as TYPE` clauses, these are limited in capability and do not produce detailed error messages that explain where or why a coercion error occurred. Using asTYPEParameter handlers to sanitize parameters adds a few extra lines of code but is far more user-friendly, especially when wrapped inside a `try` block that rethrows the error with the library and handler names included as well.
	
	- To convert non-parameter values to a specific type, use the asTYPE handlers above.
   � ���� 
 	 t h e V a l u e   :   a n y t h i n g   - -   t h e   p a r a m e t e r   v a l u e   t o   c h e c k / c o e r c e 
 	 p a r a m e t e r N a m e   :   t e x t   - -   t h e   n a m e   o f   t h e   p a r a m e t e r ;   t h i s   w i l l   a p p e a r   i n   e r r o r   m e s s a g e   i f   t h e   c o e r c i o n   f a i l s 
 	 
 	 T h e   r e s u l t   i s   a   v a l u e   o f   t h e   s p e c i f i e d   t y p e ,   o r   a n   e r r o r   - 1 7 0 3   ( b a d   p a r a m e t e r )   g i v i n g   t h e   p a r a m e t e r   n a m e   a n d   t h e   r e a s o n   i t   f a i l e d . 
 	 
 	 N o t e s : 
 	 
 	 -   W h i l e   A S   h a n d l e r s   i n   1 0 . 9 +   a l l o w   p a r a m e t e r s   t o   b e   d i r e c t l y   a n n o t a t e d   w i t h   ` a s   T Y P E `   c l a u s e s ,   t h e s e   a r e   l i m i t e d   i n   c a p a b i l i t y   a n d   d o   n o t   p r o d u c e   d e t a i l e d   e r r o r   m e s s a g e s   t h a t   e x p l a i n   w h e r e   o r   w h y   a   c o e r c i o n   e r r o r   o c c u r r e d .   U s i n g   a s T Y P E P a r a m e t e r   h a n d l e r s   t o   s a n i t i z e   p a r a m e t e r s   a d d s   a   f e w   e x t r a   l i n e s   o f   c o d e   b u t   i s   f a r   m o r e   u s e r - f r i e n d l y ,   e s p e c i a l l y   w h e n   w r a p p e d   i n s i d e   a   ` t r y `   b l o c k   t h a t   r e t h r o w s   t h e   e r r o r   w i t h   t h e   l i b r a r y   a n d   h a n d l e r   n a m e s   i n c l u d e d   a s   w e l l . 
 	 
 	 -   T o   c o n v e r t   n o n - p a r a m e t e r   v a l u e s   t o   a   s p e c i f i c   t y p e ,   u s e   t h e   a s T Y P E   h a n d l e r s   a b o v e . 
� ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� i  C F��� I      ������� (0 asbooleanparameter asBooleanParameter� ��� o      ���� 0 thevalue theValue� ���� o      ���� 0 parametername parameterName��  ��  � Q     ���� L    �� c    ��� o    ���� 0 thevalue theValue� m    ��
�� 
bool� R      �����
�� .ascrerr ****      � ****��  � �����
�� 
errn� d      �� m      �������  � I    ������� 60 throwinvalidparametertype throwInvalidParameterType� ��� o    ���� 0 thevalue theValue� ��� o    ���� 0 parametername parameterName� ��� m    ��
�� 
bool� ���� m    �� ���  b o o l e a n��  ��  � ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� i  G J��� I      ������� (0 asintegerparameter asIntegerParameter� ��� o      ���� 0 thevalue theValue� ���� o      ���� 0 parametername parameterName��  ��  � Q     ���� L    �� c    ��� I    	������� 0 aswholenumber asWholeNumber� ���� o    ���� 0 thevalue theValue��  ��  � m   	 
�
� 
long� R      �~�}�
�~ .ascrerr ****      � ****�}  � �|��{
�| 
errn� d      �� m      �z�z��{  � I    �y��x�y 60 throwinvalidparametertype throwInvalidParameterType� ��� o    �w�w 0 thevalue theValue� ��� o    �v�v 0 parametername parameterName� ��� m    �u
�u 
long� ��t� m    �� ���  i n t e g e r�t  �x  � ��� l     �s�r�q�s  �r  �q  � ��� l     �p�o�n�p  �o  �n  � ��� i  K N��� I      �m��l�m 00 aswholenumberparameter asWholeNumberParameter� ��� o      �k�k 0 thevalue theValue� ��j� o      �i�i 0 parametername parameterName�j  �l  � l    ���� Q     ���� L    
�� I    	�h��g�h 0 aswholenumber asWholeNumber� ��f� o    �e�e 0 thevalue theValue�f  �g  � R      �d�c�
�d .ascrerr ****      � ****�c  � �b��a
�b 
errn� d      �� m      �`�`��a  � I    �_��^�_ 60 throwinvalidparametertype throwInvalidParameterType� ��� o    �]�] 0 thevalue theValue� ��� o    �\�\ 0 parametername parameterName� ��� m    �[
�[ 
nmbr� ��Z� m    �� ��� < i n t e g e r   o r   n o n - f r a c t i o n a l   r e a l�Z  �^  � � � this should be used instead of asIntegerParameter when non-fractional numbers are required but do not have to be specifically of integer type (which is limited in range to �2^30)   � ���f   t h i s   s h o u l d   b e   u s e d   i n s t e a d   o f   a s I n t e g e r P a r a m e t e r   w h e n   n o n - f r a c t i o n a l   n u m b e r s   a r e   r e q u i r e d   b u t   d o   n o t   h a v e   t o   b e   s p e c i f i c a l l y   o f   i n t e g e r   t y p e   ( w h i c h   i s   l i m i t e d   i n   r a n g e   t o   � 2 ^ 3 0 )� ��� l     �Y�X�W�Y  �X  �W  � ��� l     �V�U�T�V  �U  �T  � ��� i  O R��� I      �S �R�S &0 asnumberparameter asNumberParameter   o      �Q�Q 0 thevalue theValue �P o      �O�O 0 parametername parameterName�P  �R  � Q      L    
 I    	�N�M�N 0 asnumber asNumber 	�L	 o    �K�K 0 thevalue theValue�L  �M   R      �J�I

�J .ascrerr ****      � ****�I  
 �H�G
�H 
errn d       m      �F�F��G   I    �E�D�E 60 throwinvalidparametertype throwInvalidParameterType  o    �C�C 0 thevalue theValue  o    �B�B 0 parametername parameterName  m    �A
�A 
nmbr �@ m     �  n u m b e r�@  �D  �  l     �?�>�=�?  �>  �=    l     �<�;�:�<  �;  �:    i  S V I      �9�8�9 "0 asrealparameter asRealParameter  !  o      �7�7 0 thevalue theValue! "�6" o      �5�5 0 parametername parameterName�6  �8   Q     #$%# L    && c    '(' I    	�4)�3�4 0 asnumber asNumber) *�2* o    �1�1 0 thevalue theValue�2  �3  ( m   	 
�0
�0 
doub$ R      �/�.+
�/ .ascrerr ****      � ****�.  + �-,�,
�- 
errn, d      -- m      �+�+��,  % I    �*.�)�* 60 throwinvalidparametertype throwInvalidParameterType. /0/ o    �(�( 0 thevalue theValue0 121 o    �'�' 0 parametername parameterName2 343 m    �&
�& 
doub4 5�%5 m    66 �77  r e a l�%  �)   898 l     �$�#�"�$  �#  �"  9 :;: l     �!� ��!  �   �  ; <=< l     ����  �  �  = >?> l     ����  �  �  ? @A@ l     ����  �  �  A BCB i  W ZDED I      �F�� "0 astextparameter asTextParameterF GHG o      �� 0 thevalue theValueH I�I o      �� 0 parametername parameterName�  �  E l    JKLJ Q     MNOM L    
PP I    	�Q�� 0 astext asTextQ R�R o    �� 0 thevalue theValue�  �  N R      ��S
� .ascrerr ****      � ****�  S �
T�	
�
 
errnT d      UU m      ����	  O I    �V�� 60 throwinvalidparametertype throwInvalidParameterTypeV WXW o    �� 0 thevalue theValueX YZY o    �� 0 parametername parameterNameZ [\[ m    �
� 
ctxt\ ]�] m    ^^ �__  t e x t�  �  K � TO DO: should lists be rejected for safety? (while coercing numbers and dates to text is at least predictable within a process's lifetime, coercing list to text is dependent on whatever TIDs are set at the time so can't be guaranteed even to do that)   L �``�   T O   D O :   s h o u l d   l i s t s   b e   r e j e c t e d   f o r   s a f e t y ?   ( w h i l e   c o e r c i n g   n u m b e r s   a n d   d a t e s   t o   t e x t   i s   a t   l e a s t   p r e d i c t a b l e   w i t h i n   a   p r o c e s s ' s   l i f e t i m e ,   c o e r c i n g   l i s t   t o   t e x t   i s   d e p e n d e n t   o n   w h a t e v e r   T I D s   a r e   s e t   a t   t h e   t i m e   s o   c a n ' t   b e   g u a r a n t e e d   e v e n   t o   d o   t h a t )C aba l     �� ���  �   ��  b cdc l     ��������  ��  ��  d efe i  [ ^ghg I      ��i���� "0 asdateparameter asDateParameteri jkj o      ���� 0 thevalue theValuek l��l o      ���� 0 parametername parameterName��  ��  h Q     mnom l   pqrp L    ss c    tut o    ���� 0 thevalue theValueu m    ��
�� 
ldt q71 note that this fails for anything except date or NSDate (while it would be possible to try `date theValue` as well, it's probably best not to as AS's text-to-date conversion is locale-sensitive, so an ambiguous date string such as "12/11/10" would produce unpredictable results rather than fail outright)   r �vvb   n o t e   t h a t   t h i s   f a i l s   f o r   a n y t h i n g   e x c e p t   d a t e   o r   N S D a t e   ( w h i l e   i t   w o u l d   b e   p o s s i b l e   t o   t r y   ` d a t e   t h e V a l u e `   a s   w e l l ,   i t ' s   p r o b a b l y   b e s t   n o t   t o   a s   A S ' s   t e x t - t o - d a t e   c o n v e r s i o n   i s   l o c a l e - s e n s i t i v e ,   s o   a n   a m b i g u o u s   d a t e   s t r i n g   s u c h   a s   " 1 2 / 1 1 / 1 0 "   w o u l d   p r o d u c e   u n p r e d i c t a b l e   r e s u l t s   r a t h e r   t h a n   f a i l   o u t r i g h t )n R      ����w
�� .ascrerr ****      � ****��  w ��x��
�� 
errnx d      yy m      �������  o I    ��z���� 60 throwinvalidparametertype throwInvalidParameterTypez {|{ o    ���� 0 thevalue theValue| }~} o    ���� 0 parametername parameterName~ � m    ��
�� 
ldt � ���� m    �� ���  d a t e��  ��  f ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� i  _ b��� I      ������� "0 aslistparameter asListParameter� ��� o      ���� 0 thevalue theValue� ���� o      ���� 0 parametername parameterName��  ��  � l    ���� L     �� I     ������� 0 aslist asList� ���� o    ���� 0 thevalue theValue��  ��  � � | takes parameterName, even though it's unused, for consistency with other `asTYPEParameter` handlers, reducing risk of typos   � ��� �   t a k e s   p a r a m e t e r N a m e ,   e v e n   t h o u g h   i t ' s   u n u s e d ,   f o r   c o n s i s t e n c y   w i t h   o t h e r   ` a s T Y P E P a r a m e t e r `   h a n d l e r s ,   r e d u c i n g   r i s k   o f   t y p o s� ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� i  c f��� I      ������� &0 asrecordparameter asRecordParameter� ��� o      ���� 0 thevalue theValue� ���� o      ���� 0 parametername parameterName��  ��  � k     �� ��� l      ������  ���
TO DO: variant of this that also accepts defaultRecord parameter, merging the two and checking for any missing properties; simplest way to do that is for defaultRecord to use RequiredValue placeholder, coerce to list, and look for that)

e.g. from TestTool's TestSupport sub-library (although this makes some case-specific assumptions that won't work for a general-purpose solution):

to normalizeExpectedErrorRecord(errorRecord) -- ensure error info record has all the correct properties and that at least one of them is populated	-- make sure errorRecord contains at least one valid property and no invalid ones (note: this uses NoValue placeholders so isn't suitable for sending out of current AS instance)	if errorRecord's length = 0 then error "Invalid �is� parameter (error record contained no properties)." number -1703 from errorRecord to record	set normalizedRecord to errorRecord & _defaultErrorRecord	if normalizedRecord's length � _defaultErrorRecord's length then error "Invalid �is� parameter (error record contained unrecognized properties)." number -1703 from errorRecord to record	return normalizedRecordend normalizeExpectedErrorRecord
   � ���	 
 T O   D O :   v a r i a n t   o f   t h i s   t h a t   a l s o   a c c e p t s   d e f a u l t R e c o r d   p a r a m e t e r ,   m e r g i n g   t h e   t w o   a n d   c h e c k i n g   f o r   a n y   m i s s i n g   p r o p e r t i e s ;   s i m p l e s t   w a y   t o   d o   t h a t   i s   f o r   d e f a u l t R e c o r d   t o   u s e   R e q u i r e d V a l u e   p l a c e h o l d e r ,   c o e r c e   t o   l i s t ,   a n d   l o o k   f o r   t h a t ) 
 
 e . g .   f r o m   T e s t T o o l ' s   T e s t S u p p o r t   s u b - l i b r a r y   ( a l t h o u g h   t h i s   m a k e s   s o m e   c a s e - s p e c i f i c   a s s u m p t i o n s   t h a t   w o n ' t   w o r k   f o r   a   g e n e r a l - p u r p o s e   s o l u t i o n ) : 
 
 t o   n o r m a l i z e E x p e c t e d E r r o r R e c o r d ( e r r o r R e c o r d )   - -   e n s u r e   e r r o r   i n f o   r e c o r d   h a s   a l l   t h e   c o r r e c t   p r o p e r t i e s   a n d   t h a t   a t   l e a s t   o n e   o f   t h e m   i s   p o p u l a t e d  	 - -   m a k e   s u r e   e r r o r R e c o r d   c o n t a i n s   a t   l e a s t   o n e   v a l i d   p r o p e r t y   a n d   n o   i n v a l i d   o n e s   ( n o t e :   t h i s   u s e s   N o V a l u e   p l a c e h o l d e r s   s o   i s n ' t   s u i t a b l e   f o r   s e n d i n g   o u t   o f   c u r r e n t   A S   i n s t a n c e )  	 i f   e r r o r R e c o r d ' s   l e n g t h   =   0   t h e n   e r r o r   " I n v a l i d    i s    p a r a m e t e r   ( e r r o r   r e c o r d   c o n t a i n e d   n o   p r o p e r t i e s ) . "   n u m b e r   - 1 7 0 3   f r o m   e r r o r R e c o r d   t o   r e c o r d  	 s e t   n o r m a l i z e d R e c o r d   t o   e r r o r R e c o r d   &   _ d e f a u l t E r r o r R e c o r d  	 i f   n o r m a l i z e d R e c o r d ' s   l e n g t h  "`   _ d e f a u l t E r r o r R e c o r d ' s   l e n g t h   t h e n   e r r o r   " I n v a l i d    i s    p a r a m e t e r   ( e r r o r   r e c o r d   c o n t a i n e d   u n r e c o g n i z e d   p r o p e r t i e s ) . "   n u m b e r   - 1 7 0 3   f r o m   e r r o r R e c o r d   t o   r e c o r d  	 r e t u r n   n o r m a l i z e d R e c o r d  e n d   n o r m a l i z e E x p e c t e d E r r o r R e c o r d  
� ���� Q     ���� L    �� c    ��� o    ���� 0 thevalue theValue� m    ��
�� 
reco� R      �����
�� .ascrerr ****      � ****��  � �����
�� 
errn� d      �� m      �������  � I    ������� 60 throwinvalidparametertype throwInvalidParameterType� ��� o    ���� 0 thevalue theValue� ��� o    ���� 0 parametername parameterName� ��� m    ��
�� 
reco� ���� m    �� ���  r e c o r d��  ��  ��  � ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� h   g t����� 0 requiredvalue RequiredValue� l     ������  � e.g. if asOptionalRecordParameter's `defaultRecord` parameter is {foo:RequiredValue, bar:missing value}`, the `foo` property is required but the `bar` property is optional (default: `missing value`); any other properties will raise an "unrecognized properties" error   � ���   e . g .   i f   a s O p t i o n a l R e c o r d P a r a m e t e r ' s   ` d e f a u l t R e c o r d `   p a r a m e t e r   i s   { f o o : R e q u i r e d V a l u e ,   b a r : m i s s i n g   v a l u e } ` ,   t h e   ` f o o `   p r o p e r t y   i s   r e q u i r e d   b u t   t h e   ` b a r `   p r o p e r t y   i s   o p t i o n a l   ( d e f a u l t :   ` m i s s i n g   v a l u e ` ) ;   a n y   o t h e r   p r o p e r t i e s   w i l l   r a i s e   a n   " u n r e c o g n i z e d   p r o p e r t i e s "   e r r o r� ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� i  u x��� I      ������� 60 asoptionalrecordparameter asOptionalRecordParameter� ��� o      ���� 0 thevalue theValue� ��� o      ���� 0 defaultrecord defaultRecord� ���� o      ���� 0 parametername parameterName��  ��  � k     ��� ��� Q     ���� r    ��� c    ��� o    ���� 0 thevalue theValue� m    ��
�� 
reco� o      ���� 0 	therecord 	theRecord� R      �����
�� .ascrerr ****      � ****��  � �����
�� 
errn� d      �� m      �������  � I    ������� 60 throwinvalidparametertype throwInvalidParameterType� ��� o    ���� 0 thevalue theValue� ��� o    ���� 0 parametername parameterName� ��� m    ��
�� 
reco� ���� m    �� ���  r e c o r d��  ��  � ��� r    "��� b     ��� o    ���� 0 defaultrecord defaultRecord� K    �� �����
�� 
pcls� m    ��
�� 
reco��  � o      ���� 0 defaultrecord defaultRecord� ��� r   # (��� b   # &��� o   # $���� 0 	therecord 	theRecord� o   $ %���� 0 defaultrecord defaultRecord� o      ���� 0 
fullrecord 
fullRecord� ��� Z  ) @������� ?   ) 0��� n  ) ,   1   * ,��
�� 
leng o   ) *���� 0 
fullrecord 
fullRecord� n  , / 1   - /��
�� 
leng o   , -���� 0 defaultrecord defaultRecord� I   3 <������ .0 throwinvalidparameter throwInvalidParameter  o   4 5���� 0 thevalue theValue  o   5 6���� 0 parametername parameterName 	
	 m   6 7��
�� 
reco
 �� m   7 8 � h R e c o r d   c o n t a i n s   o n e   o r   m o r e   u n r e c o g n i z e d   p r o p e r t i e s .��  ��  ��  ��  �  Z  A \���� E   A L l  A D���� c   A D o   A B���� 0 
fullrecord 
fullRecord m   B C��
�� 
list��  ��   J   D K �� o   D I���� 0 requiredvalue RequiredValue��   I   O X������ .0 throwinvalidparameter throwInvalidParameter  o   P Q���� 0 thevalue theValue  o   Q R�� 0 parametername parameterName  m   R S�~
�~ 
reco  �}  m   S T!! �"" d R e c o r d   i s   m i s s i n g   o n e   o r   m o r e   r e q u i r e d   p r o p e r t i e s .�}  ��  ��  ��   #$# l  ] �%&'% Z  ] �()�|�{( H   ] j** E  ] i+,+ J   ] c-- ./. m   ] ^�z
�z 
reco/ 0�y0 n  ^ a121 m   _ a�x
�x 
pcls2 o   ^ _�w�w 0 defaultrecord defaultRecord�y  , J   c h33 4�v4 n  c f565 m   d f�u
�u 
pcls6 o   c d�t�t 0 
fullrecord 
fullRecord�v  ) I   m |�s7�r�s .0 throwinvalidparameter throwInvalidParameter7 898 o   n o�q�q 0 thevalue theValue9 :;: o   o p�p�p 0 parametername parameterName; <=< m   p q�o
�o 
reco= >�n> b   q x?@? b   q vABA m   q rCC �DD , N o t   a   r e c o r d   o f   c l a s s  B n  r uEFE m   s u�m
�m 
pclsF o   r s�l�l 0 defaultrecord defaultRecord@ m   v wGG �HH  .�n  �r  �|  �{  & } w TO DO: record class needs to be passed as text as coercing type class symbol to text will give raw chevron syntax only   ' �II �   T O   D O :   r e c o r d   c l a s s   n e e d s   t o   b e   p a s s e d   a s   t e x t   a s   c o e r c i n g   t y p e   c l a s s   s y m b o l   t o   t e x t   w i l l   g i v e   r a w   c h e v r o n   s y n t a x   o n l y$ J�kJ L   � �KK o   � ��j�j 0 
fullrecord 
fullRecord�k  � LML l     �i�h�g�i  �h  �g  M NON l     �f�e�d�f  �e  �d  O PQP i  y |RSR I      �cT�b�c &0 asscriptparameter asScriptParameterT UVU o      �a�a 0 thevalue theValueV W�`W o      �_�_ 0 parametername parameterName�`  �b  S l    XYZX Q     [\][ L    ^^ c    _`_ o    �^�^ 0 thevalue theValue` m    �]
�] 
scpt\ R      �\�[a
�\ .ascrerr ****      � ****�[  a �Zb�Y
�Z 
errnb d      cc m      �X�X��Y  ] I    �Wd�V�W 60 throwinvalidparametertype throwInvalidParameterTyped efe o    �U�U 0 thevalue theValuef ghg o    �T�T 0 parametername parameterNameh iji m    �S
�S 
scptj k�Rk m    ll �mm  s c r i p t�R  �V  Y | v TO DO: should take scriptName parameter that describes script object's purpose (e.g. "sort comparator script object")   Z �nn �   T O   D O :   s h o u l d   t a k e   s c r i p t N a m e   p a r a m e t e r   t h a t   d e s c r i b e s   s c r i p t   o b j e c t ' s   p u r p o s e   ( e . g .   " s o r t   c o m p a r a t o r   s c r i p t   o b j e c t " )Q opo l     �Q�P�O�Q  �P  �O  p qrq l     �N�M�L�N  �M  �L  r sts i  } �uvu I      �Kw�J�K "0 astypeparameter asTypeParameterw xyx o      �I�I 0 thevalue theValuey z�Hz o      �G�G 0 parametername parameterName�H  �J  v Q     {|}{ L    ~~ c    � o    �F�F 0 thevalue theValue� m    �E
�E 
type| R      �D�C�
�D .ascrerr ****      � ****�C  � �B��A
�B 
errn� d      �� m      �@�@��A  } I    �?��>�? 60 throwinvalidparametertype throwInvalidParameterType� ��� o    �=�= 0 thevalue theValue� ��� o    �<�< 0 parametername parameterName� ��� m    �;
�; 
type� ��:� m    �� ���  t y p e�:  �>  t ��� l     �9�8�7�9  �8  �7  � ��� l     �6�5�4�6  �5  �4  � ��� i  � ���� I      �3��2�3 ,0 asposixpathparameter asPOSIXPathParameter� ��� o      �1�1 0 thevalue theValue� ��0� o      �/�/ 0 parametername parameterName�0  �2  � k     .�� ��� l      �.���.  �� 
		Given any of AS's various file identifier objects (alias, �class furl�, etc) or [presumably] POSIX path text, returns path text	
		caution: this handler doesn't perform any additional validation of text-based paths (since the only way to be sure they're valid is to use them) so cannot guarantee the returned text is a valid relative/absolute POSIX path. Therefore, library code that calls this handler is responsible for catching and reporting any errors that occur if/when the returned value is used.
	   � ����   
 	 	 G i v e n   a n y   o f   A S ' s   v a r i o u s   f i l e   i d e n t i f i e r   o b j e c t s   ( a l i a s ,   � c l a s s   f u r l � ,   e t c )   o r   [ p r e s u m a b l y ]   P O S I X   p a t h   t e x t ,   r e t u r n s   p a t h   t e x t  	 
 	 	 c a u t i o n :   t h i s   h a n d l e r   d o e s n ' t   p e r f o r m   a n y   a d d i t i o n a l   v a l i d a t i o n   o f   t e x t - b a s e d   p a t h s   ( s i n c e   t h e   o n l y   w a y   t o   b e   s u r e   t h e y ' r e   v a l i d   i s   t o   u s e   t h e m )   s o   c a n n o t   g u a r a n t e e   t h e   r e t u r n e d   t e x t   i s   a   v a l i d   r e l a t i v e / a b s o l u t e   P O S I X   p a t h .   T h e r e f o r e ,   l i b r a r y   c o d e   t h a t   c a l l s   t h i s   h a n d l e r   i s   r e s p o n s i b l e   f o r   c a t c h i n g   a n d   r e p o r t i n g   a n y   e r r o r s   t h a t   o c c u r   i f / w h e n   t h e   r e t u r n e d   v a l u e   i s   u s e d . 
 	� ��-� Z     .���,�� =     ��� l    	��+�*� I    	�)��
�) .corecnte****       ****� J     �� ��(� o     �'�' 0 thevalue theValue�(  � �&��%
�& 
kocl� m    �$
�$ 
ctxt�%  �+  �*  � m   	 
�#�# � L    �� o    �"�" 0 thevalue theValue�,  � Q    .���� L    �� n    ��� 1    �!
�! 
psxp� l   �� �� c    ��� o    �� 0 thevalue theValue� m    �
� 
furl�   �  � R      ���
� .ascrerr ****      � ****�  � ���
� 
errn� d      �� m      ����  � I   % .���� 60 throwinvalidparametertype throwInvalidParameterType� ��� o   & '�� 0 thevalue theValue� ��� o   ' (�� 0 parametername parameterName� ��� m   ( )�
� 
ctxt� ��� m   ) *�� ���  P O S I X   p a t h�  �  �-  � ��� l     ����  �  �  � ��� l     ����  �  �  � ��� l     ����  � J D--------------------------------------------------------------------   � ��� � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -� ��� l     �
���
  � [ U convenience handlers for coercing parameters to commonly-used AppleScript-ObjC types   � ��� �   c o n v e n i e n c e   h a n d l e r s   f o r   c o e r c i n g   p a r a m e t e r s   t o   c o m m o n l y - u s e d   A p p l e S c r i p t - O b j C   t y p e s� ��� l     �	���	  �  �  � ��� l     ����  �  -----   � ��� 
 - - - - -� ��� l     ����  � � � NSString constructors (caution: unlike AppleScript text values, NSString does not ignore differences between composed and decomposed characters so must be explicitly normalized before searching/comparing)   � ����   N S S t r i n g   c o n s t r u c t o r s   ( c a u t i o n :   u n l i k e   A p p l e S c r i p t   t e x t   v a l u e s ,   N S S t r i n g   d o e s   n o t   i g n o r e   d i f f e r e n c e s   b e t w e e n   c o m p o s e d   a n d   d e c o m p o s e d   c h a r a c t e r s   s o   m u s t   b e   e x p l i c i t l y   n o r m a l i z e d   b e f o r e   s e a r c h i n g / c o m p a r i n g )� ��� l     ����  �  �  � ��� i  � ���� I      ��� � 0 
asnsstring 
asNSString� ���� o      ���� 0 thetext theText��  �   � l    	���� L     	�� l    ������ n    ��� I    ������� &0 stringwithstring_ stringWithString_� ���� o    ���� 0 thetext theText��  ��  � n    ��� o    ���� 0 nsstring NSString� m     ��
�� misccura��  ��  �   parameter must be text   � ��� .   p a r a m e t e r   m u s t   b e   t e x t� ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� i  � ���� I      ������� &0 asnsmutablestring asNSMutableString� ���� o      ���� 0 thetext theText��  ��  � l    	���� L     	�� l    ������ n       I    ������ &0 stringwithstring_ stringWithString_ �� o    ���� 0 thetext theText��  ��   n     o    ���� "0 nsmutablestring NSMutableString m     ��
�� misccura��  ��  �   parameter must be text   � � .   p a r a m e t e r   m u s t   b e   t e x t�  l     ��������  ��  ��   	
	 l     ��������  ��  ��  
  i  � � I      ������ ,0 asnormalizednsstring asNormalizedNSString �� o      ���� 0 thetext theText��  ��   l     L      n     I    �������� L0 $decomposedstringwithcanonicalmapping $decomposedStringWithCanonicalMapping��  ��   l    ���� n     I    ������ &0 stringwithstring_ stringWithString_ �� o    ���� 0 thetext theText��  ��   n     o    ���� 0 nsstring NSString m     ��
�� misccura��  ��     parameter must be text    � .   p a r a m e t e r   m u s t   b e   t e x t   l     ��������  ��  ��    !"! l     ��������  ��  ��  " #$# l     ��%&��  %  -----   & �'' 
 - - - - -$ ()( l     ��*+��  * ( " parameter checking and conversion   + �,, D   p a r a m e t e r   c h e c k i n g   a n d   c o n v e r s i o n) -.- l     ��������  ��  ��  . /0/ i  � �121 I      ��3���� @0 asnsregularexpressionparameter asNSRegularExpressionParameter3 454 o      ���� 0 thetext theText5 676 o      ���� 0 flagoptions flagOptions7 8��8 o      ���� 0 parametername parameterName��  ��  2 k     >99 :;: Q     '<=>< l   ?@A? r    BCB n   DED I    ��F���� Z0 +regularexpressionwithpattern_options_error_ +regularExpressionWithPattern_options_error_F GHG I    ��I���� ,0 asnormalizednsstring asNormalizedNSStringI J��J c    
KLK o    ���� 0 thetext theTextL m    	��
�� 
ctxt��  ��  H MNM o    ���� 0 flagoptions flagOptionsN O��O l   P����P m    ��
�� 
msng��  ��  ��  ��  E n   QRQ o    ���� *0 nsregularexpression NSRegularExpressionR m    ��
�� misccuraC o      ���� 0 asocpattern asocPattern@ r l NSRegularExpression doesn't return detailed error descriptions, so just use generic error description below   A �SS �   N S R e g u l a r E x p r e s s i o n   d o e s n ' t   r e t u r n   d e t a i l e d   e r r o r   d e s c r i p t i o n s ,   s o   j u s t   u s e   g e n e r i c   e r r o r   d e s c r i p t i o n   b e l o w= R      ����T
�� .ascrerr ****      � ****��  T ��U��
�� 
errnU d      VV m      �������  > I    '��W���� 60 throwinvalidparametertype throwInvalidParameterTypeW XYX o     ���� 0 thetext theTextY Z[Z o     !���� 0 parametername parameterName[ \]\ m   ! "��
�� 
ctxt] ^��^ m   " #__ �``  t e x t��  ��  ; aba Z  ( ;cd����c =  ( +efe o   ( )���� 0 asocpattern asocPatternf m   ) *��
�� 
msngd I   . 7��g���� .0 throwinvalidparameter throwInvalidParameterg hih o   / 0���� 0 thetext theTexti jkj o   0 1���� 0 parametername parameterNamek lml m   1 2��
�� 
ctxtm n��n m   2 3oo �pp ( N o t   a   v a l i d   p a t t e r n .��  ��  ��  ��  b q��q L   < >rr o   < =���� 0 asocpattern asocPattern��  0 sts l     ��������  ��  ��  t uvu l     ��������  ��  ��  v wxw i  � �yzy I      ��{���� *0 asnslocaleparameter asNSLocaleParameter{ |}| o      ���� 0 
localecode 
localeCode} ~��~ o      ���� 0 parametername parameterName��  ��  z k     t ��� l      ������  �1+
		For consistency across libraries, SDEF-based commands that take a locale name should define a `for locale` parameter as follows:
		
			<parameter name="for locale" code="Loca" type="text" optional="yes" description="a locale identifier, e.g. �en_US�, or �current� or �none� (default: �none�)"/>
	   � ���V 
 	 	 F o r   c o n s i s t e n c y   a c r o s s   l i b r a r i e s ,   S D E F - b a s e d   c o m m a n d s   t h a t   t a k e   a   l o c a l e   n a m e   s h o u l d   d e f i n e   a   ` f o r   l o c a l e `   p a r a m e t e r   a s   f o l l o w s : 
 	 	 
 	 	 	 < p a r a m e t e r   n a m e = " f o r   l o c a l e "   c o d e = " L o c a "   t y p e = " t e x t "   o p t i o n a l = " y e s "   d e s c r i p t i o n = " a   l o c a l e   i d e n t i f i e r ,   e . g .    e n _ U S  ,   o r    c u r r e n t    o r    n o n e    ( d e f a u l t :    n o n e  ) " / > 
 	� ���� P     t���� Z    s����� =   ��� o    ���� 0 
localecode 
localeCode� m    �� ���  n o n e� L    �� n   ��� I    �������� 0 systemlocale systemLocale��  ��  � n   ��� o    ���� 0 nslocale NSLocale� m    ��
�� misccura� ��� =   ��� o    ���� 0 
localecode 
localeCode� m    �� ���  c u r r e n t� ���� L    $�� n   #��� I    #�������� 0 currentlocale currentLocale��  ��  � n   ��� o    �� 0 nslocale NSLocale� m    �~
�~ misccura��  � k   ' s�� ��� Q   ' ?���� r   * /��� c   * -��� o   * +�}�} 0 
localecode 
localeCode� m   + ,�|
�| 
ctxt� o      �{�{ 0 
localecode 
localeCode� R      �z�y�
�z .ascrerr ****      � ****�y  � �x��w
�x 
errn� d      �� m      �v�v��w  � I   7 ?�u��t�u 60 throwinvalidparametertype throwInvalidParameterType� ��� o   8 9�s�s 0 
localecode 
localeCode� ��� o   9 :�r�r 0 parametername parameterName� ��q� m   : ;�� ��� p  n o   l o c a l e  ,   { c o n s t a n t ,   t e x t } ,    c u r r e n t   l o c a l e  ,   o r   t e x t�q  �t  � ��� Z  @ i���p�o� H   @ L�� E  @ K��� l  @ I��n�m� c   @ I��� n  @ G��� I   C G�l�k�j�l 80 availablelocaleidentifiers availableLocaleIdentifiers�k  �j  � n  @ C��� o   A C�i�i 0 nslocale NSLocale� m   @ A�h
�h misccura� m   G H�g
�g 
list�n  �m  � o   I J�f�f 0 
localecode 
localeCode� I   O e�e��d�e .0 throwinvalidparameter throwInvalidParameter� ��� o   P Q�c�c 0 
localecode 
localeCode� ��� o   Q R�b�b 0 parametername parameterName� ��� J   R V�� ��� m   R S�a
�a 
enum� ��`� m   S T�_
�_ 
ctxt�`  � ��^� b   V _��� b   V [��� m   V Y�� ��� , U n k n o w n   l o c a l e   n a m e :   � o   Y Z�]�] 0 
localecode 
localeCode� m   [ ^�� ���   .�^  �d  �p  �o  � ��\� l  j s���� L   j s�� n  j r��� I   m r�[��Z�[ :0 localewithlocaleidentifier_ localeWithLocaleIdentifier_� ��Y� o   m n�X�X 0 
localecode 
localeCode�Y  �Z  � n  j m��� o   k m�W�W 0 nslocale NSLocale� m   j k�V
�V misccura� * $ (locale codes are case-insensitive)   � ��� H   ( l o c a l e   c o d e s   a r e   c a s e - i n s e n s i t i v e )�\  � �U�
�U consdiac� �T�
�T conshyph� �S�
�S conspunc� �R�Q
�R conswhit�Q  � �P�
�P conscase� �O�N
�O consnume�N  ��  x ��� l     �M�L�K�M  �L  �K  � ��� l     �J�I�H�J  �I  �H  � ��� i  � ���� I      �G��F�G $0 asnsurlparameter asNSURLParameter� ��� o      �E�E 0 urltext urlText� ��D� o      �C�C 0 parametername parameterName�D  �F  � k     '�� ��� r     ��� l    ��B�A� n    ��� I    �@��?�@  0 urlwithstring_ URLWithString_� ��>� I    
�=��<�= "0 astextparameter asTextParameter�    o    �;�; 0 urltext urlText �: o    �9�9 0 parametername parameterName�:  �<  �>  �?  � n     o    �8�8 0 nsurl NSURL m     �7
�7 misccura�B  �A  � o      �6�6 0 asocurl asocURL�  l   $	 Z   $
�5�4
 =    o    �3�3 0 asocurl asocURL m    �2
�2 
msng I     �1�0�1 .0 throwinvalidparameter throwInvalidParameter  o    �/�/ 0 urltext urlText  o    �.�. 0 parametername parameterName  m    �-
�- 
ctxt �, m     �   N o t   a   v a l i d   U R L .�,  �0  �5  �4     NSURL requires RFC 1808   	 � 0   N S U R L   r e q u i r e s   R F C   1 8 0 8 �+ L   % ' o   % &�*�* 0 asocurl asocURL�+  �  l     �)�(�'�)  �(  �'    l     �&�%�$�&  �%  �$     l     �#!"�#  ! J D--------------------------------------------------------------------   " �## � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  $%$ l     �"&'�"  &   general type checking   ' �(( ,   g e n e r a l   t y p e   c h e c k i n g% )*) l     �!� ��!  �   �  * +,+ l     �-.�  -HB Caution: Use of these handlers is not recommended where their use can be avoided, as AppleScript's type system and ObjC bridge are woefully flaky and ill-defined, and may give incorrect results or unintended errors. (Mind you, the same can frequently be said of AS and ASOC themselves.) Ideally, AS itself would implement this functionality 100% safely and reliably. As a rule of thumb, it's safer (or at least less likely to blow up in UNexpected ways), if less forgiving of input values' types, just to attempt to use a given value and catch and report the error if it fails.   . �//�   C a u t i o n :   U s e   o f   t h e s e   h a n d l e r s   i s   n o t   r e c o m m e n d e d   w h e r e   t h e i r   u s e   c a n   b e   a v o i d e d ,   a s   A p p l e S c r i p t ' s   t y p e   s y s t e m   a n d   O b j C   b r i d g e   a r e   w o e f u l l y   f l a k y   a n d   i l l - d e f i n e d ,   a n d   m a y   g i v e   i n c o r r e c t   r e s u l t s   o r   u n i n t e n d e d   e r r o r s .   ( M i n d   y o u ,   t h e   s a m e   c a n   f r e q u e n t l y   b e   s a i d   o f   A S   a n d   A S O C   t h e m s e l v e s . )   I d e a l l y ,   A S   i t s e l f   w o u l d   i m p l e m e n t   t h i s   f u n c t i o n a l i t y   1 0 0 %   s a f e l y   a n d   r e l i a b l y .   A s   a   r u l e   o f   t h u m b ,   i t ' s   s a f e r   ( o r   a t   l e a s t   l e s s   l i k e l y   t o   b l o w   u p   i n   U N e x p e c t e d   w a y s ) ,   i f   l e s s   f o r g i v i n g   o f   i n p u t   v a l u e s '   t y p e s ,   j u s t   t o   a t t e m p t   t o   u s e   a   g i v e n   v a l u e   a n d   c a t c h   a n d   r e p o r t   t h e   e r r o r   i f   i t   f a i l s ., 010 l     ����  �  �  1 232 l     ����  �  �  3 454 i  � �676 I      �8�� &0 nativetypeofvalue nativeTypeOfValue8 9�9 o      �� 0 thevalue theValue�  �  7 k     Q:: ;<; l      �=>�  =��
		Given any value, returns its type name.
		
			theValue : anything
			Result : class -- the value's type name
		
		Examples:
		
			nativeTypeOfValue({class:document, text:"Hello"}) --> record
			
			nativeTypeOfValue(document 1 of application "TextEdit") --> reference
		
		Notes:
		
		- This handler does not evaluate application or reference objects, and ignores any custom `class` properties in record and script objects, so is safer and more reliable than using `class of theValue`.
	   > �??� 
 	 	 G i v e n   a n y   v a l u e ,   r e t u r n s   i t s   t y p e   n a m e . 
 	 	 
 	 	 	 t h e V a l u e   :   a n y t h i n g 
 	 	 	 R e s u l t   :   c l a s s   - -   t h e   v a l u e ' s   t y p e   n a m e 
 	 	 
 	 	 E x a m p l e s : 
 	 	 
 	 	 	 n a t i v e T y p e O f V a l u e ( { c l a s s : d o c u m e n t ,   t e x t : " H e l l o " } )   - - >   r e c o r d 
 	 	 	 
 	 	 	 n a t i v e T y p e O f V a l u e ( d o c u m e n t   1   o f   a p p l i c a t i o n   " T e x t E d i t " )   - - >   r e f e r e n c e 
 	 	 
 	 	 N o t e s : 
 	 	 
 	 	 -   T h i s   h a n d l e r   d o e s   n o t   e v a l u a t e   a p p l i c a t i o n   o r   r e f e r e n c e   o b j e c t s ,   a n d   i g n o r e s   a n y   c u s t o m   ` c l a s s `   p r o p e r t i e s   i n   r e c o r d   a n d   s c r i p t   o b j e c t s ,   s o   i s   s a f e r   a n d   m o r e   r e l i a b l e   t h a n   u s i n g   ` c l a s s   o f   t h e V a l u e ` . 
 	< @�@ Z     QABCDA >     EFE l    	G��G I    	�HI
� .corecnte****       ****H J     JJ K�K o     �� 0 thevalue theValue�  I �L�
� 
koclL m    �

�
 
obj �  �  �  F m   	 
�	�	  B l   MNOM L    PP m    �
� 
obj N #  avoid implicit dereferencing   O �QQ :   a v o i d   i m p l i c i t   d e r e f e r e n c i n gC RSR >    TUT l   V��V I   �WX
� .corecnte****       ****W J    YY Z�Z o    �� 0 thevalue theValue�  X �[�
� 
kocl[ m    � 
�  
capp�  �  �  U m    ����  S \]\ l  ! #^_`^ L   ! #aa m   ! "��
�� 
capp_ � { avoid implicit dereferencing (we don't want `application NAME` value being treated as an object specifier root, i.e. null)   ` �bb �   a v o i d   i m p l i c i t   d e r e f e r e n c i n g   ( w e   d o n ' t   w a n t   ` a p p l i c a t i o n   N A M E `   v a l u e   b e i n g   t r e a t e d   a s   a n   o b j e c t   s p e c i f i e r   r o o t ,   i . e .   n u l l )] cdc >   & 1efe l  & /g����g I  & /��hi
�� .corecnte****       ****h J   & )jj k��k o   & '���� 0 thevalue theValue��  i ��l��
�� 
kocll m   * +��
�� 
reco��  ��  ��  f m   / 0����  d mnm l  4 6opqo L   4 6rr m   4 5��
�� 
recop %  ignore custom `class` property   q �ss >   i g n o r e   c u s t o m   ` c l a s s `   p r o p e r t yn tut >   9 Dvwv l  9 Bx����x I  9 B��yz
�� .corecnte****       ****y J   9 <{{ |��| o   9 :���� 0 thevalue theValue��  z ��}��
�� 
kocl} m   = >��
�� 
scpt��  ��  ��  w m   B C����  u ~��~ l  G I�� L   G I�� m   G H��
�� 
scpt� %  ignore custom `class` property   � ��� >   i g n o r e   c u s t o m   ` c l a s s `   p r o p e r t y��  D L   L Q�� n   L P��� m   M O��
�� 
pcls� o   L M���� 0 thevalue theValue�  5 ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� i  � ���� I      ������� 0 isvalueoftype isValueOfType� ��� o      ���� 0 thevalue theValue� ���� o      ���� 0 typeclasses typeClasses��  ��  � l   ���� k    �� ��� l      ������  ���
		Important: while using a `theValue's class is typeClass` test might seem the simpler solution, it isn't reliable in practice: record and script objects can define arbitrary `class` properties; reference objects are implicitly de-referenced to the class of the referenced object instead, while application objects dereference to `null`; `class of 3 is number` always returns false, and so on. A somewhat more reliable approach takes advantage of AppleScript's query-style filtering, e.g. `every number of {3}` returns `{3}` whereas `every number of {"3"}` returns `{}`, although this doesn't work correctly across all types (e.g. `type class`, `constant`). This handler implements special-case tests for the problem cases, then uses `(count {theValue} each typeClass) � 0` to check for the rest, which is functionally equivalent to `every TYPE of {VALUE} � {}` but with the advantage that it can be parameterized with an arbitrary type class value, avoiding the need to hardcode every single query.
	   � ���� 
 	 	 I m p o r t a n t :   w h i l e   u s i n g   a   ` t h e V a l u e ' s   c l a s s   i s   t y p e C l a s s `   t e s t   m i g h t   s e e m   t h e   s i m p l e r   s o l u t i o n ,   i t   i s n ' t   r e l i a b l e   i n   p r a c t i c e :   r e c o r d   a n d   s c r i p t   o b j e c t s   c a n   d e f i n e   a r b i t r a r y   ` c l a s s `   p r o p e r t i e s ;   r e f e r e n c e   o b j e c t s   a r e   i m p l i c i t l y   d e - r e f e r e n c e d   t o   t h e   c l a s s   o f   t h e   r e f e r e n c e d   o b j e c t   i n s t e a d ,   w h i l e   a p p l i c a t i o n   o b j e c t s   d e r e f e r e n c e   t o   ` n u l l ` ;   ` c l a s s   o f   3   i s   n u m b e r `   a l w a y s   r e t u r n s   f a l s e ,   a n d   s o   o n .   A   s o m e w h a t   m o r e   r e l i a b l e   a p p r o a c h   t a k e s   a d v a n t a g e   o f   A p p l e S c r i p t ' s   q u e r y - s t y l e   f i l t e r i n g ,   e . g .   ` e v e r y   n u m b e r   o f   { 3 } `   r e t u r n s   ` { 3 } `   w h e r e a s   ` e v e r y   n u m b e r   o f   { " 3 " } `   r e t u r n s   ` { } ` ,   a l t h o u g h   t h i s   d o e s n ' t   w o r k   c o r r e c t l y   a c r o s s   a l l   t y p e s   ( e . g .   ` t y p e   c l a s s ` ,   ` c o n s t a n t ` ) .   T h i s   h a n d l e r   i m p l e m e n t s   s p e c i a l - c a s e   t e s t s   f o r   t h e   p r o b l e m   c a s e s ,   t h e n   u s e s   ` ( c o u n t   { t h e V a l u e }   e a c h   t y p e C l a s s )  "`   0 `   t o   c h e c k   f o r   t h e   r e s t ,   w h i c h   i s   f u n c t i o n a l l y   e q u i v a l e n t   t o   ` e v e r y   T Y P E   o f   { V A L U E }  "`   { } `   b u t   w i t h   t h e   a d v a n t a g e   t h a t   i t   c a n   b e   p a r a m e t e r i z e d   w i t h   a n   a r b i t r a r y   t y p e   c l a s s   v a l u e ,   a v o i d i n g   t h e   n e e d   t o   h a r d c o d e   e v e r y   s i n g l e   q u e r y . 
 	� ���� Q    ���� k    ��� ��� Z   ������� =    ��� l   ������ I   ����
�� .corecnte****       ****� J    �� ���� o    ���� 0 typeclasses typeClasses��  � �����
�� 
kocl� m    ��
�� 
list��  ��  ��  � m    ����  � r    ��� J    �� ���� o    ���� 0 typeclasses typeClasses��  � o      ���� 0 typeclasses typeClasses��  ��  � ��� X    ������ k   + ��� ��� Q   + I���� r   . 5��� c   . 3��� n   . 1��� 1   / 1��
�� 
pcnt� o   . /���� 0 aref aRef� m   1 2��
�� 
pcls� o      ���� 0 	typeclass 	typeClass� R      �����
�� .ascrerr ****      � ****��  � �����
�� 
errn� d      �� m      �������  � l  = I���� R   = I�����
�� .ascrerr ****      � ****� I   ? H������� 60 throwinvalidparametertype throwInvalidParameterType� ��� o   @ A���� 0 	typeclass 	typeClass� ��� m   A B�� ���  i s   t y p e� ��� m   B C��
�� 
pcls� ���� m   C D�� ��� @ t y p e   c l a s s   o r   l i s t   o f   t y p e   c l a s s��  ��  ��  � * $ TO DO: move to asTypeClassParameter   � ��� H   T O   D O :   m o v e   t o   a s T y p e C l a s s P a r a m e t e r� ��� l  J J������  � � � note: `count {theValue} each class/constant` doesn't work when theValue is a type class/constant symbol (e.g. `integer`/`yes`), so these need to be explicitly checked -- TO DO: are there any other AS type classes that also need special handling   � ����   n o t e :   ` c o u n t   { t h e V a l u e }   e a c h   c l a s s / c o n s t a n t `   d o e s n ' t   w o r k   w h e n   t h e V a l u e   i s   a   t y p e   c l a s s / c o n s t a n t   s y m b o l   ( e . g .   ` i n t e g e r ` / ` y e s ` ) ,   s o   t h e s e   n e e d   t o   b e   e x p l i c i t l y   c h e c k e d   - -   T O   D O :   a r e   t h e r e   a n y   o t h e r   A S   t y p e   c l a s s e s   t h a t   a l s o   n e e d   s p e c i a l   h a n d l i n g� ���� Z   J ������� G   J U��� =  J M��� o   J K���� 0 	typeclass 	typeClass� m   K L��
�� 
pcls� =  P S��� o   P Q���� 0 	typeclass 	typeClass� m   Q R��
�� 
type� l  X ����� k   X ��� ��� l  X X������  � � � check value is not a reference type (be aware that library's SDEF terminology reformats `reference` keyword as `specifier`), then try coercing it to type class, and finally check it's unchanged -- TO DO: check this covers all corner cases   � ����   c h e c k   v a l u e   i s   n o t   a   r e f e r e n c e   t y p e   ( b e   a w a r e   t h a t   l i b r a r y ' s   S D E F   t e r m i n o l o g y   r e f o r m a t s   ` r e f e r e n c e `   k e y w o r d   a s   ` s p e c i f i e r ` ) ,   t h e n   t r y   c o e r c i n g   i t   t o   t y p e   c l a s s ,   a n d   f i n a l l y   c h e c k   i t ' s   u n c h a n g e d   - -   T O   D O :   c h e c k   t h i s   c o v e r s   a l l   c o r n e r   c a s e s� ���� Q   X ������ Z  [ y������� F   [ p��� =   [ f��� l  [ d������ I  [ d����
�� .corecnte****       ****� J   [ ^�� ���� o   [ \���� 0 thevalue theValue��  � �����
�� 
kocl� m   _ `��
�� 
obj ��  ��  ��  � m   d e����  � =  i n��� c   i l��� l 	 i j ����  o   i j���� 0 thevalue theValue��  ��  � m   j k��
�� 
pcls� o   l m���� 0 thevalue theValue� L   s u m   s t��
�� boovtrue��  ��  � R      ����
�� .ascrerr ****      � ****��   ����
�� 
errn d       m      �������  ��  ��  �'! TO DO: this could be problematic (AS is murky on distinction between `class` and `type class`, treating them as synonymous when used in `as` operation but not when comparing them; be aware that library's SDEF causes `type class` keyword to reformat as `type` keyword (for added confusion)   � �B   T O   D O :   t h i s   c o u l d   b e   p r o b l e m a t i c   ( A S   i s   m u r k y   o n   d i s t i n c t i o n   b e t w e e n   ` c l a s s `   a n d   ` t y p e   c l a s s ` ,   t r e a t i n g   t h e m   a s   s y n o n y m o u s   w h e n   u s e d   i n   ` a s `   o p e r a t i o n   b u t   n o t   w h e n   c o m p a r i n g   t h e m ;   b e   a w a r e   t h a t   l i b r a r y ' s   S D E F   c a u s e s   ` t y p e   c l a s s `   k e y w o r d   t o   r e f o r m a t   a s   ` t y p e `   k e y w o r d   ( f o r   a d d e d   c o n f u s i o n )�  =  � �	 o   � ����� 0 	typeclass 	typeClass	 m   � ���
�� 
enum 

 Q   � ��� Z  � ����� F   � � =   � � l  � ����� I  � ���
�� .corecnte****       **** J   � � �� o   � ����� 0 thevalue theValue��   ����
�� 
kocl m   � ���
�� 
obj ��  ��  ��   m   � �����   =  � � c   � � l 	 � ����� o   � ����� 0 thevalue theValue��  ��   m   � ���
�� 
enum o   � ����� 0 thevalue theValue L   � � m   � ���
�� boovtrue��  ��   R      ���� 
�� .ascrerr ****      � ****��    ��!��
�� 
errn! d      "" m      �������  ��   #$# =  � �%&% o   � ����� 0 typeclasses typeClasses& m   � ���
�� 
ocid$ '(' l  � �)*+) L   � �,, I   � ��-�~� 0 
isnsobject 
isNSObject- .�}. o   � ��|�| 0 thevalue theValue�}  �~  * * $ is it an AppleScriptObjC specifier?   + �// H   i s   i t   a n   A p p l e S c r i p t O b j C   s p e c i f i e r ?( 010 >   � �232 l  � �4�{�z4 I  � ��y56
�y .corecnte****       ****5 J   � �77 8�x8 o   � ��w�w 0 thevalue theValue�x  6 �v9�u
�v 
kocl9 m   � ��t
�t 
capp�u  �{  �z  3 m   � ��s�s  1 :;: L   � �<< =  � �=>= o   � ��r�r 0 	typeclass 	typeClass> m   � ��q
�q 
capp; ?@? >   � �ABA l  � �C�p�oC I  � ��nDE
�n .corecnte****       ****D J   � �FF G�mG o   � ��l�l 0 thevalue theValue�m  E �kH�j
�k 
koclH o   � ��i�i 0 	typeclass 	typeClass�j  �p  �o  B m   � ��h�h  @ I�gI l  � �JKLJ L   � �MM m   � ��f
�f boovtrueK y s other AS types can be reliably filtered using a `count` command -- TO DO: need to confirm this works for all types   L �NN �   o t h e r   A S   t y p e s   c a n   b e   r e l i a b l y   f i l t e r e d   u s i n g   a   ` c o u n t `   c o m m a n d   - -   T O   D O :   n e e d   t o   c o n f i r m   t h i s   w o r k s   f o r   a l l   t y p e s�g  ��  ��  �� 0 aref aRef� o    �e�e 0 typeclasses typeClasses� O�dO L   � �PP m   � ��c
�c boovfals�d  � R      �bQR
�b .ascrerr ****      � ****Q o      �a�a 0 etext eTextR �`ST
�` 
errnS o      �_�_ 0 enumber eNumberT �^UV
�^ 
erobU o      �]�] 0 efrom eFromV �\W�[
�\ 
errtW o      �Z�Z 
0 eto eTo�[  � I  �YX�X�Y 
0 _error  X YZY m  [[ �\\  i s V a l u e O f T y p eZ ]^] o  �W�W 0 etext eText^ _`_ o  �V�V 0 enumber eNumber` aba o  �U�U 0 efrom eFromb c�Tc o  �S�S 
0 eto eTo�T  �X  ��  � �  performs a 'VALUE is-a CLASS' test, which is trickier than it sounds since AppleScript has neither classes nor `is-a` operator   � �dd �   p e r f o r m s   a   ' V A L U E   i s - a   C L A S S '   t e s t ,   w h i c h   i s   t r i c k i e r   t h a n   i t   s o u n d s   s i n c e   A p p l e S c r i p t   h a s   n e i t h e r   c l a s s e s   n o r   ` i s - a `   o p e r a t o r� efe l     �R�Q�P�R  �Q  �P  f ghg l     �O�N�M�O  �N  �M  h iji i  � �klk I      �Lm�K�L 0 
isnsobject 
isNSObjectm n�Jn o      �I�I 0 thevalue theValue�J  �K  l k     /oo pqp l      �Hrs�H  rUO
		Returns true if the value is an AppleScript-ObjectiveC object specifier (�class ocid� id �data optr...�)
		
			theValue : anything
			Result: boolean
			
		Notes:
		
		- This implementation is not ideal, as given an application specifier it will try to send the isKindOfClass: message to it, whereas we just want to check the specifier's type, not launch a target app/send a message to it/etc. Similarly, it's possible to spoof the result by passing a reference to an ASOC/non-ASOC script object that implements its own isKindOfClass: handler that returns false/true.
		
		 - Unfortunately, the alternative hack - coercing the reference to raw typeObjectSpecifier record then checking its �class want� property is �class ocid� doesn't always work either, e.g. given an NSDictionary it coerces that to a record instead of the specifier itself.
	   s �tt� 
 	 	 R e t u r n s   t r u e   i f   t h e   v a l u e   i s   a n   A p p l e S c r i p t - O b j e c t i v e C   o b j e c t   s p e c i f i e r   ( � c l a s s   o c i d �   i d   � d a t a   o p t r . . . � ) 
 	 	 
 	 	 	 t h e V a l u e   :   a n y t h i n g 
 	 	 	 R e s u l t :   b o o l e a n 
 	 	 	 
 	 	 N o t e s : 
 	 	 
 	 	 -   T h i s   i m p l e m e n t a t i o n   i s   n o t   i d e a l ,   a s   g i v e n   a n   a p p l i c a t i o n   s p e c i f i e r   i t   w i l l   t r y   t o   s e n d   t h e   i s K i n d O f C l a s s :   m e s s a g e   t o   i t ,   w h e r e a s   w e   j u s t   w a n t   t o   c h e c k   t h e   s p e c i f i e r ' s   t y p e ,   n o t   l a u n c h   a   t a r g e t   a p p / s e n d   a   m e s s a g e   t o   i t / e t c .   S i m i l a r l y ,   i t ' s   p o s s i b l e   t o   s p o o f   t h e   r e s u l t   b y   p a s s i n g   a   r e f e r e n c e   t o   a n   A S O C / n o n - A S O C   s c r i p t   o b j e c t   t h a t   i m p l e m e n t s   i t s   o w n   i s K i n d O f C l a s s :   h a n d l e r   t h a t   r e t u r n s   f a l s e / t r u e . 
 	 	 
 	 	   -   U n f o r t u n a t e l y ,   t h e   a l t e r n a t i v e   h a c k   -   c o e r c i n g   t h e   r e f e r e n c e   t o   r a w   t y p e O b j e c t S p e c i f i e r   r e c o r d   t h e n   c h e c k i n g   i t s   � c l a s s   w a n t �   p r o p e r t y   i s   � c l a s s   o c i d �   d o e s n ' t   a l w a y s   w o r k   e i t h e r ,   e . g .   g i v e n   a n   N S D i c t i o n a r y   i t   c o e r c e s   t h a t   t o   a   r e c o r d   i n s t e a d   o f   t h e   s p e c i f i e r   i t s e l f . 
 	q uvu Z    wx�G�Fw =     yzy l    	{�E�D{ I    	�C|}
�C .corecnte****       ****| J     ~~ �B o     �A�A 0 thevalue theValue�B  } �@��?
�@ 
kocl� m    �>
�> 
obj �?  �E  �D  z m   	 
�=�=  x L    �� m    �<
�< boovfals�G  �F  v ��;� Q    /���� L    %�� n   $��� I    $�:��9�:  0 iskindofclass_ isKindOfClass_� ��8� l    ��7�6� n    ��� I     �5�4�3�5 	0 class  �4  �3  � n   ��� o    �2�2 0 nsobject NSObject� m    �1
�1 misccura�7  �6  �8  �9  � o    �0�0 0 thevalue theValue� R      �/�.�-
�/ .ascrerr ****      � ****�.  �-  � l  - /���� L   - /�� m   - .�,
�, boovfals� � � the above statement may fail in numerous ways, so all we can do is catch all errors and hope they were due to theValue not being an ASOC object rather than caused by something else   � ���j   t h e   a b o v e   s t a t e m e n t   m a y   f a i l   i n   n u m e r o u s   w a y s ,   s o   a l l   w e   c a n   d o   i s   c a t c h   a l l   e r r o r s   a n d   h o p e   t h e y   w e r e   d u e   t o   t h e V a l u e   n o t   b e i n g   a n   A S O C   o b j e c t   r a t h e r   t h a n   c a u s e d   b y   s o m e t h i n g   e l s e�;  j ��� l     �+�*�)�+  �*  �)  � ��� l     �(�'�&�(  �'  �&  � ��� l     �%�$�#�%  �$  �#  � ��� l     �"���"  � J D--------------------------------------------------------------------   � ��� � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -� ��� l     �!���!  �   AS<->ObjC conversion   � ��� *   A S < - > O b j C   c o n v e r s i o n� ��� l     � ���   �  �  � ��� l     ����  �  �  � ��� i  � ���� I      ���� 0 
asnsobject 
asNSObject� ��� o      �� 0 thevalue theValue�  �  � k     �� ��� l      ����  ���
		Convert any AS value to its Cocoa equivalent.
		
		Notes:
		
		- AS script objects will be converted to OSAID script instances. (Beware of exchanging large numbers of script objects as this may cause stability problems.)
		
		- Other AS types that are not bridged to specific Cocoa classes (e.g. type and constant symbols) are converted to NSAppleEventDescriptor instances.
		
		Caution:
		
		- Avoid converting application references to ASOC objects: ASOC converts these to NSAppleEventDescriptors of typeObjectSpecifier but in doing so loses their target application information, making conversion of these specifiers back to AppleScript and their subsequent use problematic. (This is a known limitation of the ASOC bridge.)
		
	   � ���� 
 	 	 C o n v e r t   a n y   A S   v a l u e   t o   i t s   C o c o a   e q u i v a l e n t . 
 	 	 
 	 	 N o t e s : 
 	 	 
 	 	 -   A S   s c r i p t   o b j e c t s   w i l l   b e   c o n v e r t e d   t o   O S A I D   s c r i p t   i n s t a n c e s .   ( B e w a r e   o f   e x c h a n g i n g   l a r g e   n u m b e r s   o f   s c r i p t   o b j e c t s   a s   t h i s   m a y   c a u s e   s t a b i l i t y   p r o b l e m s . ) 
 	 	 
 	 	 -   O t h e r   A S   t y p e s   t h a t   a r e   n o t   b r i d g e d   t o   s p e c i f i c   C o c o a   c l a s s e s   ( e . g .   t y p e   a n d   c o n s t a n t   s y m b o l s )   a r e   c o n v e r t e d   t o   N S A p p l e E v e n t D e s c r i p t o r   i n s t a n c e s . 
 	 	 
 	 	 C a u t i o n : 
 	 	 
 	 	 -   A v o i d   c o n v e r t i n g   a p p l i c a t i o n   r e f e r e n c e s   t o   A S O C   o b j e c t s :   A S O C   c o n v e r t s   t h e s e   t o   N S A p p l e E v e n t D e s c r i p t o r s   o f   t y p e O b j e c t S p e c i f i e r   b u t   i n   d o i n g   s o   l o s e s   t h e i r   t a r g e t   a p p l i c a t i o n   i n f o r m a t i o n ,   m a k i n g   c o n v e r s i o n   o f   t h e s e   s p e c i f i e r s   b a c k   t o   A p p l e S c r i p t   a n d   t h e i r   s u b s e q u e n t   u s e   p r o b l e m a t i c .   ( T h i s   i s   a   k n o w n   l i m i t a t i o n   o f   t h e   A S O C   b r i d g e . ) 
 	 	 
 	� ��� L     �� n    ��� I    ����  0 objectatindex_ objectAtIndex_� ��� m    	��  �  �  � l    ���� n    ��� I    ���� $0 arraywithobject_ arrayWithObject_� ��� o    �� 0 thevalue theValue�  �  � n    ��� o    �
�
 0 nsarray NSArray� m     �	
�	 misccura�  �  �  � ��� l     ����  �  �  � ��� l     ����  �  �  � ��� i  � ���� I      ���� 0 
asasobject 
asASObject� �� � o      ���� 0 thevalue theValue�   �  � k     �� ��� l      ������  ���
		If the value is an AppleScript-ObjectiveC object specifier (�class ocid� id �data optr...�) then coerces it to equivalent AS value if possible, otherwise returns it as-is.
		
			theValue : anything
			Result: anything
		
		Notes:
		
		- This is more safer and more reliable than using `theValue as anything`, which will automatically resolve an application reference (which may not be what you want) or fail if theValue is a record (presumably due to AS stupidity or bug).
		
		- Only Cocoa objects with AS equivalents are converted; e.g. an NSDictionary instance will be converted to a record, but an NSSet instance will be returned as-is because the AppleScript-ObjectiveC bridge does not provide an AS<->ObjC mapping for that.
	   � ���� 
 	 	 I f   t h e   v a l u e   i s   a n   A p p l e S c r i p t - O b j e c t i v e C   o b j e c t   s p e c i f i e r   ( � c l a s s   o c i d �   i d   � d a t a   o p t r . . . � )   t h e n   c o e r c e s   i t   t o   e q u i v a l e n t   A S   v a l u e   i f   p o s s i b l e ,   o t h e r w i s e   r e t u r n s   i t   a s - i s . 
 	 	 
 	 	 	 t h e V a l u e   :   a n y t h i n g 
 	 	 	 R e s u l t :   a n y t h i n g 
 	 	 
 	 	 N o t e s : 
 	 	 
 	 	 -   T h i s   i s   m o r e   s a f e r   a n d   m o r e   r e l i a b l e   t h a n   u s i n g   ` t h e V a l u e   a s   a n y t h i n g ` ,   w h i c h   w i l l   a u t o m a t i c a l l y   r e s o l v e   a n   a p p l i c a t i o n   r e f e r e n c e   ( w h i c h   m a y   n o t   b e   w h a t   y o u   w a n t )   o r   f a i l   i f   t h e V a l u e   i s   a   r e c o r d   ( p r e s u m a b l y   d u e   t o   A S   s t u p i d i t y   o r   b u g ) . 
 	 	 
 	 	 -   O n l y   C o c o a   o b j e c t s   w i t h   A S   e q u i v a l e n t s   a r e   c o n v e r t e d ;   e . g .   a n   N S D i c t i o n a r y   i n s t a n c e   w i l l   b e   c o n v e r t e d   t o   a   r e c o r d ,   b u t   a n   N S S e t   i n s t a n c e   w i l l   b e   r e t u r n e d   a s - i s   b e c a u s e   t h e   A p p l e S c r i p t - O b j e c t i v e C   b r i d g e   d o e s   n o t   p r o v i d e   a n   A S < - > O b j C   m a p p i n g   f o r   t h a t . 
 	� ���� Z     ������ I     ������� 0 
isnsobject 
isNSObject� ���� o    ���� 0 thevalue theValue��  ��  � l  	 ���� L   	 �� c   	 ��� o   	 
���� 0 thevalue theValue� m   
 ��
�� 
****� 5 / coerce ASOC specifier to AS value, if possible   � ��� ^   c o e r c e   A S O C   s p e c i f i e r   t o   A S   v a l u e ,   i f   p o s s i b l e��  � L    �� o    ���� 0 thevalue theValue��  � ��� l     ��������  ��  ��  � ���� l     ��������  ��  ��  ��       *�������������������������������	 											
	��  � (��������������������������������������������������������������������������������
�� 
pimr�� 0 
hashandler 
hasHandler�� 00 _throwinvalidparameter _throwInvalidParameter�� .0 throwinvalidparameter throwInvalidParameter�� 80 throwinvalidparameterindex throwInvalidParameterIndex�� 60 throwinvalidparametertype throwInvalidParameterType�� >0 throwinvalidconstantparameter throwInvalidConstantParameter�� 0 rethrowerror rethrowError�� &0 throwcommanderror throwCommandError�� $0 throwmethoderror throwMethodError�� 0 asnumber asNumber�� 0 aswholenumber asWholeNumber�� 0 	asinteger 	asInteger�� 0 astext asText�� 0 aslist asList�� (0 asbooleanparameter asBooleanParameter�� (0 asintegerparameter asIntegerParameter�� 00 aswholenumberparameter asWholeNumberParameter�� &0 asnumberparameter asNumberParameter�� "0 asrealparameter asRealParameter�� "0 astextparameter asTextParameter�� "0 asdateparameter asDateParameter�� "0 aslistparameter asListParameter�� &0 asrecordparameter asRecordParameter�� 0 requiredvalue RequiredValue�� 60 asoptionalrecordparameter asOptionalRecordParameter�� &0 asscriptparameter asScriptParameter�� "0 astypeparameter asTypeParameter�� ,0 asposixpathparameter asPOSIXPathParameter�� 0 
asnsstring 
asNSString�� &0 asnsmutablestring asNSMutableString�� ,0 asnormalizednsstring asNormalizedNSString�� @0 asnsregularexpressionparameter asNSRegularExpressionParameter�� *0 asnslocaleparameter asNSLocaleParameter�� $0 asnsurlparameter asNSURLParameter�� &0 nativetypeofvalue nativeTypeOfValue�� 0 isvalueoftype isValueOfType�� 0 
isnsobject 
isNSObject�� 0 
asnsobject 
asNSObject�� 0 
asasobject 
asASObject� ��	�� 	  		 ��	��
�� 
cobj	 		   �� 
�� 
frmk��  � �� 8����		���� 0 
hashandler 
hasHandler�� ��	�� 	  ���� 0 
handlerref 
handlerRef��  	 ���� 0 
handlerref 
handlerRef	 ����	
�� 
hand��  	 ������
�� 
errn���\��  ��  ��&OeW 	X  f� �� l����		���� 00 _throwinvalidparameter _throwInvalidParameter�� ��	�� 	  ������������ 0 thevalue theValue�� 0 parametername parameterName�� 0 expectedtype expectedType�� $0 errordescription errorDescription�� 0 errornumber errorNumber��  	 ������������ 0 thevalue theValue�� 0 parametername parameterName�� 0 expectedtype expectedType�� $0 errordescription errorDescription�� 0 errornumber errorNumber	 
�� � � ��������� � �
�� 
leng
�� 
errn
�� 
erob
�� 
errt�� �� '��,j  �E�Y 	�%�%E�O)�����%�%�%� �� �����		���� .0 throwinvalidparameter throwInvalidParameter�� ��	�� 	  ���������� 0 thevalue theValue�� 0 parametername parameterName�� 0 expectedtype expectedType�� $0 errordescription errorDescription��  	 ���������� 0 thevalue theValue�� 0 parametername parameterName�� 0 expectedtype expectedType�� $0 errordescription errorDescription	 ���������Y�� �� 00 _throwinvalidparameter _throwInvalidParameter�� *������+ � �� �����		���� 80 throwinvalidparameterindex throwInvalidParameterIndex�� ��	�� 	  ������ 0 thevalue theValue�� 0 parametername parameterName��  	 ������ 0 thevalue theValue�� 0 parametername parameterName	 �� �������
�� 
long���@�� �� 00 _throwinvalidparameter _throwInvalidParameter�� *������+ � �� �����		���� 60 throwinvalidparametertype throwInvalidParameterType�� �	� 	  �~�}�|�{�~ 0 thevalue theValue�} 0 parametername parameterName�| 0 expectedtype expectedType�{ $0 expectedtypename expectedTypeName��  	 �z�y�x�w�v�z 0 thevalue theValue�y 0 parametername parameterName�x 0 expectedtype expectedType�w $0 expectedtypename expectedTypeName�v  0 actualtypename actualTypeName	 �u�t�s�r�q�p')�o�n
�u 
kocl
�t 
obj 
�s .corecnte****       ****
�r 
pcls�q  �p  �o �n .0 throwinvalidparameter throwInvalidParameter�� :  �kv��l j �E�Y 	��,%E�W 
X  �E�O*����%�%�%�+ � �m2�l�k	 	!�j�m >0 throwinvalidconstantparameter throwInvalidConstantParameter�l �i	"�i 	"  �h�g�h 0 thevalue theValue�g 0 parametername parameterName�k  	  �f�e�f 0 thevalue theValue�e 0 parametername parameterName	! �d?�c�b
�d 
enum�c �b .0 throwinvalidparameter throwInvalidParameter�j 
*�����+ � �aN�`�_	#	$�^�a 0 rethrowerror rethrowError�` �]	%�] 	%  �\�[�Z�Y�X�W�V�U�\ 0 libraryname libraryName�[ 0 handlername handlerName�Z 0 etext eText�Y 0 enumber eNumber�X 0 efrom eFrom�W 
0 eto eTo�V $0 targetobjectname targetObjectName�U 0 partialresult partialResult�_  	# �T�S�R�Q�P�O�N�M�T 0 libraryname libraryName�S 0 handlername handlerName�R 0 etext eText�Q 0 enumber eNumber�P 0 efrom eFrom�O 
0 eto eTo�N $0 targetobjectname targetObjectName�M 0 partialresult partialResult	$ �Ltv����K�J�I�H�G�F
�L 
msng
�K 
errn
�J 
erob
�I 
errt�H 
�G 
ptlr�F �^ D��  ��%�%�%�%E�Y ��%�%�%�%�%�%E�O��  )����Y )������ �E��D�C	&	'�B�E &0 throwcommanderror throwCommandError�D �A	(�A 	(  �@�?�>�=�<�;�@ 0 libraryname libraryName�? 0 handlername handlerName�> 0 etext eText�= 0 enumber eNumber�< 0 efrom eFrom�; 
0 eto eTo�C  	& �:�9�8�7�6�5�: 0 libraryname libraryName�9 0 handlername handlerName�8 0 etext eText�7 0 enumber eNumber�6 0 efrom eFrom�5 
0 eto eTo	' �4�3�2
�4 
msng�3 �2 0 rethrowerror rethrowError�B )j*���������+ � �1��0�/	)	*�.�1 $0 throwmethoderror throwMethodError�0 �-	+�- 	+  �,�+�*�)�(�'�&�, 0 libraryname libraryName�+ $0 targetobjectname targetObjectName�* 0 handlername handlerName�) 0 etext eText�( 0 enumber eNumber�' 0 efrom eFrom�& 
0 eto eTo�/  	) �%�$�#�"�!� ��% 0 libraryname libraryName�$ $0 targetobjectname targetObjectName�# 0 handlername handlerName�" 0 etext eText�! 0 enumber eNumber�  0 efrom eFrom� 
0 eto eTo	* ���
� 
msng� � 0 rethrowerror rethrowError�. )j*���������+ � ���	,	-�� 0 asnumber asNumber� �	.� 	.  �� 0 thevalue theValue�  	, �� 0 thevalue theValue	- ����������	/�
�	���l
� 
****
� 
kocl
� 
list
� .corecnte****       ****
� 
leng
� 
bool
� 
cobj
� 
nmbr
� 
ctxt�  	/ ���
� 
errn��\�  
�
 
errn�	�\
� 
erob
� 
errt� � s ^��&E�O�kv��l k 	 	��,k �& ��k/E�Y hO�kv��l k 
 �kv��l k 	 	��,j�&�& 	��&Y hW X 	 
hO)�������a � �{�� 	0	1��� 0 aswholenumber asWholeNumber� ��	2�� 	2  ���� 0 thevalue theValue�   	0 ������ 0 thevalue theValue�� 0 	thenumber 	theNumber	1 
�������������������� 0 asnumber asNumber
�� 
errn���\
�� 
erob
�� 
errt
�� 
nmbr�� 
�� 
bool�� L*�k+  E�O�k#j )�������Y hO�j	 	�k� �&
 	�k� �& )�������Y hO�� �������	3	4���� 0 	asinteger 	asInteger�� ��	5�� 	5  ���� 0 thevalue theValue��  	3 ������ 0 thevalue theValue�� 0 	thenumber 	theNumber	4 ����������������� 0 asnumber asNumber
�� 
errn���\
�� 
erob
�� 
errt
�� 
long�� �� %*�k+  E�O�k#j )�������Y hO��&� �������	6	7���� 0 astext asText�� ��	8�� 	8  ���� 0 thevalue theValue��  	6 ���� 0 thevalue theValue	7 ������������0����������5
�� 
kocl
�� 
list
�� .corecnte****       ****
�� 
leng
�� 
cobj
�� 
ctxt
�� 
errn���\
�� 
erob
�� 
errt�� �� Y�kv��l k  F��,k  "��k/E�O�kv��l j  	��&Y hY ��,j  �Y hO)�������Y hO��&� ��H����	9	:���� 0 aslist asList�� ��	;�� 	;  ���� 0 thevalue theValue��  	9 ���� 0 thevalue theValue	: 	�������������������� 0 
isnsobject 
isNSObject
�� misccura�� 0 nsarray NSArray�� 	0 class  ��  0 iskindofclass_ isKindOfClass_
�� 
bool
�� 
list
�� 
kocl
�� .corecnte****       ****�� >*�k+  	 ���,j+ k+ �& 
��&E�Y hO�kv��l k  �Y hO�kv� �������	<	=���� (0 asbooleanparameter asBooleanParameter�� ��	>�� 	>  ������ 0 thevalue theValue�� 0 parametername parameterName��  	< ������ 0 thevalue theValue�� 0 parametername parameterName	= ����	?�����
�� 
bool��  	? ������
�� 
errn���\��  �� �� 60 throwinvalidparametertype throwInvalidParameterType��  	��&W X  *�����+ � �������	@	A���� (0 asintegerparameter asIntegerParameter�� ��	B�� 	B  ������ 0 thevalue theValue�� 0 parametername parameterName��  	@ ������ 0 thevalue theValue�� 0 parametername parameterName	A ������	C������� 0 aswholenumber asWholeNumber
�� 
long��  	C ������
�� 
errn���\��  �� �� 60 throwinvalidparametertype throwInvalidParameterType��  *�k+  �&W X  *�����+ � �������	D	E���� 00 aswholenumberparameter asWholeNumberParameter�� ��	F�� 	F  ������ 0 thevalue theValue�� 0 parametername parameterName��  	D ������ 0 thevalue theValue�� 0 parametername parameterName	E ����	G��������� 0 aswholenumber asWholeNumber��  	G ������
�� 
errn���\��  
�� 
nmbr�� �� 60 throwinvalidparametertype throwInvalidParameterType��  *�k+  W X  *�����+ � �������	H	I���� &0 asnumberparameter asNumberParameter�� ��	J�� 	J  ������ 0 thevalue theValue�� 0 parametername parameterName��  	H ������ 0 thevalue theValue�� 0 parametername parameterName	I ����	K�������� 0 asnumber asNumber��  	K �����
�� 
errn���\�  
�� 
nmbr�� �� 60 throwinvalidparametertype throwInvalidParameterType��  *�k+  W X  *�����+ � �~�}�|	L	M�{�~ "0 asrealparameter asRealParameter�} �z	N�z 	N  �y�x�y 0 thevalue theValue�x 0 parametername parameterName�|  	L �w�v�w 0 thevalue theValue�v 0 parametername parameterName	M �u�t�s	O6�r�q�u 0 asnumber asNumber
�t 
doub�s  	O �p�o�n
�p 
errn�o�\�n  �r �q 60 throwinvalidparametertype throwInvalidParameterType�{  *�k+  �&W X  *�����+ � �mE�l�k	P	Q�j�m "0 astextparameter asTextParameter�l �i	R�i 	R  �h�g�h 0 thevalue theValue�g 0 parametername parameterName�k  	P �f�e�f 0 thevalue theValue�e 0 parametername parameterName	Q �d�c	S�b^�a�`�d 0 astext asText�c  	S �_�^�]
�_ 
errn�^�\�]  
�b 
ctxt�a �` 60 throwinvalidparametertype throwInvalidParameterType�j  *�k+  W X  *�����+ � �\h�[�Z	T	U�Y�\ "0 asdateparameter asDateParameter�[ �X	V�X 	V  �W�V�W 0 thevalue theValue�V 0 parametername parameterName�Z  	T �U�T�U 0 thevalue theValue�T 0 parametername parameterName	U �S�R	W��Q�P
�S 
ldt �R  	W �O�N�M
�O 
errn�N�\�M  �Q �P 60 throwinvalidparametertype throwInvalidParameterType�Y  	��&W X  *�����+ � �L��K�J	X	Y�I�L "0 aslistparameter asListParameter�K �H	Z�H 	Z  �G�F�G 0 thevalue theValue�F 0 parametername parameterName�J  	X �E�D�E 0 thevalue theValue�D 0 parametername parameterName	Y �C�C 0 aslist asList�I *�k+  � �B��A�@	[	\�?�B &0 asrecordparameter asRecordParameter�A �>	]�> 	]  �=�<�= 0 thevalue theValue�< 0 parametername parameterName�@  	[ �;�:�; 0 thevalue theValue�: 0 parametername parameterName	\ �9�8	^��7�6
�9 
reco�8  	^ �5�4�3
�5 
errn�4�\�3  �7 �6 60 throwinvalidparametertype throwInvalidParameterType�?  	��&W X  *�����+ � �2�  	_�2 0 requiredvalue RequiredValue	_  	`	`  � �1��0�/	a	b�.�1 60 asoptionalrecordparameter asOptionalRecordParameter�0 �-	c�- 	c  �,�+�*�, 0 thevalue theValue�+ 0 defaultrecord defaultRecord�* 0 parametername parameterName�/  	a �)�(�'�&�%�) 0 thevalue theValue�( 0 defaultrecord defaultRecord�' 0 parametername parameterName�& 0 	therecord 	theRecord�% 0 
fullrecord 
fullRecord	b �$�#	d��"�!� ���!CG
�$ 
reco�#  	d ���
� 
errn��\�  �" �! 60 throwinvalidparametertype throwInvalidParameterType
�  
pcls
� 
leng� .0 throwinvalidparameter throwInvalidParameter
� 
list�. � 
��&E�W X  *�����+ O���l%E�O��%E�O��,��, *�����+ 	Y hO��&b  kv *�����+ 	Y hO��,lv��,kv *�����,%�%�+ 	Y hO�� �S��	e	f�� &0 asscriptparameter asScriptParameter� �	g� 	g  ��� 0 thevalue theValue� 0 parametername parameterName�  	e ��� 0 thevalue theValue� 0 parametername parameterName	f ��	hl��
� 
scpt�  	h ���

� 
errn��\�
  � � 60 throwinvalidparametertype throwInvalidParameterType�  	��&W X  *�����+ � �	v��	i	j��	 "0 astypeparameter asTypeParameter� �	k� 	k  ��� 0 thevalue theValue� 0 parametername parameterName�  	i ��� 0 thevalue theValue� 0 parametername parameterName	j � ��	l�����
�  
type��  	l ������
�� 
errn���\��  �� �� 60 throwinvalidparametertype throwInvalidParameterType�  	��&W X  *�����+ 	  �������	m	n���� ,0 asposixpathparameter asPOSIXPathParameter�� ��	o�� 	o  ������ 0 thevalue theValue�� 0 parametername parameterName��  	m ������ 0 thevalue theValue�� 0 parametername parameterName	n 
������������	p�����
�� 
kocl
�� 
ctxt
�� .corecnte****       ****
�� 
furl
�� 
psxp��  	p ������
�� 
errn���\��  �� �� 60 throwinvalidparametertype throwInvalidParameterType�� /�kv��l k  �Y  ��&�,EW X  *�����+ 		 �������	q	r���� 0 
asnsstring 
asNSString�� ��	s�� 	s  ���� 0 thetext theText��  	q ���� 0 thetext theText	r ������
�� misccura�� 0 nsstring NSString�� &0 stringwithstring_ stringWithString_�� 
��,�k+ 	 �������	t	u���� &0 asnsmutablestring asNSMutableString�� ��	v�� 	v  ���� 0 thetext theText��  	t ���� 0 thetext theText	u ������
�� misccura�� "0 nsmutablestring NSMutableString�� &0 stringwithstring_ stringWithString_�� 
��,�k+ 	 ������	w	x���� ,0 asnormalizednsstring asNormalizedNSString�� ��	y�� 	y  ���� 0 thetext theText��  	w ���� 0 thetext theText	x ��������
�� misccura�� 0 nsstring NSString�� &0 stringwithstring_ stringWithString_�� L0 $decomposedstringwithcanonicalmapping $decomposedStringWithCanonicalMapping�� ��,�k+ j+ 	 ��2����	z	{���� @0 asnsregularexpressionparameter asNSRegularExpressionParameter�� ��	|�� 	|  �������� 0 thetext theText�� 0 flagoptions flagOptions�� 0 parametername parameterName��  	z ���������� 0 thetext theText�� 0 flagoptions flagOptions�� 0 parametername parameterName�� 0 asocpattern asocPattern	{ ��������������	}_����o��
�� misccura�� *0 nsregularexpression NSRegularExpression
�� 
ctxt�� ,0 asnormalizednsstring asNormalizedNSString
�� 
msng�� Z0 +regularexpressionwithpattern_options_error_ +regularExpressionWithPattern_options_error_��  	} ������
�� 
errn���\��  �� �� 60 throwinvalidparametertype throwInvalidParameterType�� .0 throwinvalidparameter throwInvalidParameter�� ? ��,*��&k+ ��m+ E�W X  *�����+ 
O��  *�����+ Y hO�	 ��z����	~	���� *0 asnslocaleparameter asNSLocaleParameter�� ��	��� 	�  ������ 0 
localecode 
localeCode�� 0 parametername parameterName��  	~ ������ 0 
localecode 
localeCode�� 0 parametername parameterName	 ����������������	������������������
�� misccura�� 0 nslocale NSLocale�� 0 systemlocale systemLocale�� 0 currentlocale currentLocale
�� 
ctxt��  	� ������
�� 
errn���\��  �� 60 throwinvalidparametertype throwInvalidParameterType�� 80 availablelocaleidentifiers availableLocaleIdentifiers
�� 
list
�� 
enum�� �� .0 throwinvalidparameter throwInvalidParameter�� :0 localewithlocaleidentifier_ localeWithLocaleIdentifier_�� u�� q��  ��,j+ Y _��  ��,j+ Y N 
��&E�W X 	 
*���m+ O��,j+ �&� *����lva �%a %a + Y hO��,�k+ V	 �������	�	����� $0 asnsurlparameter asNSURLParameter�� ��	��� 	�  ������ 0 urltext urlText�� 0 parametername parameterName��  	� �������� 0 urltext urlText�� 0 parametername parameterName�� 0 asocurl asocURL	� 	����������������
�� misccura�� 0 nsurl NSURL�� "0 astextparameter asTextParameter��  0 urlwithstring_ URLWithString_
�� 
msng
�� 
ctxt�� �� .0 throwinvalidparameter throwInvalidParameter�� (��,*��l+ k+ E�O��  *�����+ Y hO�	 ��7����	�	���� &0 nativetypeofvalue nativeTypeOfValue�� �~	��~ 	�  �}�} 0 thevalue theValue��  	� �|�| 0 thevalue theValue	� �{�z�y�x�w�v�u
�{ 
kocl
�z 
obj 
�y .corecnte****       ****
�x 
capp
�w 
reco
�v 
scpt
�u 
pcls� R�kv��l j �Y @�kv��l j �Y -�kv��l j �Y �kv��l j �Y ��,E	 �t��s�r	�	��q�t 0 isvalueoftype isValueOfType�s �p	��p 	�  �o�n�o 0 thevalue theValue�n 0 typeclasses typeClasses�r  	� �m�l�k�j�i�h�g�f�m 0 thevalue theValue�l 0 typeclasses typeClasses�k 0 aref aRef�j 0 	typeclass 	typeClass�i 0 etext eText�h 0 enumber eNumber�g 0 efrom eFrom�f 
0 eto eTo	� �e�d�c�b�a�`�_	����^�]�\�[�Z�Y�X�W�V�U	�[�T�S
�e 
kocl
�d 
list
�c .corecnte****       ****
�b 
cobj
�a 
pcnt
�` 
pcls�_  	� �R�Q�P
�R 
errn�Q�\�P  �^ �] 60 throwinvalidparametertype throwInvalidParameterType
�\ 
type
�[ 
bool
�Z 
obj 
�Y 
enum
�X 
ocid�W 0 
isnsobject 
isNSObject
�V 
capp�U 0 etext eText	� �O�N	�
�O 
errn�N 0 enumber eNumber	� �M�L	�
�M 
erob�L 0 efrom eFrom	� �K�J�I
�K 
errt�J 
0 eto eTo�I  �T �S 
0 _error  �q�kv��l j  
�kvE�Y hO �[��l kh  ��,�&E�W X  )j*�����+ O�� 
 �� �& / #�kv��l j 	 	��&� �& eY hW X  hY t��  / #�kv��l j 	 	��&� �& eY hW X  hY A�a   *�k+ Y /�kv�a l j �a  Y �kv�l j eY h[OY�.OfW X  *a ����a + 		 �Hl�G�F	�	��E�H 0 
isnsobject 
isNSObject�G �D	��D 	�  �C�C 0 thevalue theValue�F  	� �B�B 0 thevalue theValue	� 	�A�@�?�>�=�<�;�:�9
�A 
kocl
�@ 
obj 
�? .corecnte****       ****
�> misccura�= 0 nsobject NSObject�< 	0 class  �;  0 iskindofclass_ isKindOfClass_�:  �9  �E 0�kv��l j  fY hO ���,j+ k+ W 	X  f	
 �8��7�6	�	��5�8 0 
asnsobject 
asNSObject�7 �4	��4 	�  �3�3 0 thevalue theValue�6  	� �2�2 0 thevalue theValue	� �1�0�/�.
�1 misccura�0 0 nsarray NSArray�/ $0 arraywithobject_ arrayWithObject_�.  0 objectatindex_ objectAtIndex_�5 ��,�k+ jk+ 	 �-��,�+	�	��*�- 0 
asasobject 
asASObject�, �)	��) 	�  �(�( 0 thevalue theValue�+  	� �'�' 0 thevalue theValue	� �&�%�& 0 
isnsobject 
isNSObject
�% 
****�* *�k+   	��&Y �ascr  ��ޭ