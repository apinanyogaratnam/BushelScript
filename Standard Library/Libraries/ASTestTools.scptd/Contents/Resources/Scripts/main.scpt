FasdUAS 1.101.10   ��   ��    k             l      ��  ��   �� TestTools -- unit testing framework

About:

- TestTools's unit testing framework takes a NAME.unittest.scpt file containing one or more script objects, each representing a test suite, and each of those script objects containing one or more handlers representing individual unit tests. Test suite scripts must have `suite_` name prefixes; test handlers within those scripts must have `test_` name prefixes.

- The command line `osatest` test runner introspects the unittest script to obtain all suite and test names. For each found test it creates a new AppleScript component instance (interpreter), loads a clean copy of the unittest script into it, then calls [indirectly] TestTools's `__performunittestforsuite__` handler to run that test. The resulting `TestReport` object is then returned to `osatest` to finish generating the report for that test and print it.

Notes:

- Saving unittest scripts as compiled `.scpt` rather than `.applescript` files is recommended as it avoids any risk of test scripts not compiling correctly when run by `osatest` (i.e. one less thing to go wrong).

- The `.unittest.scpt[d]` suffix is a convention, not a requirement, but is strongly encouraged. e.g. Future improvements to `osatest` may include the ability to search a library script bundle for any embedded unittest files and run them all automatically.

- `assert` command names are intentionally verbose, to minimize risk of collisions with keywords in other libraries, apps, etc.


TO DO:

- There is a serious reliability problem where unit tests sometimes abort mid-run with error 1011 (dsMixedModeFailure?) or other bizarre and nonsensical errors. This is suspected to be caused by a deep-rooted bug in AS, likely related to bytecode compilation/augmentation, that manifests when particular, arbitrary edits are made to a unittest script. For now, the workaround is to make further edits to the unittest script until the problem disappears again, e.g. adding additional asserts or even just a comment to the affected suite_NAME script object is sufficient. Longer term, TestTools and osatest will either need to be reworked in order to avoid tickling this bug, or else - and preferably - the bug itself located and squashed within the AS component. See TO DO comments in `osatest` Xcode project for further discussion.


- implement `add note` command for including messages in test report (this might be best done by appending additional messages to notes for failed tests using `add note`/`remove note` commands, e.g. Date.unittest.scpt's configure_doTest handler needs some way to record the time zone currently being tested)

- assert command notes don't currently appear in report except when an assert command reports a fail; should osatest provide a `--verbose` option that displays all test report information?

- should `assert test result` support optional `in` and `with parameter` as an alternative to using `for` should user wish to isolate the operation being tested in a `call_NAME` handler? (A. probably not: it makes the API more complex and confusing; user can always wrap the `assert test result` command in a `try` block that catches errors and reports them via `assert test failed`)

- options for automatically randomzing TIDs and considering/ignoring options before calling `test_NAME` handler; also time zone (see NSTimeZone's setDefaultTimeZone:); also, what about an option for composing/decomposing unicode (while AS ignores differences, NSString-based code may be sensitive to this); note that localization is harder to alter, but should be done if possible as it affects date and number coercions; 


- what other check objects should be defined as standard? e.g.:

	- `text equality check [considering/ignoring OPTIONS]` (note that whitespace should be normalized rather than ignored completely); e.g. this would simplify list-sorting tests when ordering list items case-insensitively, avoiding the need to check all combinations (which quickly becomes unworkable)
	
	- `exact type check` (checks only that the expected and actual values are of the same type; relatively weak, but still potentially of some use when checking, say, e.g. that actual errorNumber is `integer` and actual errorMessage is `text`)
	
	- `ASObjC equality check`(checks both values are ocid specifiers then compares them using `-isEqual:`),
	
	- `text pattern check` (allow wildcard/regexp checking, possibly applying additional check objects to wildcard-matched ranges; this could be useful e.g. when checking error messages where some parts of the message may vary - e.g. disk and home folder names in file paths - so should be either ignored or custom-checked but the rest of the message is constant); also, how might multiple checks be usefully composed? (e.g. currently the `exact error check` constructor optionally accepts an record of one or more equality checkers for customizing how specific error attributes are checked)
	
	- 'set equality' check that takes two lists and checks both contain same items, though not necessarily in same order

	- how to provide partial/pattern matching based checks of error messages? (e.g. might want to normalize case and whitespace before comparison; it'd also be handy if a reusable handler could be written that checks library and handler name are correct)


- should `assert test error` automatically check error record's properties are valid types (e.g. error number should be integer, message should be text, etc.), and fail test if not?

- how to indicate mismatched error attribute in ExactErrorCheck? (currently the `compareObjects` handler signature only allows for returning true/false, and cannot [and should not] write messages to TestReport object itself; should it also be allowed to return a {isEqual:BOOL,messageText:TEXT} record, or is there any better alternative?)

      � 	 	-�   T e s t T o o l s   - -   u n i t   t e s t i n g   f r a m e w o r k 
 
 A b o u t : 
 
 -   T e s t T o o l s ' s   u n i t   t e s t i n g   f r a m e w o r k   t a k e s   a   N A M E . u n i t t e s t . s c p t   f i l e   c o n t a i n i n g   o n e   o r   m o r e   s c r i p t   o b j e c t s ,   e a c h   r e p r e s e n t i n g   a   t e s t   s u i t e ,   a n d   e a c h   o f   t h o s e   s c r i p t   o b j e c t s   c o n t a i n i n g   o n e   o r   m o r e   h a n d l e r s   r e p r e s e n t i n g   i n d i v i d u a l   u n i t   t e s t s .   T e s t   s u i t e   s c r i p t s   m u s t   h a v e   ` s u i t e _ `   n a m e   p r e f i x e s ;   t e s t   h a n d l e r s   w i t h i n   t h o s e   s c r i p t s   m u s t   h a v e   ` t e s t _ `   n a m e   p r e f i x e s . 
 
 -   T h e   c o m m a n d   l i n e   ` o s a t e s t `   t e s t   r u n n e r   i n t r o s p e c t s   t h e   u n i t t e s t   s c r i p t   t o   o b t a i n   a l l   s u i t e   a n d   t e s t   n a m e s .   F o r   e a c h   f o u n d   t e s t   i t   c r e a t e s   a   n e w   A p p l e S c r i p t   c o m p o n e n t   i n s t a n c e   ( i n t e r p r e t e r ) ,   l o a d s   a   c l e a n   c o p y   o f   t h e   u n i t t e s t   s c r i p t   i n t o   i t ,   t h e n   c a l l s   [ i n d i r e c t l y ]   T e s t T o o l s ' s   ` _ _ p e r f o r m u n i t t e s t f o r s u i t e _ _ `   h a n d l e r   t o   r u n   t h a t   t e s t .   T h e   r e s u l t i n g   ` T e s t R e p o r t `   o b j e c t   i s   t h e n   r e t u r n e d   t o   ` o s a t e s t `   t o   f i n i s h   g e n e r a t i n g   t h e   r e p o r t   f o r   t h a t   t e s t   a n d   p r i n t   i t . 
 
 N o t e s : 
 
 -   S a v i n g   u n i t t e s t   s c r i p t s   a s   c o m p i l e d   ` . s c p t `   r a t h e r   t h a n   ` . a p p l e s c r i p t `   f i l e s   i s   r e c o m m e n d e d   a s   i t   a v o i d s   a n y   r i s k   o f   t e s t   s c r i p t s   n o t   c o m p i l i n g   c o r r e c t l y   w h e n   r u n   b y   ` o s a t e s t `   ( i . e .   o n e   l e s s   t h i n g   t o   g o   w r o n g ) . 
 
 -   T h e   ` . u n i t t e s t . s c p t [ d ] `   s u f f i x   i s   a   c o n v e n t i o n ,   n o t   a   r e q u i r e m e n t ,   b u t   i s   s t r o n g l y   e n c o u r a g e d .   e . g .   F u t u r e   i m p r o v e m e n t s   t o   ` o s a t e s t `   m a y   i n c l u d e   t h e   a b i l i t y   t o   s e a r c h   a   l i b r a r y   s c r i p t   b u n d l e   f o r   a n y   e m b e d d e d   u n i t t e s t   f i l e s   a n d   r u n   t h e m   a l l   a u t o m a t i c a l l y . 
 
 -   ` a s s e r t `   c o m m a n d   n a m e s   a r e   i n t e n t i o n a l l y   v e r b o s e ,   t o   m i n i m i z e   r i s k   o f   c o l l i s i o n s   w i t h   k e y w o r d s   i n   o t h e r   l i b r a r i e s ,   a p p s ,   e t c . 
 
 
 T O   D O : 
 
 -   T h e r e   i s   a   s e r i o u s   r e l i a b i l i t y   p r o b l e m   w h e r e   u n i t   t e s t s   s o m e t i m e s   a b o r t   m i d - r u n   w i t h   e r r o r   1 0 1 1   ( d s M i x e d M o d e F a i l u r e ? )   o r   o t h e r   b i z a r r e   a n d   n o n s e n s i c a l   e r r o r s .   T h i s   i s   s u s p e c t e d   t o   b e   c a u s e d   b y   a   d e e p - r o o t e d   b u g   i n   A S ,   l i k e l y   r e l a t e d   t o   b y t e c o d e   c o m p i l a t i o n / a u g m e n t a t i o n ,   t h a t   m a n i f e s t s   w h e n   p a r t i c u l a r ,   a r b i t r a r y   e d i t s   a r e   m a d e   t o   a   u n i t t e s t   s c r i p t .   F o r   n o w ,   t h e   w o r k a r o u n d   i s   t o   m a k e   f u r t h e r   e d i t s   t o   t h e   u n i t t e s t   s c r i p t   u n t i l   t h e   p r o b l e m   d i s a p p e a r s   a g a i n ,   e . g .   a d d i n g   a d d i t i o n a l   a s s e r t s   o r   e v e n   j u s t   a   c o m m e n t   t o   t h e   a f f e c t e d   s u i t e _ N A M E   s c r i p t   o b j e c t   i s   s u f f i c i e n t .   L o n g e r   t e r m ,   T e s t T o o l s   a n d   o s a t e s t   w i l l   e i t h e r   n e e d   t o   b e   r e w o r k e d   i n   o r d e r   t o   a v o i d   t i c k l i n g   t h i s   b u g ,   o r   e l s e   -   a n d   p r e f e r a b l y   -   t h e   b u g   i t s e l f   l o c a t e d   a n d   s q u a s h e d   w i t h i n   t h e   A S   c o m p o n e n t .   S e e   T O   D O   c o m m e n t s   i n   ` o s a t e s t `   X c o d e   p r o j e c t   f o r   f u r t h e r   d i s c u s s i o n . 
 
 
 -   i m p l e m e n t   ` a d d   n o t e `   c o m m a n d   f o r   i n c l u d i n g   m e s s a g e s   i n   t e s t   r e p o r t   ( t h i s   m i g h t   b e   b e s t   d o n e   b y   a p p e n d i n g   a d d i t i o n a l   m e s s a g e s   t o   n o t e s   f o r   f a i l e d   t e s t s   u s i n g   ` a d d   n o t e ` / ` r e m o v e   n o t e `   c o m m a n d s ,   e . g .   D a t e . u n i t t e s t . s c p t ' s   c o n f i g u r e _ d o T e s t   h a n d l e r   n e e d s   s o m e   w a y   t o   r e c o r d   t h e   t i m e   z o n e   c u r r e n t l y   b e i n g   t e s t e d ) 
 
 -   a s s e r t   c o m m a n d   n o t e s   d o n ' t   c u r r e n t l y   a p p e a r   i n   r e p o r t   e x c e p t   w h e n   a n   a s s e r t   c o m m a n d   r e p o r t s   a   f a i l ;   s h o u l d   o s a t e s t   p r o v i d e   a   ` - - v e r b o s e `   o p t i o n   t h a t   d i s p l a y s   a l l   t e s t   r e p o r t   i n f o r m a t i o n ? 
 
 -   s h o u l d   ` a s s e r t   t e s t   r e s u l t `   s u p p o r t   o p t i o n a l   ` i n `   a n d   ` w i t h   p a r a m e t e r `   a s   a n   a l t e r n a t i v e   t o   u s i n g   ` f o r `   s h o u l d   u s e r   w i s h   t o   i s o l a t e   t h e   o p e r a t i o n   b e i n g   t e s t e d   i n   a   ` c a l l _ N A M E `   h a n d l e r ?   ( A .   p r o b a b l y   n o t :   i t   m a k e s   t h e   A P I   m o r e   c o m p l e x   a n d   c o n f u s i n g ;   u s e r   c a n   a l w a y s   w r a p   t h e   ` a s s e r t   t e s t   r e s u l t `   c o m m a n d   i n   a   ` t r y `   b l o c k   t h a t   c a t c h e s   e r r o r s   a n d   r e p o r t s   t h e m   v i a   ` a s s e r t   t e s t   f a i l e d ` ) 
 
 -   o p t i o n s   f o r   a u t o m a t i c a l l y   r a n d o m z i n g   T I D s   a n d   c o n s i d e r i n g / i g n o r i n g   o p t i o n s   b e f o r e   c a l l i n g   ` t e s t _ N A M E `   h a n d l e r ;   a l s o   t i m e   z o n e   ( s e e   N S T i m e Z o n e ' s   s e t D e f a u l t T i m e Z o n e : ) ;   a l s o ,   w h a t   a b o u t   a n   o p t i o n   f o r   c o m p o s i n g / d e c o m p o s i n g   u n i c o d e   ( w h i l e   A S   i g n o r e s   d i f f e r e n c e s ,   N S S t r i n g - b a s e d   c o d e   m a y   b e   s e n s i t i v e   t o   t h i s ) ;   n o t e   t h a t   l o c a l i z a t i o n   i s   h a r d e r   t o   a l t e r ,   b u t   s h o u l d   b e   d o n e   i f   p o s s i b l e   a s   i t   a f f e c t s   d a t e   a n d   n u m b e r   c o e r c i o n s ;   
 
 
 -   w h a t   o t h e r   c h e c k   o b j e c t s   s h o u l d   b e   d e f i n e d   a s   s t a n d a r d ?   e . g . : 
 
 	 -   ` t e x t   e q u a l i t y   c h e c k   [ c o n s i d e r i n g / i g n o r i n g   O P T I O N S ] `   ( n o t e   t h a t   w h i t e s p a c e   s h o u l d   b e   n o r m a l i z e d   r a t h e r   t h a n   i g n o r e d   c o m p l e t e l y ) ;   e . g .   t h i s   w o u l d   s i m p l i f y   l i s t - s o r t i n g   t e s t s   w h e n   o r d e r i n g   l i s t   i t e m s   c a s e - i n s e n s i t i v e l y ,   a v o i d i n g   t h e   n e e d   t o   c h e c k   a l l   c o m b i n a t i o n s   ( w h i c h   q u i c k l y   b e c o m e s   u n w o r k a b l e ) 
 	 
 	 -   ` e x a c t   t y p e   c h e c k `   ( c h e c k s   o n l y   t h a t   t h e   e x p e c t e d   a n d   a c t u a l   v a l u e s   a r e   o f   t h e   s a m e   t y p e ;   r e l a t i v e l y   w e a k ,   b u t   s t i l l   p o t e n t i a l l y   o f   s o m e   u s e   w h e n   c h e c k i n g ,   s a y ,   e . g .   t h a t   a c t u a l   e r r o r N u m b e r   i s   ` i n t e g e r `   a n d   a c t u a l   e r r o r M e s s a g e   i s   ` t e x t ` ) 
 	 
 	 -   ` A S O b j C   e q u a l i t y   c h e c k ` ( c h e c k s   b o t h   v a l u e s   a r e   o c i d   s p e c i f i e r s   t h e n   c o m p a r e s   t h e m   u s i n g   ` - i s E q u a l : ` ) , 
 	 
 	 -   ` t e x t   p a t t e r n   c h e c k `   ( a l l o w   w i l d c a r d / r e g e x p   c h e c k i n g ,   p o s s i b l y   a p p l y i n g   a d d i t i o n a l   c h e c k   o b j e c t s   t o   w i l d c a r d - m a t c h e d   r a n g e s ;   t h i s   c o u l d   b e   u s e f u l   e . g .   w h e n   c h e c k i n g   e r r o r   m e s s a g e s   w h e r e   s o m e   p a r t s   o f   t h e   m e s s a g e   m a y   v a r y   -   e . g .   d i s k   a n d   h o m e   f o l d e r   n a m e s   i n   f i l e   p a t h s   -   s o   s h o u l d   b e   e i t h e r   i g n o r e d   o r   c u s t o m - c h e c k e d   b u t   t h e   r e s t   o f   t h e   m e s s a g e   i s   c o n s t a n t ) ;   a l s o ,   h o w   m i g h t   m u l t i p l e   c h e c k s   b e   u s e f u l l y   c o m p o s e d ?   ( e . g .   c u r r e n t l y   t h e   ` e x a c t   e r r o r   c h e c k `   c o n s t r u c t o r   o p t i o n a l l y   a c c e p t s   a n   r e c o r d   o f   o n e   o r   m o r e   e q u a l i t y   c h e c k e r s   f o r   c u s t o m i z i n g   h o w   s p e c i f i c   e r r o r   a t t r i b u t e s   a r e   c h e c k e d ) 
 	 
 	 -   ' s e t   e q u a l i t y '   c h e c k   t h a t   t a k e s   t w o   l i s t s   a n d   c h e c k s   b o t h   c o n t a i n   s a m e   i t e m s ,   t h o u g h   n o t   n e c e s s a r i l y   i n   s a m e   o r d e r 
 
 	 -   h o w   t o   p r o v i d e   p a r t i a l / p a t t e r n   m a t c h i n g   b a s e d   c h e c k s   o f   e r r o r   m e s s a g e s ?   ( e . g .   m i g h t   w a n t   t o   n o r m a l i z e   c a s e   a n d   w h i t e s p a c e   b e f o r e   c o m p a r i s o n ;   i t ' d   a l s o   b e   h a n d y   i f   a   r e u s a b l e   h a n d l e r   c o u l d   b e   w r i t t e n   t h a t   c h e c k s   l i b r a r y   a n d   h a n d l e r   n a m e   a r e   c o r r e c t ) 
 
 
 -   s h o u l d   ` a s s e r t   t e s t   e r r o r `   a u t o m a t i c a l l y   c h e c k   e r r o r   r e c o r d ' s   p r o p e r t i e s   a r e   v a l i d   t y p e s   ( e . g .   e r r o r   n u m b e r   s h o u l d   b e   i n t e g e r ,   m e s s a g e   s h o u l d   b e   t e x t ,   e t c . ) ,   a n d   f a i l   t e s t   i f   n o t ? 
 
 -   h o w   t o   i n d i c a t e   m i s m a t c h e d   e r r o r   a t t r i b u t e   i n   E x a c t E r r o r C h e c k ?   ( c u r r e n t l y   t h e   ` c o m p a r e O b j e c t s `   h a n d l e r   s i g n a t u r e   o n l y   a l l o w s   f o r   r e t u r n i n g   t r u e / f a l s e ,   a n d   c a n n o t   [ a n d   s h o u l d   n o t ]   w r i t e   m e s s a g e s   t o   T e s t R e p o r t   o b j e c t   i t s e l f ;   s h o u l d   i t   a l s o   b e   a l l o w e d   t o   r e t u r n   a   { i s E q u a l : B O O L , m e s s a g e T e x t : T E X T }   r e c o r d ,   o r   i s   t h e r e   a n y   b e t t e r   a l t e r n a t i v e ? ) 
 
     
  
 l     ��������  ��  ��        x     �� ����    4    �� 
�� 
frmk  m       �    F o u n d a t i o n��        l     ��������  ��  ��        x    �� ����    2   ��
�� 
osax��        l     ��������  ��  ��        l     ��  ��    J D--------------------------------------------------------------------     �   � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -      l     ��   !��       support    ! � " "    s u p p o r t   # $ # l     ��������  ��  ��   $  % & % l      ' ( ) ' j    �� *�� 0 _support   * N     + + 4    �� ,
�� 
scpt , m     - - � . .  T y p e S u p p o r t ( "  used for parameter checking    ) � / / 8   u s e d   f o r   p a r a m e t e r   c h e c k i n g &  0 1 0 l     ��������  ��  ��   1  2 3 2 i   ! 4 5 4 I      �� 6���� 
0 _error   6  7 8 7 o      ���� 0 handlername handlerName 8  9 : 9 o      ���� 0 etext eText :  ; < ; o      ���� 0 enumber eNumber <  = > = o      ���� 0 efrom eFrom >  ?�� ? o      ���� 
0 eto eTo��  ��   5 n     @ A @ I    �� B���� &0 throwcommanderror throwCommandError B  C D C m     E E � F F  T e s t T o o l s D  G H G o    ���� 0 handlername handlerName H  I J I o    ���� 0 etext eText J  K L K o    	���� 0 enumber eNumber L  M N M o   	 
���� 0 efrom eFrom N  O�� O o   
 ���� 
0 eto eTo��  ��   A o     ���� 0 _support   3  P Q P l     ��������  ��  ��   Q  R S R l     ��������  ��  ��   S  T U T l      V W X V j   " (�� Y�� 0 _testsupport _TestSupport Y N   " ' Z Z 4   " &�� [
�� 
scpt [ m   $ % \ \ � ] ]  T e s t S u p p o r t W . ( sub-library embedded in TestTools.scptd    X � ^ ^ P   s u b - l i b r a r y   e m b e d d e d   i n   T e s t T o o l s . s c p t d U  _ ` _ l     ��������  ��  ��   `  a b a l     ��������  ��  ��   b  c d c l     �� e f��   e J D--------------------------------------------------------------------    f � g g � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - d  h i h l     �� j k��   j K E Unit Testing Framework; invoked by `osatest` via the unittest script    k � l l �   U n i t   T e s t i n g   F r a m e w o r k ;   i n v o k e d   b y   ` o s a t e s t `   v i a   t h e   u n i t t e s t   s c r i p t i  m n m l     ��������  ��  ��   n  o p o l      q r s q j   ) +�� t�� 00 _abortedassertionerror _AbortedAssertionError t m   ) *����A r P J raised by `assert�` handlers upon failed assertion to terminate that test    s � u u �   r a i s e d   b y   ` a s s e r t & `   h a n d l e r s   u p o n   f a i l e d   a s s e r t i o n   t o   t e r m i n a t e   t h a t   t e s t p  v w v l     ��������  ��  ��   w  x y x h   , 3�� z�� 00 _abortedassertiontoken _AbortedAssertionToken z l     �� { |��   {.( when raising error number AbortedAssertionError, the `from` parameter should carry this unique identifier to confirm error was raised by TestTools, and isn't merely an error in the test code/code being tested that happens to use the same error number (in which case it should be treated as such)    | � } }P   w h e n   r a i s i n g   e r r o r   n u m b e r   A b o r t e d A s s e r t i o n E r r o r ,   t h e   ` f r o m `   p a r a m e t e r   s h o u l d   c a r r y   t h i s   u n i q u e   i d e n t i f i e r   t o   c o n f i r m   e r r o r   w a s   r a i s e d   b y   T e s t T o o l s ,   a n d   i s n ' t   m e r e l y   a n   e r r o r   i n   t h e   t e s t   c o d e / c o d e   b e i n g   t e s t e d   t h a t   h a p p e n s   t o   u s e   t h e   s a m e   e r r o r   n u m b e r   ( i n   w h i c h   c a s e   i t   s h o u l d   b e   t r e a t e d   a s   s u c h ) y  ~  ~ l     ��������  ��  ��     � � � l     ��������  ��  ��   �  � � � l     �� � ���   � L F the following are set/unset by __performunittestforsuite__ as it runs    � � � � �   t h e   f o l l o w i n g   a r e   s e t / u n s e t   b y   _ _ p e r f o r m u n i t t e s t f o r s u i t e _ _   a s   i t   r u n s �  � � � l     ��������  ��  ��   �  � � � l      � � � � j   4 6�� ��� 0 _suiteobject _suiteObject � m   4 5��
�� 
msng � � � the test suite object that was passed to `perform unit test`; assigned and cleared at start and end of `perform unit test`; may be used by assert handlers (e.g. `assert test error` uses it when calling a `call_NAME` handler)    � � � ��   t h e   t e s t   s u i t e   o b j e c t   t h a t   w a s   p a s s e d   t o   ` p e r f o r m   u n i t   t e s t ` ;   a s s i g n e d   a n d   c l e a r e d   a t   s t a r t   a n d   e n d   o f   ` p e r f o r m   u n i t   t e s t ` ;   m a y   b e   u s e d   b y   a s s e r t   h a n d l e r s   ( e . g .   ` a s s e r t   t e s t   e r r o r `   u s e s   i t   w h e n   c a l l i n g   a   ` c a l l _ N A M E `   h a n d l e r ) �  � � � l     ��������  ��  ��   �  � � � l      � � � � j   7 9�� ��� 0 _testreport _testReport � m   7 8��
�� 
msng � x r a single test_NAME handler may perform multiple asserts, the result of each is recorded in TestReport object here    � � � � �   a   s i n g l e   t e s t _ N A M E   h a n d l e r   m a y   p e r f o r m   m u l t i p l e   a s s e r t s ,   t h e   r e s u l t   o f   e a c h   i s   r e c o r d e d   i n   T e s t R e p o r t   o b j e c t   h e r e �  � � � l     ��������  ��  ��   �  � � � l      � � � � j   : <�� ��� $0 _testhandlername _testHandlerName � m   : ;��
�� 
msng � R L used to generate default `call_NAME` handler name for a `test_NAME` handler    � � � � �   u s e d   t o   g e n e r a t e   d e f a u l t   ` c a l l _ N A M E `   h a n d l e r   n a m e   f o r   a   ` t e s t _ N A M E `   h a n d l e r �  � � � l     ��������  ��  ��   �  � � � l     ��������  ��  ��   �  � � � l     �� � ���   �  -------    � � � �  - - - - - - - �  � � � l     �� � ���   � ) # execute a single test_NAME handler    � � � � F   e x e c u t e   a   s i n g l e   t e s t _ N A M E   h a n d l e r �  � � � l     �� � ���   � ] W (called by `osatest` via a code-generated glue handler it adds to the unittest script)    � � � � �   ( c a l l e d   b y   ` o s a t e s t `   v i a   a   c o d e - g e n e r a t e d   g l u e   h a n d l e r   i t   a d d s   t o   t h e   u n i t t e s t   s c r i p t ) �  � � � l     ��������  ��  ��   �  � � � i  = @ � � � I      �� ����� 0 __performunittestforsuite__   �  � � � o      ���� 0 suiteobject suiteObject �  ��� � J       � �  � � � o      ���� 0 	suitename 	suiteName �  � � � o      ���� 0 handlername handlerName �  ��� � o      ���� 0 isstyled isStyled��  ��  ��   � k    � � �  � � � l      �� � ���   �e_
		suiteObject : script -- test suite object
		suiteName : text -- test suite name, for reporting use
		handlerName : text -- name of the test suite handler to call
		allHandlerNames : list of text -- all handler names in this test suite; used to determine which if any fixture methods (configure_setUp, configure_tearDown, etc.) need to be called
		isStyled : boolean -- if true, the returned report will include special formatting codes (bold, underline) to improve presentation in Terminal.app and other VT100 emulators; use false if you intend to use this text elsewhere
		Result: script -- TestReport
	    � � � �� 
 	 	 s u i t e O b j e c t   :   s c r i p t   - -   t e s t   s u i t e   o b j e c t 
 	 	 s u i t e N a m e   :   t e x t   - -   t e s t   s u i t e   n a m e ,   f o r   r e p o r t i n g   u s e 
 	 	 h a n d l e r N a m e   :   t e x t   - -   n a m e   o f   t h e   t e s t   s u i t e   h a n d l e r   t o   c a l l 
 	 	 a l l H a n d l e r N a m e s   :   l i s t   o f   t e x t   - -   a l l   h a n d l e r   n a m e s   i n   t h i s   t e s t   s u i t e ;   u s e d   t o   d e t e r m i n e   w h i c h   i f   a n y   f i x t u r e   m e t h o d s   ( c o n f i g u r e _ s e t U p ,   c o n f i g u r e _ t e a r D o w n ,   e t c . )   n e e d   t o   b e   c a l l e d 
 	 	 i s S t y l e d   :   b o o l e a n   - -   i f   t r u e ,   t h e   r e t u r n e d   r e p o r t   w i l l   i n c l u d e   s p e c i a l   f o r m a t t i n g   c o d e s   ( b o l d ,   u n d e r l i n e )   t o   i m p r o v e   p r e s e n t a t i o n   i n   T e r m i n a l . a p p   a n d   o t h e r   V T 1 0 0   e m u l a t o r s ;   u s e   f a l s e   i f   y o u   i n t e n d   t o   u s e   t h i s   t e x t   e l s e w h e r e 
 	 	 R e s u l t :   s c r i p t   - -   T e s t R e p o r t 
 	 �  � � � r      � � � n     � � � I    �� �����  0 maketestreport makeTestReport �  � � � o    ���� 0 	suitename 	suiteName �  � � � o    ���� 0 handlername handlerName �  ��� � o    ���� 0 isstyled isStyled��  ��   � o     ���� 0 _testsupport _TestSupport � o      ���� 0 _testreport _testReport �  � � � l   �� � ���   � = 7 check if this test (or entire suite) should be skipped    � � � � n   c h e c k   i f   t h i s   t e s t   ( o r   e n t i r e   s u i t e )   s h o u l d   b e   s k i p p e d �  � � � Z   C � ����� � n     � � � I     �� ����� 0 
hashandler 
hasHandler �  ��� � N     � � n     � � � o    ���� *0 configure_skiptests configure_skipTests � o    �� 0 suiteobject suiteObject��  ��   � o    �~�~ 0 _support   � Q   #? � � � � k   & � �  � � � r   & - � � � n  & + � � � I   ' +�}�|�{�} *0 configure_skiptests configure_skipTests�|  �{   � o   & '�z�z 0 suiteobject suiteObject � o      �y�y 0 skipinfo skipInfo �  � � � Q   . Q � � � � l  1 4 � � � � r   1 4 � � � o   1 2�x�x 0 skipinfo skipInfo � o      �w�w 0 skipinfo skipInfo � > 8 make sure configure_skipTests actually returned a value    � � � � p   m a k e   s u r e   c o n f i g u r e _ s k i p T e s t s   a c t u a l l y   r e t u r n e d   a   v a l u e � R      �v�u �
�v .ascrerr ****      � ****�u   � �t ��s
�t 
errn � d       � � m      �r�r
��s   � k   < Q � �    R   < J�q
�q .ascrerr ****      � **** m   H I � �  c o n f i g u r e _ s k i p T e s t s    d i d n  t   r e t u r n   a n y t h i n g   ( e . g .   t o   r u n   a l l   t e s t s   i n   s u i t e ,   r e t u r n    m i s s i n g   v a l u e  ) . �p
�p 
errn m   > ?�o�o�? �n	
�n 
erob o   @ A�m�m 0 suiteobject suiteObject	 �l
�k
�l 
errt
 J   B G  m   B C�j
�j 
reco  m   C D�i
�i 
ctxt �h m   D E�g
�g 
msng�h  �k   �f L   K Q o   K P�e�e 0 _testreport _testReport�f   � �d Z   R�c�b >  R U o   R S�a�a 0 skipinfo skipInfo m   S T�`
�` 
msng l  X Z   X�_ n  X c I   ] c�^ �]�^ 0 istype isType  !"! o   ] ^�\�\ 0 skipinfo skipInfo" #�[# m   ^ _�Z
�Z 
reco�[  �]   o   X ]�Y�Y 0 _testsupport _TestSupport l  f �$%&$ k   f �'' ()( r   f {*+* c   f y,-, l  f u.�X�W. n  f u/0/ I   p u�V1�U�V 0 objectforkey_ objectForKey_1 2�T2 o   p q�S�S 0 handlername handlerName�T  �U  0 l  f p3�R�Q3 n  f p454 I   k p�P6�O�P 60 dictionarywithdictionary_ dictionaryWithDictionary_6 7�N7 o   k l�M�M 0 skipinfo skipInfo�N  �O  5 n  f k898 o   g k�L�L 0 nsdictionary NSDictionary9 m   f g�K
�K misccura�R  �Q  �X  �W  - m   u x�J
�J 
****+ o      �I�I 0 
skipreason 
skipReason) :�H: Z   | �;<�G�F; >  | =>= o   | }�E�E 0 
skipreason 
skipReason> m   } ~�D
�D 
msng< k   � �?? @A@ Q   � �BCDB r   � �EFE c   � �GHG o   � ��C�C 0 
skipreason 
skipReasonH m   � ��B
�B 
ctxtF o      �A�A 0 
skipreason 
skipReasonC R      �@�?I
�@ .ascrerr ****      � ****�?  I �>J�=
�> 
errnJ d      KK m      �<�<��=  D R   � ��;LM
�; .ascrerr ****      � ****L b   � �NON b   � �PQP m   � �RR �SS f  c o n f i g u r e _ s k i p T e s t s    d i d n  t   r e t u r n   v a l i d   r e c o r d   ( Q o   � ��:�: 0 handlername handlerNameO m   � �TT �UU h    p r o p e r t y   d o e s n  t   c o n t a i n   t e x t   o r    m i s s i n g   v a l u e  ) .M �9VW
�9 
errnV m   � ��8�8�\W �7XY
�7 
erobX o   � ��6�6 0 skipinfo skipInfoY �5Z�4
�5 
errtZ J   � �[[ \]\ m   � ��3
�3 
ctxt] ^�2^ m   � ��1
�1 
msng�2  �4  A _`_ n  � �aba I   � ��0c�/�0 0 
addskipped 
addSkippedc ded o   � ��.�. 0 handlername handlerNamee f�-f o   � ��,�, 0 
skipreason 
skipReason�-  �/  b o   � ��+�+ 0 _testreport _testReport` g�*g L   � �hh o   � ��)�) 0 _testreport _testReport�*  �G  �F  �H  % + % check if this test should be skipped   & �ii J   c h e c k   i f   t h i s   t e s t   s h o u l d   b e   s k i p p e d jkj >  � �lml o   � ��(�( 0 skipinfo skipInfom m   � ��'
�' 
msngk n�&n l  � �opqo k   � �rr sts Q   � �uvwu r   � �xyx c   � �z{z o   � ��%�% 0 skipinfo skipInfo{ m   � ��$
�$ 
ctxty o      �#�# 0 
skipreason 
skipReasonv R      �"�!|
�" .ascrerr ****      � ****�!  | � }�
�  
errn} d      ~~ m      ����  w R   � ���
� .ascrerr ****      � **** m   � ��� ��� �  c o n f i g u r e _ s k i p T e s t s    d i d n  t   r e t u r n   r e c o r d ,   t e x t ,   o r    m i s s i n g   v a l u e  .� ���
� 
errn� m   � ����\� ���
� 
erob� o   � ��� 0 skipinfo skipInfo� ���
� 
errt� J   � ��� ��� m   � ��
� 
reco� ��� m   � ��
� 
ctxt� ��� m   � ��
� 
msng�  �  t ��� n  � ���� I   � ����� 0 	skipsuite 	skipSuite� ��� o   � ��� 0 
skipreason 
skipReason�  �  � o   � ��� 0 _testreport _testReport� ��� L   � ��� o   � ��� 0 _testreport _testReport�  p   skip the whole suite   q ��� *   s k i p   t h e   w h o l e   s u i t e�&  �_   L F (missing value = run test; text = skip suite; record = run/skip test)    ��� �   ( m i s s i n g   v a l u e   =   r u n   t e s t ;   t e x t   =   s k i p   s u i t e ;   r e c o r d   =   r u n / s k i p   t e s t )�c  �b  �d   � R      ���
� .ascrerr ****      � ****� o      �
�
 0 etext eText� �	��
�	 
errn� o      �� 0 enumber eNumber� ���
� 
erob� o      �� 0 efrom eFrom� ���
� 
errt� o      �� 
0 eto eTo� ���
� 
ptlr� o      �� 0 epartial ePartial�   � k  ?�� ��� n 8��� I  8� ����  0 	addbroken 	addBroken� ��� m  �� ��� & c o n f i g u r e _ s k i p T e s t s� ��� m  �� ��� $ b r o k e   d u e   t o   e r r o r� ��� m  �� ���  � ���� l 	2������ J  2�� ���� J  0�� ��� m  �� ���   u n e x p e c t e d   e r r o r� ���� n .��� I  #.������� .0 makecaughterrorrecord makeCaughtErrorRecord� ��� o  #$���� 0 etext eText� ��� o  $%���� 0 enumber eNumber� ��� o  %&���� 0 efrom eFrom� ��� o  &'���� 
0 eto eTo� ���� o  '(���� 0 epartial ePartial��  ��  � o  #���� 0 _testsupport _TestSupport��  ��  ��  ��  ��  ��  � o  ���� 0 _testreport _testReport� ���� L  9?�� o  9>���� 0 _testreport _testReport��  ��  ��   � ��� l DD������  �   pre-test preparation   � ��� *   p r e - t e s t   p r e p a r a t i o n� ��� r  DK��� o  DE���� 0 suiteobject suiteObject� o      ���� 0 _suiteobject _suiteObject� ��� r  LS��� o  LM���� 0 handlername handlerName� o      ���� $0 _testhandlername _testHandlerName� ��� l TT������  �)# note: while `osatest` could supply a list of found handler names to check for existence of `configure_setUp` and `configure_tearDown`, that would only work for configure_setUp/configure_tearDown handlers defined directly within the suite script, not configure_setUp/configure_tearDown handlers inherited from a parent script; thus it's necessary to resort here to some undocumented hackery to determine existence of callable configure_setUp/configure_tearDown handlers before trying to call them (see also comments on `hasHandler` in TypeSupport)   � ���F   n o t e :   w h i l e   ` o s a t e s t `   c o u l d   s u p p l y   a   l i s t   o f   f o u n d   h a n d l e r   n a m e s   t o   c h e c k   f o r   e x i s t e n c e   o f   ` c o n f i g u r e _ s e t U p `   a n d   ` c o n f i g u r e _ t e a r D o w n ` ,   t h a t   w o u l d   o n l y   w o r k   f o r   c o n f i g u r e _ s e t U p / c o n f i g u r e _ t e a r D o w n   h a n d l e r s   d e f i n e d   d i r e c t l y   w i t h i n   t h e   s u i t e   s c r i p t ,   n o t   c o n f i g u r e _ s e t U p / c o n f i g u r e _ t e a r D o w n   h a n d l e r s   i n h e r i t e d   f r o m   a   p a r e n t   s c r i p t ;   t h u s   i t ' s   n e c e s s a r y   t o   r e s o r t   h e r e   t o   s o m e   u n d o c u m e n t e d   h a c k e r y   t o   d e t e r m i n e   e x i s t e n c e   o f   c a l l a b l e   c o n f i g u r e _ s e t U p / c o n f i g u r e _ t e a r D o w n   h a n d l e r s   b e f o r e   t r y i n g   t o   c a l l   t h e m   ( s e e   a l s o   c o m m e n t s   o n   ` h a s H a n d l e r `   i n   T y p e S u p p o r t )� ��� Z  T�������� n Tc��� I  Yc������� 0 
hashandler 
hasHandler� ���� N  Y_�� n  Y^��� o  Z^���� "0 configure_setup configure_setUp� o  YZ���� 0 suiteobject suiteObject��  ��  � o  TY���� 0 _support  � Q  f����� n in��� I  jn�������� "0 configure_setup configure_setUp��  ��  � o  ij���� 0 suiteobject suiteObject� R      ����
�� .ascrerr ****      � ****� o      ���� 0 etext eText� ����
�� 
errn� o      ���� 0 enumber eNumber� ����
�� 
erob� o      ���� 0 efrom eFrom� ����
�� 
errt� o      ���� 
0 eto eTo� �����
�� 
ptlr� o      ���� 0 epartial ePartial��  � k  v��� ��� n v���� I  {�������� 0 	addbroken 	addBroken� ��� m  {~�� ���  c o n f i g u r e _ s e t U p�    m  ~� � $ b r o k e   d u e   t o   e r r o r  m  �� �   �� l 	��	����	 J  ��

 �� J  ��  m  �� �   u n e x p e c t e d   e r r o r �� n �� I  �������� .0 makecaughterrorrecord makeCaughtErrorRecord  o  ������ 0 etext eText  o  ������ 0 enumber eNumber  o  ������ 0 efrom eFrom  o  ������ 
0 eto eTo �� o  ������ 0 epartial ePartial��  ��   o  ������ 0 _testsupport _TestSupport��  ��  ��  ��  ��  ��  � o  v{���� 0 _testreport _testReport�  r  �� !  m  ����
�� 
msng! o      ���� 0 _suiteobject _suiteObject "��" L  ��## o  ������ 0 _testreport _testReport��  ��  ��  � $%$ r  ��&'& n ��()( I  ����*����  0 maketestobject makeTestObject* +,+ o  ������ 0 suiteobject suiteObject, -��- o  ������ 0 handlername handlerName��  ��  ) o  ������ 0 _testsupport _TestSupport' o      ���� 0 
testobject 
testObject% ./. l ����01��  0   do test   1 �22    d o   t e s t/ 343 Q  �45675 Z  ��89��:8 n ��;<; I  ����=���� 0 
hashandler 
hasHandler= >��> N  ��?? n  ��@A@ o  ������ $0 configure_dotest configure_doTestA o  ������ 0 suiteobject suiteObject��  ��  < o  ������ 0 _support  9 n ��BCB I  ����D���� $0 configure_dotest configure_doTestD E��E o  ������ 0 
testobject 
testObject��  ��  C o  ������ 0 suiteobject suiteObject��  : n ��FGF I  ���������� 0 dotest doTest��  ��  G o  ������ 0 
testobject 
testObject6 R      ��HI
�� .ascrerr ****      � ****H o      ���� 0 etext eTextI ��JK
�� 
errnJ o      ���� 0 enumber eNumberK ��LM
�� 
erobL o      ���� 0 efrom eFromM ��NO
�� 
errtN o      ���� 
0 eto eToO ��P��
�� 
ptlrP o      ���� 0 epartial ePartial��  7 l �4QRSQ Z  �4TU����T H  �VV l �W����W F  �XYX =  ��Z[Z o  ������ 0 enumber eNumber[ o  ������ 00 _abortedassertionerror _AbortedAssertionErrorY = ��\]\ o  ������ 0 efrom eFrom] o  ������ 00 _abortedassertiontoken _AbortedAssertionToken��  ��  U l 0^_`^ l 0abca n 0ded I  0��f���� 0 
addfailure 
addFailuref ghg o  ���� 0 handlername handlerNameh iji m  kk �ll j ( e . g .   e r r o r   i n   c o d e   b e i n g   t e s t e d / b u g   i n   t e s t   h a n d l e r )j mnm m  oo �pp  n q��q l 	*r����r J  *ss t��t J  (uu vwv m  xx �yy   u n e x p e c t e d   e r r o rw z��z n &{|{ I  &��}���� .0 makecaughterrorrecord makeCaughtErrorRecord} ~~ o  ���� 0 etext eText ��� o  ���� 0 enumber eNumber� ��� o  ���� 0 efrom eFrom� ��� o  ���� 
0 eto eTo� ���� o   ���� 0 epartial ePartial��  ��  | o  ���� 0 _testsupport _TestSupport��  ��  ��  ��  ��  ��  e o  �� 0 _testreport _testReportb�� TO DO: without stack trace support, there's no way to distinguish an error raised by the code being tested versus an error caused by a bug in the test code, so we can only say error was 'unexpected' and leave user to figure out why; allowing `call_NAME` handlers to be used by `assert test result` would give users the opportunity to box up the code being tested allowing TestTools to distinguish the cause   c ���.   T O   D O :   w i t h o u t   s t a c k   t r a c e   s u p p o r t ,   t h e r e ' s   n o   w a y   t o   d i s t i n g u i s h   a n   e r r o r   r a i s e d   b y   t h e   c o d e   b e i n g   t e s t e d   v e r s u s   a n   e r r o r   c a u s e d   b y   a   b u g   i n   t h e   t e s t   c o d e ,   s o   w e   c a n   o n l y   s a y   e r r o r   w a s   ' u n e x p e c t e d '   a n d   l e a v e   u s e r   t o   f i g u r e   o u t   w h y ;   a l l o w i n g   ` c a l l _ N A M E `   h a n d l e r s   t o   b e   u s e d   b y   ` a s s e r t   t e s t   r e s u l t `   w o u l d   g i v e   u s e r s   t h e   o p p o r t u n i t y   t o   b o x   u p   t h e   c o d e   b e i n g   t e s t e d   a l l o w i n g   T e s t T o o l s   t o   d i s t i n g u i s h   t h e   c a u s e_ � � check if failure was already reported, and this is the subsequent abort, in which case ignore; if not, it's an error in either the test_NAME handler or the code being tested, so report it   ` ���x   c h e c k   i f   f a i l u r e   w a s   a l r e a d y   r e p o r t e d ,   a n d   t h i s   i s   t h e   s u b s e q u e n t   a b o r t ,   i n   w h i c h   c a s e   i g n o r e ;   i f   n o t ,   i t ' s   a n   e r r o r   i n   e i t h e r   t h e   t e s t _ N A M E   h a n d l e r   o r   t h e   c o d e   b e i n g   t e s t e d ,   s o   r e p o r t   i t��  ��  R   test failed   S ���    t e s t   f a i l e d4 ��� l 55�~���~  �   post-test clean up   � ��� &   p o s t - t e s t   c l e a n   u p� ��� Z  5����}�|� n 5D��� I  :D�{��z�{ 0 
hashandler 
hasHandler� ��y� N  :@�� n  :?��� o  ;?�x�x (0 configure_teardown configure_tearDown� o  :;�w�w 0 suiteobject suiteObject�y  �z  � o  5:�v�v 0 _support  � Q  G����� n JO��� I  KO�u�t�s�u (0 configure_teardown configure_tearDown�t  �s  � o  JK�r�r 0 suiteobject suiteObject� R      �q��
�q .ascrerr ****      � ****� o      �p�p 0 etext eText� �o��
�o 
errn� o      �n�n 0 enumber eNumber� �m��
�m 
erob� o      �l�l 0 efrom eFrom� �k��
�k 
errt� o      �j�j 
0 eto eTo� �i��h
�i 
ptlr� o      �g�g 0 epartial ePartial�h  � n W���� I  \��f��e�f 0 	addbroken 	addBroken� ��� m  \_�� ��� $ c o n f i g u r e _ t e a r D o w n� ��� m  _b�� ��� $ b r o k e   d u e   t o   e r r o r� ��� m  be�� ���  � ��d� l 	e|��c�b� J  e|�� ��a� J  ez�� ��� m  eh�� ���   u n e x p e c t e d   e r r o r� ��`� n hx��� I  mx�_��^�_ .0 makecaughterrorrecord makeCaughtErrorRecord� ��� o  mn�]�] 0 etext eText� ��� o  no�\�\ 0 enumber eNumber� ��� o  op�[�[ 0 efrom eFrom� ��� o  pq�Z�Z 
0 eto eTo� ��Y� o  qr�X�X 0 epartial ePartial�Y  �^  � o  hm�W�W 0 _testsupport _TestSupport�`  �a  �c  �b  �d  �e  � o  W\�V�V 0 _testreport _testReport�}  �|  � ��� r  ����� m  ���U
�U 
msng� o      �T�T 0 _suiteobject _suiteObject� ��S� l ������ L  ���� o  ���R�R 0 _testreport _testReport��{ TO DO: wrapping all the test data (result values, error info, status, etc) in a script object and returning that preserves AS context info and AS types across the AE bridge; the script object can then be loaded into a new OSAID and its methods called to extract each bit of data in turn for formatting and final message generation  (caveat not sure what ocids and optrs will do)   � ����   T O   D O :   w r a p p i n g   a l l   t h e   t e s t   d a t a   ( r e s u l t   v a l u e s ,   e r r o r   i n f o ,   s t a t u s ,   e t c )   i n   a   s c r i p t   o b j e c t   a n d   r e t u r n i n g   t h a t   p r e s e r v e s   A S   c o n t e x t   i n f o   a n d   A S   t y p e s   a c r o s s   t h e   A E   b r i d g e ;   t h e   s c r i p t   o b j e c t   c a n   t h e n   b e   l o a d e d   i n t o   a   n e w   O S A I D   a n d   i t s   m e t h o d s   c a l l e d   t o   e x t r a c t   e a c h   b i t   o f   d a t a   i n   t u r n   f o r   f o r m a t t i n g   a n d   f i n a l   m e s s a g e   g e n e r a t i o n     ( c a v e a t   n o t   s u r e   w h a t   o c i d s   a n d   o p t r s   w i l l   d o )�S   � ��� l     �Q�P�O�Q  �P  �O  � ��� l     �N�M�L�N  �M  �L  � ��� l     �K���K  � J D--------------------------------------------------------------------   � ��� � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -� ��� l     �J���J  � E ? Comparators; used to compare expected vs actual results/errors   � ��� ~   C o m p a r a t o r s ;   u s e d   t o   c o m p a r e   e x p e c t e d   v s   a c t u a l   r e s u l t s / e r r o r s� ��� l     �I�H�G�I  �H  �G  � ��� i  A D��� I      �F��E�F 20 _ascheckobjectparameter _asCheckObjectParameter� ��� o      �D�D 0 checkobject checkObject� ��C� o      �B�B (0 defaultcheckobject defaultCheckObject�C  �E  � k     <�� ��� Z    ���A�@� =    ��� o     �?�? 0 checkobject checkObject� m    �>
�> 
msng� r    	��� o    �=�= (0 defaultcheckobject defaultCheckObject� o      �<�< 0 checkobject checkObject�A  �@  � ��� r    ��� n   ��� I    �;��:�; &0 asscriptparameter asScriptParameter� � � o    �9�9 0 checkobject checkObject  �8 m     � 
 u s i n g�8  �:  � o    �7�7 0 _support  � o      �6�6 0 checkobject checkObject�  Z   9�5�4 H    * n   )	
	 I   ! )�3�2�3 0 
hashandler 
hasHandler �1 N   ! % n   ! $ o   " $�0�0  0 compareobjects compareObjects o   ! "�/�/ 0 checkobject checkObject�1  �2  
 o    !�.�. 0 _support   R   - 5�-
�- .ascrerr ****      � **** m   3 4 � � B a d    u s i n g    p a r a m e t e r   ( s c r i p t   o b j e c t   d o e s n  t   c o n t a i n   a    c o m p a r e O b j e c t s    h a n d l e r ) . �,
�, 
errn m   / 0�+�+�@ �*�)
�* 
erob o   1 2�(�( 0 checkobject checkObject�)  �5  �4   �' L   : < o   : ;�&�& 0 checkobject checkObject�'  �  l     �%�$�#�%  �$  �#    i  E H I      �"�!�" ,0 _ascheckobjectresult _asCheckObjectResult  �   o      �� 0 isequal isEqual�   �!   k     !! "#" Z    $%��$ H     	&& E    '(' J     )) *+* m     �
� boovtrue+ ,�, m    �
� boovfals�  ( J    -- .�. o    �� 0 isequal isEqual�  % R    �/0
� .ascrerr ****      � ****/ m    11 �22 Z C h e c k   o b j e c t   d i d   n o t   r e t u r n   a   b o o l e a n   r e s u l t .0 �34
� 
errn3 m    ���Y4 �56
� 
erob5 o    �� 0 isequal isEqual6 �7�
� 
errt7 m    �
� 
bool�  �  �  # 8�8 L    99 o    �� 0 isequal isEqual�   :;: l     ����  �  �  ; <=< l     �
>?�
  >  -----   ? �@@ 
 - - - - -= ABA l     �	CD�	  C   result checking   D �EE     r e s u l t   c h e c k i n gB FGF l     ����  �  �  G HIH i  I LJKJ I     ���
� .���:ExEqnull��� ��� null�  �  K h     �L� (0 exactequalitycheck ExactEqualityCheckL i    MNM I      �O� �  0 compareobjects compareObjectsO PQP o      ���� 0 expectedvalue expectedValueQ R��R o      ���� 0 actualvalue actualValue��  �   N P     8STUS k    7VV WXW l   ��YZ��  Y�� if both values are specifiers, compare them directly for equality (note: getting their `class` properties would dereference them, leading to unintended results/errors), otherwise compare both values' class properties for equality and return false if not the same, e.g. if unittest indicates a real is expected then integer is a code smell but `is equal to` operator ignores this difference when comparing numbers   Z �[[:   i f   b o t h   v a l u e s   a r e   s p e c i f i e r s ,   c o m p a r e   t h e m   d i r e c t l y   f o r   e q u a l i t y   ( n o t e :   g e t t i n g   t h e i r   ` c l a s s `   p r o p e r t i e s   w o u l d   d e r e f e r e n c e   t h e m ,   l e a d i n g   t o   u n i n t e n d e d   r e s u l t s / e r r o r s ) ,   o t h e r w i s e   c o m p a r e   b o t h   v a l u e s '   c l a s s   p r o p e r t i e s   f o r   e q u a l i t y   a n d   r e t u r n   f a l s e   i f   n o t   t h e   s a m e ,   e . g .   i f   u n i t t e s t   i n d i c a t e s   a   r e a l   i s   e x p e c t e d   t h e n   i n t e g e r   i s   a   c o d e   s m e l l   b u t   ` i s   e q u a l   t o `   o p e r a t o r   i g n o r e s   t h i s   d i f f e r e n c e   w h e n   c o m p a r i n g   n u m b e r sX \]\ r    ^_^ I   ��`a
�� .corecnte****       ****` J    	bb cdc o    ���� 0 expectedvalue expectedValued e��e o    ���� 0 actualvalue actualValue��  a ��f��
�� 
koclf m   
 ��
�� 
obj ��  _ o      ���� 0 	refscount 	refsCount] ghg Z   2ij����i G    )klk =    mnm o    ���� 0 	refscount 	refsCountn m    ���� l l   'o����o F    'pqp =    rsr o    ���� 0 	refscount 	refsCounts m    ����  q >   %tut n    !vwv m    !��
�� 
pclsw o    ���� 0 expectedvalue expectedValueu n   ! $xyx m   " $��
�� 
pclsy o   ! "���� 0 actualvalue actualValue��  ��  j L   , .zz m   , -��
�� boovfals��  ��  h {��{ L   3 7|| =  3 6}~} o   3 4���� 0 expectedvalue expectedValue~ o   4 5���� 0 actualvalue actualValue��  T ��
�� conscase ���
�� consdiac� ���
�� conshyph� ���
�� conspunc� ����
�� conswhit��  U ����
�� consnume��  I ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� j   M S����� .0 _defaultequalitycheck _defaultEqualityCheck� I  M R������
�� .���:ExEqnull��� ��� null��  ��  � ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� i  T W��� I     �����
�� .���:ExMunull��� ��� null��  � �����
�� 
Usin� |����������  ��  � o      ���� 0 checkobject checkObject��  � l     ������ m      ��
�� 
msng��  ��  ��  � Q     *���� k    �� ��� r    ��� I    ������� 20 _ascheckobjectparameter _asCheckObjectParameter� ��� o    ���� 0 checkobject checkObject� ���� o    
���� .0 _defaultequalitycheck _defaultEqualityCheck��  ��  � o      ���� 0 checkobject checkObject� ���� h    ����� *0 multiplechoicecheck MultipleChoiceCheck� i    ��� I      �������  0 compareobjects compareObjects� ��� o      ����  0 expectedvalues expectedValues� ���� o      ���� 0 actualvalue actualValue��  ��  � k     X�� ��� Z    $������� G     ��� =     ��� l    	������ I    	����
�� .corecnte****       ****� J     �� ���� o     ����  0 expectedvalues expectedValues��  � �����
�� 
kocl� m    ��
�� 
list��  ��  ��  � m   	 
����  � A    ��� n    ��� 1    ��
�� 
leng� o    ����  0 expectedvalues expectedValues� m    ���� � R     ����
�� .ascrerr ****      � ****� m    �� ��� � I n v a l i d   e x p e c t e d   v a l u e s   ( m u l t i p l e   c h o i c e   c h e c k  s    u s i n g    p a r a m e t e r   r e q u i r e s   a   l i s t   o f   t w o   o r   m o r e   e x p e c t e d   v a l u e s ) .� ����
�� 
errn� m    �����Y� �����
�� 
erob� o    ���� 0 expectedvalue expectedValue��  ��  ��  � ��� X   % U����� Z  5 P������� I   5 G������� ,0 _ascheckobjectresult _asCheckObjectResult� ���� n  6 C��� I   ; C�������  0 compareobjects compareObjects� ��� n  ; >��� 1   < >��
�� 
pcnt� o   ; <���� $0 expectedvalueref expectedValueRef� ���� o   > ?���� 0 actualvalue actualValue��  ��  � o   6 ;���� 0 checkobject checkObject��  ��  � L   J L�� m   J K��
�� boovtrue��  ��  �� $0 expectedvalueref expectedValueRef� o   ( )����  0 expectedvalues expectedValues� ���� L   V X�� m   V W��
�� boovfals��  ��  � R      ����
�� .ascrerr ****      � ****� o      ���� 0 etext eText� ����
�� 
errn� o      ���� 0 enumber eNumber� ����
�� 
erob� o      ���� 0 efrom eFrom� ���~
� 
errt� o      �}�} 
0 eto eTo�~  � I     *�|��{�| 
0 _error  � ��� m   ! "�� ��� , n u m e r i c   e q u a l i t y   c h e c k� ��� o   " #�z�z 0 etext eText� ��� o   # $�y�y 0 enumber eNumber� ��� o   $ %�x�x 0 efrom eFrom� ��w� o   % &�v�v 
0 eto eTo�w  �{  � ��� l     �u�t�s�u  �t  �s  � ��� l     �r�q�p�r  �q  �p  � ��� i  X [��� I     �o�n�
�o .���:NmEqnull��� ��� null�n  � �m��l
�m 
ETyp� |�k�j��i��k  �j  � o      �h�h (0 issametyperequired isSameTypeRequired�i  � l     ��g�f� m      �e
�e boovtrue�g  �f  �l  � l    4�� � Q     4 k    "  Z    �d	 n   

 I    �c�b�c (0 asbooleanparameter asBooleanParameter  o    	�a�a (0 issametyperequired isSameTypeRequired �` m   	 
 �  m a t c h i n g   t y p e s�`  �b   o    �_�_ 0 _support   r     m    �^
�^ 
doub o      �]�] 0 	checktype 	checkType�d  	 r     m    �\
�\ 
nmbr o      �[�[ 0 	checktype 	checkType �Z h    "�Y�Y 00 numericalequalitycheck NumericalEqualityCheck k        j     �X�X 0 _isequaldelta _isEqualDelta m      =q���-� �W i    I      �V �U�V  0 compareobjects compareObjects  !"! o      �T�T 0 expectedvalue expectedValue" #�S# o      �R�R 0 actualvalue actualValue�S  �U   k     �$$ %&% Z    '(�Q�P' =     )*) l    
+�O�N+ I    
�M,-
�M .corecnte****       ****, J     .. /0/ o     �L�L 0 expectedvalue expectedValue0 1�K1 o    �J�J 0 actualvalue actualValue�K  - �I2�H
�I 
kocl2 m    �G
�G 
long�H  �O  �N  * m   
 �F�F ( L    33 =    454 o    �E�E 0 expectedvalue expectedValue5 o    �D�D 0 actualvalue actualValue�Q  �P  & 676 Z   189�C�B8 >    (:;: l   &<�A�@< I   &�?=>
�? .corecnte****       ****= J    ?? @A@ o    �>�> 0 expectedvalue expectedValueA B�=B o    �<�< 0 actualvalue actualValue�=  > �;C�:
�; 
koclC o    "�9�9 0 	checktype 	checkType�:  �A  �@  ; m   & '�8�8 9 L   + -DD m   + ,�7
�7 boovfals�C  �B  7 EFE r   2 IGHG J   2 :II JKJ c   2 5LML o   2 3�6�6 0 expectedvalue expectedValueM m   3 4�5
�5 
doubK N�4N c   5 8OPO o   5 6�3�3 0 actualvalue actualValueP m   6 7�2
�2 
doub�4  H J      QQ RSR o      �1�1 0 n1  S T�0T o      �/�/ 0 n2  �0  F UVU Z   J eWX�.YW =   J MZ[Z o   J K�-�- 0 n1  [ m   K L�,�,  X r   P Y\]\ ]   P W^_^ o   P U�+�+ 0 _isequaldelta _isEqualDelta_ o   U V�*�* 0 n2  ] o      �)�) 0 d1  �.  Y r   \ e`a` ]   \ cbcb o   \ a�(�( 0 _isequaldelta _isEqualDeltac o   a b�'�' 0 n1  a o      �&�& 0 d1  V ded r   f jfgf d   f hhh o   f g�%�% 0 d1  g o      �$�$ 0 d2  e iji Z  k �kl�#�"k ?   k nmnm o   k l�!�! 0 d1  n o   l m� �  0 d2  l r   q �opo J   q uqq rsr o   q r�� 0 d2  s t�t o   r s�� 0 d1  �  p J      uu vwv o      �� 0 d1  w x�x o      �� 0 d2  �  �#  �"  j yzy r   � �{|{ \   � �}~} o   � ��� 0 n2  ~ o   � ��� 0 n1  | o      �� 0 d  z � L   � ��� F   � ���� A   � ���� o   � ��� 0 d1  � o   � ��� 0 d  � A   � ���� o   � ��� 0 d  � o   � ��� 0 d2  �  �W  �Z   R      ���
� .ascrerr ****      � ****� o      �� 0 etext eText� ���
� 
errn� o      �� 0 enumber eNumber� ���
� 
erob� o      �� 0 efrom eFrom� ���

� 
errt� o      �	�	 
0 eto eTo�
   I   * 4���� 
0 _error  � ��� m   + ,�� ��� , n u m e r i c   e q u a l i t y   c h e c k� ��� o   , -�� 0 etext eText� ��� o   - .�� 0 enumber eNumber� ��� o   . /�� 0 efrom eFrom� ��� o   / 0�� 
0 eto eTo�  �  � � � ignores slight differences due to floating point's limited precision when comparing real numbers -- TO DO: allow magnitude to be optionally specified?     ���.   i g n o r e s   s l i g h t   d i f f e r e n c e s   d u e   t o   f l o a t i n g   p o i n t ' s   l i m i t e d   p r e c i s i o n   w h e n   c o m p a r i n g   r e a l   n u m b e r s   - -   T O   D O :   a l l o w   m a g n i t u d e   t o   b e   o p t i o n a l l y   s p e c i f i e d ?� ��� l     �� ���  �   ��  � ��� l     ��������  ��  ��  � ��� i  \ _��� I     �����
�� .���:NmRgnull��� ��� null��  � �����
�� 
ETyp� |����������  ��  � o      ���� (0 issametyperequired isSameTypeRequired��  � l     ������ m      ��
�� boovtrue��  ��  ��  � Q     *���� k    �� ��� r    ��� n   ��� I    ������� (0 asbooleanparameter asBooleanParameter� ��� o    	���� (0 issametyperequired isSameTypeRequired� ���� m   	 
�� ���  m a t c h i n g   t y p e s��  ��  � o    ���� 0 _support  � o      ���� (0 issametyperequired isSameTypeRequired� ���� h    ����� *0 numericalrangecheck NumericalRangeCheck� i    ��� I      �������  0 compareobjects compareObjects� ��� o      ���� 0 expectedvalue expectedValue� ���� o      ���� 0 actualvalue actualValue��  ��  � k     ��� ��� Z    6������� G     '��� G     ��� =     ��� l    	������ I    	����
�� .corecnte****       ****� J     �� ���� o     ���� 0 expectedvalue expectedValue��  � �����
�� 
kocl� m    ��
�� 
list��  ��  ��  � m   	 
����  � >    ��� l   ������ I   ����
�� .corecnte****       ****� o    ���� 0 expectedvalue expectedValue� �����
�� 
kocl� m    ��
�� 
nmbr��  ��  ��  � m    ���� � l   %������ ?    %��� n    ��� 4     ���
�� 
cobj� m    ���� � o    ���� 0 expectedvalue expectedValue� n    $��� 4   ! $���
�� 
cobj� m   " #���� � o     !���� 0 expectedvalue expectedValue��  ��  � R   * 2����
�� .ascrerr ****      � ****� m   0 1�� ��� � I n v a l i d   e x p e c t e d   v a l u e   ( n u m e r i c   e q u a l i t y   c h e c k   r e q u i r e s   t w o - i t e m   l i s t   o f   m i n i m u m   a n d   m a x i m u m   n u m b e r s ) .� ����
�� 
errn� m   , -�����Y� �����
�� 
erob� o   . /���� 0 expectedvalue expectedValue��  ��  ��  � ��� r   7 G��� o   7 8���� 0 expectedvalue expectedValue� J      �� ��� o      ���� "0 expectedminimum expectedMinimum� ���� o      ���� "0 expectedmaximum expectedMaximum��  � ��� Z   H r������ o   H M���� (0 issametyperequired isSameTypeRequired� k   P l�� ��� Z  P f������� >  P W��� n  P S��� m   Q S��
�� 
pcls� o   P Q���� "0 expectedminimum expectedMinimum� n  S V��� m   T V��
�� 
pcls� o   S T���� "0 expectedmaximum expectedMaximum� R   Z b��� 
�� .ascrerr ****      � ****� m   ` a � � I n v a l i d   e x p e c t e d   v a l u e   ( n u m e r i c   e q u a l i t y   c h e c k  s    m a t c h i n g   t y p e s    p a r a m e t e r   r e q u i r e s   b o t h   n u m b e r s   t o   b e   s a m e   t y p e ) .  ��
�� 
errn m   \ ]�����Y ����
�� 
erob o   ^ _���� 0 expectedvalue expectedValue��  ��  ��  � �� r   g l n  g j	
	 m   h j��
�� 
pcls
 o   g h���� "0 expectedminimum expectedMinimum o      ���� 0 	checktype 	checkType��  ��  � r   o r m   o p��
�� 
nmbr o      ���� 0 	checktype 	checkType�  Z  s ����� =   s ~ l  s |���� I  s |��
�� .corecnte****       **** J   s v �� o   s t���� 0 actualvalue actualValue��   ����
�� 
kocl o   w x���� 0 	checktype 	checkType��  ��  ��   m   | }����   L   � � m   � ���
�� boovfals��  ��   �� L   � � F   � � B   � � o   � ����� "0 expectedminimum expectedMinimum o   � ����� 0 actualvalue actualValue B   � � !  o   � ����� 0 actualvalue actualValue! o   � ����� "0 expectedmaximum expectedMaximum��  ��  � R      ��"#
�� .ascrerr ****      � ****" o      ���� 0 etext eText# ��$%
�� 
errn$ o      ���� 0 enumber eNumber% ��&'
�� 
erob& o      ���� 0 efrom eFrom' ��(��
�� 
errt( o      ���� 
0 eto eTo��  � I     *��)���� 
0 _error  ) *+* m   ! ",, �-- & n u m e r i c   r a n g e   c h e c k+ ./. o   " #���� 0 etext eText/ 010 o   # $���� 0 enumber eNumber1 232 o   $ %���� 0 efrom eFrom3 4��4 o   % &���� 
0 eto eTo��  ��  � 565 l     ��������  ��  ��  6 787 l     ��������  ��  ��  8 9:9 l     ��;<��  ;  -----   < �== 
 - - - - -: >?> l     ��@A��  @   error checking   A �BB    e r r o r   c h e c k i n g? CDC l     �������  ��  �  D EFE i  ` cGHG I     �~�}I
�~ .���:ExErnull��� ��� null�}  I �|J�{
�| 
UsinJ |�z�yK�xL�z  �y  K o      �w�w ,0 errorattributechecks errorAttributeChecks�x  L J      �v�v  �{  H l    rMNOM k     rPP QRQ Q     fSTUS k    PVV WXW r    YZY n   [\[ I    �u]�t�u &0 asrecordparameter asRecordParameter] ^_^ o    	�s�s ,0 errorattributechecks errorAttributeChecks_ `�r` m   	 
aa �bb 
 u s i n g�r  �t  \ o    �q�q 0 _support  Z o      �p�p ,0 errorattributechecks errorAttributeChecksX cdc r    3efe K    1gg �ohi�o 0 errormessage errorMessageh o    �n�n .0 _defaultequalitycheck _defaultEqualityChecki �mjk�m 0 errornumber errorNumberj o    �l�l .0 _defaultequalitycheck _defaultEqualityCheckk �klm�k 0 	fromvalue 	fromValuel o    #�j�j .0 _defaultequalitycheck _defaultEqualityCheckm �ino�i 0 totype toTypen o   $ )�h�h .0 _defaultequalitycheck _defaultEqualityChecko �gp�f�g 0 partialresult partialResultp o   * /�e�e .0 _defaultequalitycheck _defaultEqualityCheck�f  f o      �d�d :0 defaulterrorattributechecks defaultErrorAttributeChecksd qrq r   4 9sts b   4 7uvu o   4 5�c�c ,0 errorattributechecks errorAttributeChecksv o   5 6�b�b :0 defaulterrorattributechecks defaultErrorAttributeCheckst o      �a�a 0 checkobjects checkObjectsr w�`w l  : Pxyzx Z  : P{|�_�^{ >   : A}~} n   : =� 1   ; =�]
�] 
leng� o   : ;�\�\ 0 checkobjects checkObjects~ n   = @��� 1   > @�[
�[ 
leng� o   = >�Z�Z :0 defaulterrorattributechecks defaultErrorAttributeChecks| R   D L�Y��
�Y .ascrerr ****      � ****� m   J K�� ��� � I n v a l i d    u s i n g    p a r a m e t e r   ( r e c o r d   c o n t a i n s   o n e   o r   m o r e   u n r e c o g n i z e d   p r o p e r t i e s ) .� �X��
�X 
errn� m   F G�W�W�Y� �V��U
�V 
erob� o   H I�T�T ,0 errorattributechecks errorAttributeChecks�U  �_  �^  y � � (note: this doesn't bother to check each property's type or that each object has a �compareObjects� handler as any problems there will raise errors if/when those error attributes are checked)   z ����   ( n o t e :   t h i s   d o e s n ' t   b o t h e r   t o   c h e c k   e a c h   p r o p e r t y ' s   t y p e   o r   t h a t   e a c h   o b j e c t   h a s   a    c o m p a r e O b j e c t s    h a n d l e r   a s   a n y   p r o b l e m s   t h e r e   w i l l   r a i s e   e r r o r s   i f / w h e n   t h o s e   e r r o r   a t t r i b u t e s   a r e   c h e c k e d )�`  T R      �S��
�S .ascrerr ****      � ****� o      �R�R 0 etext eText� �Q��
�Q 
errn� o      �P�P 0 enumber eNumber� �O��
�O 
erob� o      �N�N 0 efrom eFrom� �M��L
�M 
errt� o      �K�K 
0 eto eTo�L  U I   X f�J��I�J 
0 _error  � ��� m   Y \�� ��� " e x a c t   e r r o r   c h e c k� ��� o   \ ]�H�H 0 etext eText� ��� o   ] ^�G�G 0 enumber eNumber� ��� o   ^ _�F�F 0 efrom eFrom� ��E� o   _ `�D�D 
0 eto eTo�E  �I  R ��C� h   g r�B��B "0 exacterrorcheck ExactErrorCheck� i    ��� I      �A��@�A  0 compareobjects compareObjects� ��� o      �?�? 0 expectederror expectedError� ��>� o      �=�= 0 actualerror actualError�>  �@  � k     ��� ��� l     �<���<  � � note: `assert test error` normalizes the `expectedError` record prior to calling compareObjects so it will always contain the following properties; any properties that were not supplied by the test script will contain the unique script object `NoValue`   � ����   n o t e :   ` a s s e r t   t e s t   e r r o r `   n o r m a l i z e s   t h e   ` e x p e c t e d E r r o r `   r e c o r d   p r i o r   t o   c a l l i n g   c o m p a r e O b j e c t s   s o   i t   w i l l   a l w a y s   c o n t a i n   t h e   f o l l o w i n g   p r o p e r t i e s ;   a n y   p r o p e r t i e s   t h a t   w e r e   n o t   s u p p l i e d   b y   t h e   t e s t   s c r i p t   w i l l   c o n t a i n   t h e   u n i q u e   s c r i p t   o b j e c t   ` N o V a l u e `� ��� X     ���;�� k   \ ��� ��� l  \ \�:���:  � � � AS fun fact: using `set {a,b,c} to aRef` is hideously slow compared to `set {a,b,c} to contents of aRef` -- TO DO: figure out why   � ���   A S   f u n   f a c t :   u s i n g   ` s e t   { a , b , c }   t o   a R e f `   i s   h i d e o u s l y   s l o w   c o m p a r e d   t o   ` s e t   { a , b , c }   t o   c o n t e n t s   o f   a R e f `   - -   T O   D O :   f i g u r e   o u t   w h y� ��� r   \ u��� n   \ _��� 1   ] _�9
�9 
pcnt� o   \ ]�8�8 0 aref aRef� J      �� ��� o      �7�7 $0 expectedproperty expectedProperty� ��� o      �6�6  0 actualproperty actualProperty� ��5� o      �4�4 0 checkobject checkObject�5  � ��3� Z   v ����2�1� >  v ��� o   v w�0�0 $0 expectedproperty expectedProperty� n  w ~��� o   | ~�/�/ 0 novalue NoValue� o   w |�.�. 0 _testsupport _TestSupport� Z  � ����-�,� =  � ���� n  � ���� I   � ��+��*�+  0 compareobjects compareObjects� ��� o   � ��)�) $0 expectedproperty expectedProperty� ��(� o   � ��'�'  0 actualproperty actualProperty�(  �*  � o   � ��&�& 0 checkobject checkObject� m   � ��%
�% boovfals� L   � ��� m   � ��$
�$ boovfals�-  �,  �2  �1  �3  �; 0 aref aRef� J    P�� ��� l 	  ��#�"� J    �� ��� n   ��� o    �!�! 0 errornumber errorNumber� o    � �  0 expectederror expectedError� ��� n   	��� o    	�� 0 errornumber errorNumber� o    �� 0 actualerror actualError� ��� n   	 ��� o    �� 0 errornumber errorNumber� o   	 �� 0 checkobjects checkObjects�  �#  �"  � ��� l 	  !���� J    !�� ��� n   ��� o    �� 0 errormessage errorMessage� o    �� 0 expectederror expectedError� ��� n   ��� o    �� 0 errormessage errorMessage� o    �� 0 actualerror actualError� ��� n    ��� o    �� 0 errormessage errorMessage� o    �� 0 checkobjects checkObjects�  �  �  � ��� l 	 ! 0���� J   ! 0�� ��� n  ! $��� o   " $�� 0 	fromvalue 	fromValue� o   ! "�� 0 expectederror expectedError� ��� n  $ '��� o   % '�� 0 	fromvalue 	fromValue� o   $ %�� 0 actualerror actualError� ��� n   ' .   o   , .�
�
 0 	fromvalue 	fromValue o   ' ,�	�	 0 checkobjects checkObjects�  �  �  �  l 	 0 ?�� J   0 ?  n  0 3	 o   1 3�� 0 totype toType	 o   0 1�� 0 expectederror expectedError 

 n  3 6 o   4 6�� 0 totype toType o   3 4�� 0 actualerror actualError � n   6 = o   ; =�� 0 totype toType o   6 ;� �  0 checkobjects checkObjects�  �  �   �� l 	 ? N���� l 
 ? N���� J   ? N  n  ? B o   @ B���� 0 partialresult partialResult o   ? @���� 0 expectederror expectedError  n  B E o   C E���� 0 partialresult partialResult o   B C���� 0 actualerror actualError �� n   E L o   J L���� 0 partialresult partialResult o   E J���� 0 checkobjects checkObjects��  ��  ��  ��  ��  ��  �  ��  L   � �!! m   � ���
�� boovtrue��  �C  N q k compare two �class ����� (expected/actual error records) for equality, ignoring any placeholder attributes   O �"" �   c o m p a r e   t w o   � c l a s s   �   � � �   ( e x p e c t e d / a c t u a l   e r r o r   r e c o r d s )   f o r   e q u a l i t y ,   i g n o r i n g   a n y   p l a c e h o l d e r   a t t r i b u t e sF #$# l     ��������  ��  ��  $ %&% l     ��������  ��  ��  & '(' j   d l��)�� (0 _defaulterrorcheck _defaultErrorCheck) I  d i������
�� .���:ExErnull��� ��� null��  ��  ( *+* l     ��������  ��  ��  + ,-, l     ��������  ��  ��  - ./. l     ��01��  0 J D--------------------------------------------------------------------   1 �22 � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -/ 343 l     ��56��  5 H B Assertions; used by unit test scripts to perform individual tests   6 �77 �   A s s e r t i o n s ;   u s e d   b y   u n i t   t e s t   s c r i p t s   t o   p e r f o r m   i n d i v i d u a l   t e s t s4 898 l     ��������  ��  ��  9 :;: i  m p<=< I      ��>���� .0 _compareassertresults _compareAssertResults> ?@? o      ���� 0 checkobject checkObject@ ABA o      ����  0 expectedresult expectedResultB CDC o      ���� 0 actualresult actualResultD EFE o      ���� 0 
assertname 
assertNameF G��G o      ���� 0 usernote userNote��  ��  = Q     CHIJH L    KK n   
LML I    
��N����  0 compareobjects compareObjectsN OPO o    ����  0 expectedresult expectedResultP Q��Q o    ���� 0 actualresult actualResult��  ��  M o    ���� 0 checkobject checkObjectI R      ��RS
�� .ascrerr ****      � ****R o      ���� 0 etext eTextS ��TU
�� 
errnT o      ���� 0 enumber eNumberU ��VW
�� 
erobV o      ���� 0 efrom eFromW ��XY
�� 
errtX o      ���� 
0 eto eToY ��Z��
�� 
ptlrZ o      ���� 0 epartial ePartial��  J k    C[[ \]\ n   2^_^ I    2��`���� 0 	addbroken 	addBroken` aba o    ���� 0 
assertname 
assertNameb cdc m    ee �ff D b r o k e   d u e   t o   e r r o r   i n   c h e c k   o b j e c td ghg o    ���� 0 usernote userNoteh i��i l 	  .j����j J    .kk l��l J    ,mm non m    pp �qq   u n e x p e c t e d   e r r o ro r��r n   *sts I   ! *��u���� .0 makecaughterrorrecord makeCaughtErrorRecordu vwv o   ! "���� 0 etext eTextw xyx o   " #���� 0 enumber eNumbery z{z o   # $���� 0 efrom eFrom{ |}| o   $ %���� 
0 eto eTo} ~��~ o   % &���� 0 epartial ePartial��  ��  t o    !���� 0 _testsupport _TestSupport��  ��  ��  ��  ��  ��  _ o    ���� 0 _testreport _testReport] �� R   3 C�����
�� .ascrerr ****      � ****��  � ����
�� 
errn� o   5 :���� 00 _abortedassertionerror _AbortedAssertionError� �����
�� 
erob� o   ; @���� 00 _abortedassertiontoken _AbortedAssertionToken��  ��  ; ��� l     ��������  ��  ��  � ��� l     ������  �  -----   � ��� 
 - - - - -� ��� l     ��������  ��  ��  � ��� i  q t��� I     �����
�� .���:AsRenull��� ��� null��  � ����
�� 
Valu� o      ���� 0 actualresult actualResult� ����
�� 
Equa� o      ����  0 expectedresult expectedResult� ����
�� 
Summ� |����������  ��  � o      ���� 0 usernote userNote��  � l     ������ m      �� ���  ��  ��  � �����
�� 
Usin� |����������  ��  � o      ���� 0 checkobject checkObject��  � l     ������ m      ��
�� 
msng��  ��  ��  � P     ����� k    ��� ��� Z   ������� =   ��� o    
���� 0 _suiteobject _suiteObject� m   
 ��
�� 
msng� R    ����
�� .ascrerr ****      � ****� m    �� ��� l C a n n o t   u s e    a s s e r t   t e s t   r e s u l t    o u t s i d e   o f   u n i t   t e s t s .� �����
�� 
errn� m    �����T��  ��  ��  � ��� Q    |���� k    8�� ��� r    *��� n   (��� I   " (������� "0 astextparameter asTextParameter� ��� o   " #���� 0 usernote userNote� ���� m   # $�� ���  n o t e��  ��  � o    "�� 0 _support  � o      �~�~ 0 usernote userNote� ��}� r   + 8��� I   + 6�|��{�| 20 _ascheckobjectparameter _asCheckObjectParameter� ��� o   , -�z�z 0 checkobject checkObject� ��y� o   - 2�x�x .0 _defaultequalitycheck _defaultEqualityCheck�y  �{  � o      �w�w 0 checkobject checkObject�}  � R      �v��
�v .ascrerr ****      � ****� o      �u�u 0 etext eText� �t��
�t 
errn� o      �s�s 0 enumber eNumber� �r��
�r 
erob� o      �q�q 0 efrom eFrom� �p��
�p 
errt� o      �o�o 
0 eto eTo� �n��m
�n 
ptlr� o      �l�l 0 epartial ePartial�m  � k   @ |�� ��� n  @ g��� I   E g�k��j�k 0 	addbroken 	addBroken� ��� m   E F�� ��� $ a s s e r t   t e s t   r e s u l t� ��� m   F G�� ��� . r e c e i v e d   b a d   p a r a m e t e r s� ��� o   G H�i�i 0 usernote userNote� ��h� l 	 H a��g�f� J   H a�� ��� J   H Y�� ��� m   H I�� ���   u n e x p e c t e d   e r r o r� ��e� n  I W��� I   N W�d��c�d .0 makecaughterrorrecord makeCaughtErrorRecord� ��� o   N O�b�b 0 etext eText� ��� o   O P�a�a 0 enumber eNumber� ��� o   P Q�`�` 0 efrom eFrom� ��� o   Q R�_�_ 
0 eto eTo� ��^� o   R S�]�] 0 epartial ePartial�^  �c  � o   I N�\�\ 0 _testsupport _TestSupport�e  � ��[� J   Y _�� ��� m   Y \�� ���  e x p e c t e d   r e s u l t� ��Z� o   \ ]�Y�Y  0 expectedresult expectedResult�Z  �[  �g  �f  �h  �j  � o   @ E�X�X 0 _testreport _testReport�  �W  R   h |�V�U
�V .ascrerr ****      � ****�U   �T
�T 
errn o   j o�S�S 00 _abortedassertionerror _AbortedAssertionError �R�Q
�R 
erob o   r w�P�P 00 _abortedassertiontoken _AbortedAssertionToken�Q  �W  �  r   } � I   } ��O	�N�O ,0 _ascheckobjectresult _asCheckObjectResult	 
�M
 I   ~ ��L�K�L .0 _compareassertresults _compareAssertResults  o    ��J�J 0 checkobject checkObject  o   � ��I�I  0 expectedresult expectedResult  o   � ��H�H 0 actualresult actualResult  m   � � � $ a s s e r t   t e s t   r e s u l t �G o   � ��F�F 0 usernote userNote�G  �K  �M  �N   o      �E�E 0 isequal isEqual  r   � � J   � �  J   � �   m   � �!! �""  a c t u a l   r e s u l t  #�D# o   � ��C�C 0 actualresult actualResult�D   $�B$ J   � �%% &'& m   � �(( �))  e x p e c t e d   r e s u l t' *�A* o   � ��@�@  0 expectedresult expectedResult�A  �B   o      �?�? 0 testdata testData +�>+ Z   � �,-�=., o   � ��<�< 0 isequal isEqual- k   � �// 010 n  � �232 I   � ��;4�:�; 0 
addsuccess 
addSuccess4 565 m   � �77 �88 $ a s s e r t   t e s t   r e s u l t6 9:9 o   � ��9�9 0 usernote userNote: ;�8; o   � ��7�7 0 testdata testData�8  �:  3 o   � ��6�6 0 _testreport _testReport1 <�5< L   � ��4�4  �5  �=  . k   � �== >?> n  � �@A@ I   � ��3B�2�3 0 
addfailure 
addFailureB CDC m   � �EE �FF $ a s s e r t   t e s t   r e s u l tD GHG m   � �II �JJ 2 r e c e i v e d   i n c o r r e c t   r e s u l tH KLK o   � ��1�1 0 usernote userNoteL M�0M o   � ��/�/ 0 testdata testData�0  �2  A o   � ��.�. 0 _testreport _testReport? N�-N R   � ��,�+O
�, .ascrerr ****      � ****�+  O �*PQ
�* 
errnP o   � ��)�) 00 _abortedassertionerror _AbortedAssertionErrorQ �(R�'
�( 
erobR o   � ��&�& 00 _abortedassertiontoken _AbortedAssertionToken�'  �-  �>  � �%S
�% conscaseS �$T
�$ consdiacT �#U
�# conshyphU �"V
�" conspuncV �!� 
�! conswhit�   � ��
� consnume�  � WXW l     ����  �  �  X YZY l     ����  �  �  Z [\[ i  u x]^] I     ��_
� .���:AsErnull��� ��� null�  _ �`a
� 
Hand` |��b�c�  �  b o      �� "0 callhandlername callHandlerName�  c l     d��d m      ee �ff  �  �  a �gh
� 
Argsg |��i�j�  �  i o      �
�
  0 parametervalue parameterValue�  j l     k�	�k m      �
� 
���!�	  �  h �lm
� 
Equal o      �� 0 expectederror expectedErrorm �no
� 
Summn |��p�q�  �  p o      � �  0 usernote userNote�  q l     r����r m      ss �tt  ��  ��  o ��u��
�� 
Usinu |����v��w��  ��  v o      ���� 0 checkobject checkObject��  w l     x����x m      ��
�� 
msng��  ��  ��  ^ P    Xyz{y k   W|| }~} Z   ����� =   ��� o    
���� 0 _suiteobject _suiteObject� m   
 ��
�� 
msng� R    ����
�� .ascrerr ****      � ****� m    �� ��� j C a n n o t   u s e    a s s e r t   t e s t   e r r o r    o u t s i d e   o f   u n i t   t e s t s .� �����
�� 
errn� m    �����T��  ��  ��  ~ ��� Q    ����� k    a�� ��� r    *��� n   (��� I   " (������� "0 astextparameter asTextParameter� ��� o   " #���� "0 callhandlername callHandlerName� ���� m   # $�� ���  i n��  ��  � o    "���� 0 _support  � o      ���� "0 callhandlername callHandlerName� ��� r   + 8��� n  + 6��� I   0 6������� &0 asrecordparameter asRecordParameter� ��� o   0 1���� 0 expectederror expectedError� ���� m   1 2�� ���  i s��  ��  � o   + 0���� 0 _support  � o      ���� 0 expectederror expectedError� ��� r   9 E��� n  9 C��� I   > C������� <0 normalizeexpectederrorrecord normalizeExpectedErrorRecord� ���� o   > ?���� 0 expectederror expectedError��  ��  � o   9 >���� 0 _testsupport _TestSupport� o      ���� 0 expectederror expectedError� ��� l  F F������  � � � TO DO: what about checking expectedError record's properties are valid types (e.g. error number should be integer, message should be text, etc.), and abort with broken test if not   � ���h   T O   D O :   w h a t   a b o u t   c h e c k i n g   e x p e c t e d E r r o r   r e c o r d ' s   p r o p e r t i e s   a r e   v a l i d   t y p e s   ( e . g .   e r r o r   n u m b e r   s h o u l d   b e   i n t e g e r ,   m e s s a g e   s h o u l d   b e   t e x t ,   e t c . ) ,   a n d   a b o r t   w i t h   b r o k e n   t e s t   i f   n o t� ��� r   F S��� n  F Q��� I   K Q������� "0 astextparameter asTextParameter� ��� o   K L���� 0 usernote userNote� ���� m   L M�� ���  n o t e��  ��  � o   F K���� 0 _support  � o      ���� 0 usernote userNote� ���� r   T a��� I   T _������� 20 _ascheckobjectparameter _asCheckObjectParameter� ��� o   U V���� 0 checkobject checkObject� ���� o   V [���� (0 _defaulterrorcheck _defaultErrorCheck��  ��  � o      ���� 0 checkobject checkObject��  � R      ����
�� .ascrerr ****      � ****� o      ���� 0 etext eText� ����
�� 
errn� o      ���� 0 enumber eNumber� ����
�� 
erob� o      ���� 0 efrom eFrom� ����
�� 
errt� o      ���� 
0 eto eTo� �����
�� 
ptlr� o      ���� 0 epartial ePartial��  � k   i ��� ��� n  i ���� I   n �������� 0 	addbroken 	addBroken� ��� m   n o�� ��� " a s s e r t   t e s t   e r r o r� ��� m   o r�� ��� . r e c e i v e d   b a d   p a r a m e t e r s� ��� o   r s���� 0 usernote userNote� ���� l 	 s ������� J   s ��� ���� J   s ��� ��� m   s v�� ���   u n e x p e c t e d   e r r o r� ���� n  v ���� I   { �������� .0 makecaughterrorrecord makeCaughtErrorRecord� ��� o   { |���� 0 etext eText� ��� o   | }���� 0 enumber eNumber� ��� o   } ~���� 0 efrom eFrom� ��� o   ~ ���� 
0 eto eTo� ���� o    ����� 0 epartial ePartial��  ��  � o   v {���� 0 _testsupport _TestSupport��  ��  ��  ��  ��  ��  � o   i n���� 0 _testreport _testReport� ���� R   � ������
�� .ascrerr ****      � ****��  � ����
�� 
errn� o   � ����� 00 _abortedassertionerror _AbortedAssertionError� �����
�� 
erob� o   � ����� 00 _abortedassertiontoken _AbortedAssertionToken��  ��  � ��� l  � �������  � G A code-generate a script object to invoke the `call_NAME` handler�   � ��� �   c o d e - g e n e r a t e   a   s c r i p t   o b j e c t   t o   i n v o k e   t h e   ` c a l l _ N A M E `   h a n d l e r &� � � P   � ��� Z   � ��� =  � � o   � ����� "0 callhandlername callHandlerName m   � � �		   l  � �

 r   � � b   � � m   � � �  c a l l l  � ����� n   � � 7  � ���
�� 
ctxt m   � �����  m   � ������� o   � ����� $0 _testhandlername _testHandlerName��  ��   o      ���� "0 callhandlername callHandlerName | v if `for` parameter is omitted, automatically call a `call_NAME` handler with the same NAME as the `test_NAME` handler    � �   i f   ` f o r `   p a r a m e t e r   i s   o m i t t e d ,   a u t o m a t i c a l l y   c a l l   a   ` c a l l _ N A M E `   h a n d l e r   w i t h   t h e   s a m e   N A M E   a s   t h e   ` t e s t _ N A M E `   h a n d l e r  H   � � C   � � o   � ����� "0 callhandlername callHandlerName m   � � � 
 c a l l _  ��  r   � �!"! b   � �#$# m   � �%% �&& 
 c a l l _$ o   � ����� "0 callhandlername callHandlerName" o      ���� "0 callhandlername callHandlerName��  ��  ��   ����
�� conscase��    '(' Z   �)*��+) =  � �,-, o   � �����  0 parametervalue parameterValue- m   � ���
�� 
���!* r   � �./. n  � �010 I   � ���2����  0 makecallobject makeCallObject2 343 o   � ����� "0 callhandlername callHandlerName4 5��5 m   � �����  ��  ��  1 o   � ����� 0 _testsupport _TestSupport/ o      ���� 0 
callobject 
callObject��  + r   �676 n  �
898 I  
��:����  0 makecallobject makeCallObject: ;<; o  ���� "0 callhandlername callHandlerName< =��= m  ���� ��  ��  9 o   ����� 0 _testsupport _TestSupport7 o      ���� 0 
callobject 
callObject( >?> l ��@A��  @   �then call it   A �BB    & t h e n   c a l l   i t? CDC l >EFGE r  >HIH J  "JJ KLK n MNM o  ���� 0 novalue NoValueN o  ���� 0 _testsupport _TestSupportL OPO n QRQ o  ���� 0 novalue NoValueR o  ���� 0 _testsupport _TestSupportP S��S m   �
� boovfals��  I J      TT UVU o      �~�~ 0 actualerror actualErrorV WXW o      �}�} 0 actualresult actualResultX Y�|Y o      �{�{ 0 isequal isEqual�|  F \ V TO DO: rename isEqual to isSuccess once 'is equal' test code is moved to Check object   G �ZZ �   T O   D O :   r e n a m e   i s E q u a l   t o   i s S u c c e s s   o n c e   ' i s   e q u a l '   t e s t   c o d e   i s   m o v e d   t o   C h e c k   o b j e c tD [\[ Q  ?]^_] l BO`ab` r  BOcdc n BMefe I  CM�zg�y�z 0 callhandler callHandlerg hih o  CH�x�x 0 _suiteobject _suiteObjecti j�wj o  HI�v�v  0 parametervalue parameterValue�w  �y  f o  BC�u�u 0 
callobject 
callObjectd o      �t�t 0 actualresult actualResulta n h note: this may return literal 'no value' due to AS's schlonky design - this will be accounted for below   b �kk �   n o t e :   t h i s   m a y   r e t u r n   l i t e r a l   ' n o   v a l u e '   d u e   t o   A S ' s   s c h l o n k y   d e s i g n   -   t h i s   w i l l   b e   a c c o u n t e d   f o r   b e l o w^ R      �slm
�s .ascrerr ****      � ****l o      �r�r 0 etext eTextm �qno
�q 
errnn o      �p�p 0 enumber eNumbero �opq
�o 
erobp o      �n�n 0 efrom eFromq �mrs
�m 
errtr o      �l�l 
0 eto eTos �kt�j
�k 
ptlrt o      �i�i 0 epartial ePartial�j  _ k  Wuu vwv l WW�hxy�h  x y s compare expected vs actual error info, ignoring any actual error info that user-supplied record doesn't care about   y �zz �   c o m p a r e   e x p e c t e d   v s   a c t u a l   e r r o r   i n f o ,   i g n o r i n g   a n y   a c t u a l   e r r o r   i n f o   t h a t   u s e r - s u p p l i e d   r e c o r d   d o e s n ' t   c a r e   a b o u tw {|{ r  Wi}~} n Wg� I  \g�g��f�g .0 makecaughterrorrecord makeCaughtErrorRecord� ��� o  \]�e�e 0 etext eText� ��� o  ]^�d�d 0 enumber eNumber� ��� o  ^_�c�c 0 efrom eFrom� ��� o  _`�b�b 
0 eto eTo� ��a� o  `a�`�` 0 epartial ePartial�a  �f  � o  W\�_�_ 0 _testsupport _TestSupport~ o      �^�^ 0 actualerror actualError| ��]� r  j��� I  j}�\��[�\ ,0 _ascheckobjectresult _asCheckObjectResult� ��Z� I  ky�Y��X�Y .0 _compareassertresults _compareAssertResults� ��� o  lm�W�W 0 checkobject checkObject� ��� o  mn�V�V 0 expectederror expectedError� ��� o  no�U�U 0 actualerror actualError� ��� m  or�� ��� " a s s e r t   t e s t   e r r o r� ��T� o  rs�S�S 0 usernote userNote�T  �X  �Z  �[  � o      �R�R 0 isequal isEqual�]  \ ��Q� Z  �W���P�� o  ���O�O 0 isequal isEqual� l ������ k  ���� ��� n ����� I  ���N��M�N 0 
addsuccess 
addSuccess� ��� m  ���� ��� " a s s e r t   t e s t   e r r o r� ��� o  ���L�L 0 usernote userNote� ��K� J  ���� ��� J  ���� ��� m  ���� ���  a c t u a l   e r r o r� ��J� o  ���I�I 0 actualerror actualError�J  � ��H� J  ���� ��� m  ���� ���  e x p e c t e d   e r r o r� ��G� o  ���F�F 0 expectederror expectedError�G  �H  �K  �M  � o  ���E�E 0 _testreport _testReport� ��D� L  ���C�C  �D  �   success   � ���    s u c c e s s�P  � l �W���� k  �W�� ��� Q  ������ l ������ l ������ r  ����� o  ���B�B 0 actualresult actualResult� o      �A�A 0 actualresult actualResult� � z this variable lookup fails if call_NAME returned nothing (i.e. `null`, which AS literally treats as 'no value at all')...   � ��� �   t h i s   v a r i a b l e   l o o k u p   f a i l s   i f   c a l l _ N A M E   r e t u r n e d   n o t h i n g   ( i . e .   ` n u l l ` ,   w h i c h   A S   l i t e r a l l y   t r e a t s   a s   ' n o   v a l u e   a t   a l l ' ) . . .� g a kludge-around for AS's dumb commands-are-not-expressions-so-do-not-have-to-return-results design   � ��� �   k l u d g e - a r o u n d   f o r   A S ' s   d u m b   c o m m a n d s - a r e - n o t - e x p r e s s i o n s - s o - d o - n o t - h a v e - t o - r e t u r n - r e s u l t s   d e s i g n� R      �@�?�
�@ .ascrerr ****      � ****�?  � �>��=
�> 
errn� d      �� m      �<�<
��=  � l ������ r  ����� n ����� o  ���;�; 0 novalue NoValue� o  ���:�: 0 _testsupport _TestSupport� o      �9�9 0 actualresult actualResult� a [ ... in which case replace it with a 'no value placeholder' object that AS can actually see   � ��� �   . . .   i n   w h i c h   c a s e   r e p l a c e   i t   w i t h   a   ' n o   v a l u e   p l a c e h o l d e r '   o b j e c t   t h a t   A S   c a n   a c t u a l l y   s e e� ��� Z �����8�7� > ����� o  ���6�6 0 actualerror actualError� n ����� o  ���5�5 0 novalue NoValue� o  ���4�4 0 _testsupport _TestSupport� r  ����� J  ���� ��� m  ���� ��� 0 r e c e i v e d   i n c o r r e c t   e r r o r� ��3� J  ���� ��� J  ���� ��� m  ���� ���  a c t u a l   e r r o r� ��2� o  ���1�1 0 actualerror actualError�2  � ��0� J  ���� ��� m  ���� ���  e x p e c t e d   e r r o r� ��/� o  ���.�. 0 expectederror expectedError�/  �0  �3  � J      	 	  			 o      �-�- 0 problemtype problemType	 	�,	 o      �+�+ 0 testdata testData�,  �8  �7  � 			 Z �0		�*�)	 > �				 o  ���(�( 0 actualresult actualResult		 n �	
		
 o  ��'�' 0 novalue NoValue	 o  ���&�& 0 _testsupport _TestSupport	 r  ,			 J  		 			 m  			 �		 " r e c e i v e d   n o   e r r o r	 	�%	 J  			 			 J  			 			 m  			 �		 " u n e x p e c t e d   r e s u l t	 	�$	 o  �#�# 0 actualresult actualResult�$  	 	�"	 J  		 		 	 m  	!	! �	"	"  e x p e c t e d   e r r o r	  	#�!	# o  � �  0 expectederror expectedError�!  �"  �%  	 J      	$	$ 	%	&	% o      �� 0 problemtype problemType	& 	'�	' o      �� 0 testdata testData�  �*  �)  	 	(	)	( n 1B	*	+	* I  6B�	,�� 0 
addfailure 
addFailure	, 	-	.	- m  69	/	/ �	0	0 " a s s e r t   t e s t   e r r o r	. 	1	2	1 o  9:�� 0 problemtype problemType	2 	3	4	3 o  :;�� 0 usernote userNote	4 	5�	5 o  ;<�� 0 testdata testData�  �  	+ o  16�� 0 _testreport _testReport	) 	6�	6 R  CW��	7
� .ascrerr ****      � ****�  	7 �	8	9
� 
errn	8 o  EJ�� 00 _abortedassertionerror _AbortedAssertionError	9 �	:�
� 
erob	: o  MR�� 00 _abortedassertiontoken _AbortedAssertionToken�  �  � 2 , raised wrong error or didn't raise an error   � �	;	; X   r a i s e d   w r o n g   e r r o r   o r   d i d n ' t   r a i s e   a n   e r r o r�Q  z �	<
� conscase	< �	=
� consdiac	= �	>
� conshyph	> �
	?
�
 conspunc	? �	�
�	 conswhit�  { ��
� consnume�  \ 	@	A	@ l     ����  �  �  	A 	B	C	B l     ��� �  �  �   	C 	D	E	D l     ��	F	G��  	F  -----   	G �	H	H 
 - - - - -	E 	I	J	I l     ��������  ��  ��  	J 	K	L	K i  y |	M	N	M I      ��	O����  0 _genericassert _genericAssert	O 	P	Q	P o      ���� 0 
assertname 
assertName	Q 	R	S	R o      ���� 0 
didsucceed 
didSucceed	S 	T	U	T o      ���� 0 actualresult actualResult	U 	V��	V o      ���� 0 usernote userNote��  ��  	N P     �	W	X	Y	W k    �	Z	Z 	[	\	[ Z   	]	^����	] =   	_	`	_ o    
���� 0 _suiteobject _suiteObject	` m   
 ��
�� 
msng	^ R    ��	a	b
�� .ascrerr ****      � ****	a b    	c	d	c b    	e	f	e m    	g	g �	h	h  C a n n o t   u s e   	f o    ���� 0 
assertname 
assertName	d m    	i	i �	j	j 0    o u t s i d e   o f   u n i t   t e s t s .	b ��	k��
�� 
errn	k m    �����T��  ��  ��  	\ 	l	m	l Q    h	n	o	p	n r   ! .	q	r	q n  ! ,	s	t	s I   & ,��	u���� "0 astextparameter asTextParameter	u 	v	w	v o   & '���� 0 usernote userNote	w 	x��	x m   ' (	y	y �	z	z  n o t e��  ��  	t o   ! &���� 0 _support  	r o      ���� 0 usernote userNote	o R      ��	{	|
�� .ascrerr ****      � ****	{ o      ���� 0 etext eText	| ��	}	~
�� 
errn	} o      ���� 0 enumber eNumber	~ ��		�
�� 
erob	 o      ���� 0 efrom eFrom	� ��	�	�
�� 
errt	� o      ���� 
0 eto eTo	� ��	���
�� 
ptlr	� o      ���� 0 epartial ePartial��  	p k   6 h	�	� 	�	�	� n  6 U	�	�	� I   ; U��	����� 0 	addbroken 	addBroken	� 	�	�	� o   ; <���� 0 
assertname 
assertName	� 	�	�	� m   < =	�	� �	�	� . r e c e i v e d   b a d   p a r a m e t e r s	� 	�	�	� o   = >���� 0 usernote userNote	� 	���	� l 	 > Q	�����	� J   > Q	�	� 	���	� J   > O	�	� 	�	�	� m   > ?	�	� �	�	�   u n e x p e c t e d   e r r o r	� 	���	� n  ? M	�	�	� I   D M��	����� .0 makecaughterrorrecord makeCaughtErrorRecord	� 	�	�	� o   D E���� 0 etext eText	� 	�	�	� o   E F���� 0 enumber eNumber	� 	�	�	� o   F G���� 0 efrom eFrom	� 	�	�	� o   G H���� 
0 eto eTo	� 	���	� o   H I���� 0 epartial ePartial��  ��  	� o   ? D���� 0 _testsupport _TestSupport��  ��  ��  ��  ��  ��  	� o   6 ;���� 0 _testreport _testReport	� 	���	� R   V h����	�
�� .ascrerr ****      � ****��  	� ��	�	�
�� 
errn	� o   X ]���� 00 _abortedassertionerror _AbortedAssertionError	� ��	���
�� 
erob	� o   ` e���� 00 _abortedassertiontoken _AbortedAssertionToken��  ��  	m 	�	�	� Z   i �	�	���	�	� =  i n	�	�	� o   i j���� 0 actualresult actualResult	� m   j m��
�� 
���!	� r   q u	�	�	� J   q s����  	� o      ���� 0 testdata testData��  	� r   x �	�	�	� J   x �	�	� 	���	� J   x ~	�	� 	�	�	� m   x {	�	� �	�	�  a c t u a l   r e s u l t	� 	���	� o   { |���� 0 actualresult actualResult��  ��  	� o      ���� 0 testdata testData	� 	���	� Z   � �	�	���	�	� o   � ����� 0 
didsucceed 
didSucceed	� k   � �	�	� 	�	�	� n  � �	�	�	� I   � ���	����� 0 
addsuccess 
addSuccess	� 	�	�	� o   � ����� 0 
assertname 
assertName	� 	�	�	� o   � ����� 0 usernote userNote	� 	���	� o   � ����� 0 testdata testData��  ��  	� o   � ����� 0 _testreport _testReport	� 	���	� L   � �����  ��  ��  	� k   � �	�	� 	�	�	� n  � �	�	�	� I   � ���	����� 0 
addfailure 
addFailure	� 	�	�	� o   � ����� 0 
assertname 
assertName	� 	�	�	� m   � �	�	� �	�	�  	� 	�	�	� o   � ����� 0 usernote userNote	� 	���	� o   � ����� 0 testdata testData��  ��  	� o   � ����� 0 _testreport _testReport	� 	���	� R   � �����	�
�� .ascrerr ****      � ****��  	� ��	�	�
�� 
errn	� o   � ����� 00 _abortedassertionerror _AbortedAssertionError	� ��	���
�� 
erob	� o   � ����� 00 _abortedassertiontoken _AbortedAssertionToken��  ��  ��  	X ��	�
�� conscase	� ��	�
�� consdiac	� ��	�
�� conshyph	� ��	�
�� conspunc	� ����
�� conswhit��  	Y ����
�� consnume��  	L 	�	�	� l     ��������  ��  ��  	� 	�	�	� l     ��������  ��  ��  	� 	�	�	� l     ��������  ��  ��  	� 	�	�	� i  } �	�	�	� I     ����	�
�� .���:AsPanull��� ��� null��  	� ��	�	�
�� 
Valu	� |����	���	���  ��  	� o      ���� 0 actualresult actualResult��  	� l     	�����	� m      ��
�� 
���!��  ��  	� ��	��
�� 
Summ	� |�~�}	��|	��~  �}  	� o      �{�{ 0 usernote userNote�|  	� l     	��z�y	� m      	�	� �	�	�  �z  �y  �  	� l    		�	�
 	� I     	�x
�w�x  0 _genericassert _genericAssert
 


 m    

 �

 $ a s s e r t   t e s t   p a s s e d
 


 m    �v
�v boovtrue
 

	
 o    �u�u 0 actualresult actualResult
	 

�t

 o    �s�s 0 usernote userNote�t  �w  	� 9 3 TO DO: optional param for passing expected result?   
  �

 f   T O   D O :   o p t i o n a l   p a r a m   f o r   p a s s i n g   e x p e c t e d   r e s u l t ?	� 


 l     �r�q�p�r  �q  �p  
 


 l     �o�n�m�o  �n  �m  
 


 i  � �


 I     �l�k

�l .���:AsFanull��� ��� null�k  
 �j


�j 
Valu
 |�i�h
�g
�i  �h  
 o      �f�f 0 actualresult actualResult�g  
 l     
�e�d
 m      �c
�c 
���!�e  �d  
 �b
�a
�b 
Summ
 |�`�_
�^
�`  �_  
 o      �]�] 0 usernote userNote�^  
 l     
�\�[
 m      

 �

  �\  �[  �a  
 l    	
 
!
"
  I     	�Z
#�Y�Z  0 _genericassert _genericAssert
# 
$
%
$ m    
&
& �
'
' $ a s s e r t   t e s t   f a i l e d
% 
(
)
( m    �X
�X boovfals
) 
*
+
* o    �W�W 0 actualresult actualResult
+ 
,�V
, o    �U�U 0 usernote userNote�V  �Y  
! 9 3 TO DO: optional param for passing expected result?   
" �
-
- f   T O   D O :   o p t i o n a l   p a r a m   f o r   p a s s i n g   e x p e c t e d   r e s u l t ?
 
.
/
. l     �T�S�R�T  �S  �R  
/ 
0
1
0 l     �Q�P�O�Q  �P  �O  
1 
2
3
2 l     �N
4
5�N  
4 J D--------------------------------------------------------------------   
5 �
6
6 � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
3 
7
8
7 l     �M
9
:�M  
9 ` Z convenience commands for locating/running the osatest executable embedded in this library   
: �
;
; �   c o n v e n i e n c e   c o m m a n d s   f o r   l o c a t i n g / r u n n i n g   t h e   o s a t e s t   e x e c u t a b l e   e m b e d d e d   i n   t h i s   l i b r a r y
8 
<
=
< l     �L�K�J�L  �K  �J  
= 
>
?
> i  � �
@
A
@ I     �I�H�G
�I .���:TRPanull��� ��� null�H  �G  
A Q     0
B
C
D
B l   
E
F
G
E Q    
H
I
J
H L    
K
K c    
L
M
L l   
N�F�E
N I   �D
O
P
�D .sysorpthalis        TEXT
O m    
Q
Q �
R
R  o s a t e s t
P �C
S�B
�C 
in D
S m    	
T
T �
U
U  b i n�B  �F  �E  
M m    �A
�A 
furl
I R      �@�?
V
�@ .ascrerr ****      � ****�?  
V �>
W�=
�> 
errn
W d      
X
X m      �<�<
��=  
J l   
Y
Z
[
Y R    �;
\
]
�; .ascrerr ****      � ****
\ m    
^
^ �
_
_ 0 A   r e s o u r c e   w a s n  t   f o u n d .
] �:
`�9
�: 
errn
` m    �8�8�@�9  
Z R L returned 'nothing' instead of raising 'resource not found' error (very odd)   
[ �
a
a �   r e t u r n e d   ' n o t h i n g '   i n s t e a d   o f   r a i s i n g   ' r e s o u r c e   n o t   f o u n d '   e r r o r   ( v e r y   o d d )
F I C shouldn't fail unless TestTools library has been incorrectly built   
G �
b
b �   s h o u l d n ' t   f a i l   u n l e s s   T e s t T o o l s   l i b r a r y   h a s   b e e n   i n c o r r e c t l y   b u i l t
C R      �7
c
d
�7 .ascrerr ****      � ****
c o      �6�6 0 etext eText
d �5
e
f
�5 
errn
e o      �4�4 0 enumber eNumber
f �3
g
h
�3 
erob
g o      �2�2 0 efrom eFrom
h �1
i�0
�1 
errt
i o      �/�/ 
0 eto eTo�0  
D I   & 0�.
j�-�. 
0 _error  
j 
k
l
k m   ' (
m
m �
n
n   u n i t   t e s t   r u n n e r
l 
o
p
o o   ( )�,�, 0 etext eText
p 
q
r
q o   ) *�+�+ 0 enumber eNumber
r 
s
t
s o   * +�*�* 0 efrom eFrom
t 
u�)
u o   + ,�(�( 
0 eto eTo�)  �-  
? 
v
w
v l     �'�&�%�'  �&  �%  
w 
x
y
x l     �$�#�"�$  �#  �"  
y 
z
{
z i   � �
|
}
| I     �!
~� 
�! .���:RunTnull���     file
~ o      �� 0 testfile testFile�   
} l    5

�
�
 Q     5
�
�
�
� L    #
�
� I   "�
�
�
� .sysoexecTEXT���     TEXT
� b    
�
�
� b    
�
�
� l   
���
� n    
�
�
� 1   
 �
� 
strq
� n    

�
�
� 1    
�
� 
psxp
� l   
���
� I   ���
� .���:TRPanull��� ��� null�  �  �  �  �  �  
� l 
  
���
� 1    �
� 
spac�  �  
� l   
���
� n    
�
�
� 1    �
� 
strq
� n   
�
�
� I    �
��� ,0 asposixpathparameter asPOSIXPathParameter
� 
�
�
� o    �� 0 testfile testFile
� 
��
� m    
�
� �
�
�  �  �  
� o    �
�
 0 _support  �  �  
� �	
��
�	 
alen
� m    �
� boovfals�  
� R      �
�
�
� .ascrerr ****      � ****
� o      �� 0 etext eText
� �
�
�
� 
errn
� o      �� 0 enumber eNumber
� �
�
�
� 
erob
� o      �� 0 efrom eFrom
� � 
���
�  
errt
� o      ���� 
0 eto eTo��  
� I   + 5��
����� 
0 _error  
� 
�
�
� m   , -
�
� �
�
�  r u n   u n i t   t e s t s
� 
�
�
� o   - .���� 0 etext eText
� 
�
�
� o   . /���� 0 enumber eNumber
� 
�
�
� o   / 0���� 0 efrom eFrom
� 
���
� o   0 1���� 
0 eto eTo��  ��  
� . ( e.g. for running tests in Script Editor   
� �
�
� P   e . g .   f o r   r u n n i n g   t e s t s   i n   S c r i p t   E d i t o r
{ 
���
� l     ��������  ��  ��  ��       ��
�
�
�
�
���
�������
�
�
�
�
�
�
�
�
�
�
�
�
�
�
�
�
�
���  
� ������������������������������������������������������
�� 
pimr�� 0 _support  �� 
0 _error  �� 0 _testsupport _TestSupport�� 00 _abortedassertionerror _AbortedAssertionError�� 00 _abortedassertiontoken _AbortedAssertionToken�� 0 _suiteobject _suiteObject�� 0 _testreport _testReport�� $0 _testhandlername _testHandlerName�� 0 __performunittestforsuite__  �� 20 _ascheckobjectparameter _asCheckObjectParameter�� ,0 _ascheckobjectresult _asCheckObjectResult
�� .���:ExEqnull��� ��� null�� .0 _defaultequalitycheck _defaultEqualityCheck
�� .���:ExMunull��� ��� null
�� .���:NmEqnull��� ��� null
�� .���:NmRgnull��� ��� null
�� .���:ExErnull��� ��� null�� (0 _defaulterrorcheck _defaultErrorCheck�� .0 _compareassertresults _compareAssertResults
�� .���:AsRenull��� ��� null
�� .���:AsErnull��� ��� null��  0 _genericassert _genericAssert
�� .���:AsPanull��� ��� null
�� .���:AsFanull��� ��� null
�� .���:TRPanull��� ��� null
�� .���:RunTnull���     file
� ��
��� 
�  
�
�
� ��
���
�� 
cobj
� 
�
�   �� 
�� 
frmk��  
� ��
���
�� 
cobj
� 
�
�   ��
�� 
osax��  
� 
�
�   �� -
�� 
scpt
� �� 5����
�
����� 
0 _error  �� ��
��� 
�  ������������ 0 handlername handlerName�� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTo��  
� ������������ 0 handlername handlerName�� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTo
�  E������ �� &0 throwcommanderror throwCommandError�� b  ࠡ����+ 
� 
�
�   �� \
�� 
scpt��A
� �� z  
��� 00 _abortedassertiontoken _AbortedAssertionToken
�  
�
�  
�� 
msng
�� 
msng
�� 
msng
� �� �����
�
����� 0 __performunittestforsuite__  �� ��
��� 
�  ��
��� 0 suiteobject suiteObject
� ��
��� 
�  �������� 0 	suitename 	suiteName�� 0 handlername handlerName�� 0 isstyled isStyled��  
� �������������������������� 0 suiteobject suiteObject�� 0 	suitename 	suiteName�� 0 handlername handlerName�� 0 isstyled isStyled�� 0 skipinfo skipInfo�� 0 
skipreason 
skipReason�� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTo�� 0 epartial ePartial�� 0 
testobject 
testObject
� 7��������
�����������������������������
���RT�������
������������������������kox����������  0 maketestreport makeTestReport�� *0 configure_skiptests configure_skipTests�� 0 
hashandler 
hasHandler��  
� ����~
�� 
errn��?�~  
�� 
errn���?
�� 
erob
�� 
errt
�� 
reco
�� 
ctxt
�� 
msng�� �� 0 istype isType
�� misccura�� 0 nsdictionary NSDictionary�� 60 dictionarywithdictionary_ dictionaryWithDictionary_�� 0 objectforkey_ objectForKey_
�� 
****
� �}�|�{
�} 
errn�|�\�{  ���\�� 0 
addskipped 
addSkipped�� 0 	skipsuite 	skipSuite�� 0 etext eText
� �z�y
�
�z 
errn�y 0 enumber eNumber
� �x�w
�
�x 
erob�w 0 efrom eFrom
� �v�u
�
�v 
errt�u 
0 eto eTo
� �t�s�r
�t 
ptlr�s 0 epartial ePartial�r  �� �� .0 makecaughterrorrecord makeCaughtErrorRecord�� �� 0 	addbroken 	addBroken�� "0 configure_setup configure_setUp��  0 maketestobject makeTestObject�� $0 configure_dotest configure_doTest�� 0 dotest doTest
�� 
bool�� 0 
addfailure 
addFailure�� (0 configure_teardown configure_tearDown���b  ���m+  Ec  Ob  ��,k+ ! �j+ E�O �E�W X  )�������mv��Ob  O�� �b  ��l+  _�a ,�k+ �k+ a &E�O�� ? 
��&E�W X  )�a ����lv�a �%a %Ob  ��l+ Ob  Y hY @�� 9 
��&E�W X  )�a �����mv�a Ob  �k+ Ob  Y hY hW 9X  b  a a a a  b  �����a !+ "lvkva #+ $Ob  Y hO�Ec  O�Ec  Ob  �a %,k+  O 
�j+ %W AX  b  a &a 'a (a )b  �����a !+ "lvkva #+ $O�Ec  Ob  Y hOb  ��l+ *E�O %b  �a +,k+  ��k+ +Y �j+ ,W MX  �b   	 �b   a -& .b  �a .a /a 0b  �����a !+ "lvkva #+ 1Y hOb  �a 2,k+  @ 
�j+ 2W 2X  b  a 3a 4a 5a 6b  �����a !+ "lvkva #+ $Y hO�Ec  Ob  
� �q��p�o
�
��n�q 20 _ascheckobjectparameter _asCheckObjectParameter�p �m
��m 
�  �l�k�l 0 checkobject checkObject�k (0 defaultcheckobject defaultCheckObject�o  
� �j�i�j 0 checkobject checkObject�i (0 defaultcheckobject defaultCheckObject
� 
�h�g�f�e�d�c�b�a
�h 
msng�g &0 asscriptparameter asScriptParameter�f  0 compareobjects compareObjects�e 0 
hashandler 
hasHandler
�d 
errn�c�@
�b 
erob�a �n =��  �E�Y hOb  ��l+ E�Ob  ��,k+  )�����Y hO�
� �`�_�^
�
��]�` ,0 _ascheckobjectresult _asCheckObjectResult�_ �\
��\ 
�  �[�[ 0 isequal isEqual�^  
� �Z�Z 0 isequal isEqual
� �Y�X�W�V�U�T1
�Y 
errn�X�Y
�W 
erob
�V 
errt
�U 
bool�T �] eflv�kv )�������Y hO�
� �SK�R�Q
�
��P
�S .���:ExEqnull��� ��� null�R  �Q  
� �O�O (0 exactequalitycheck ExactEqualityCheck
� �NL
��N (0 exactequalitycheck ExactEqualityCheck
� �M
��L�K
�
��J
�M .ascrinit****      � ****
� k     
�
� L�I�I  �L  �K  
� �H�H  0 compareobjects compareObjects
� 
�
� �GN�F�E
�
��D�G  0 compareobjects compareObjects�F �C
��C 
�  �B�A�B 0 expectedvalue expectedValue�A 0 actualvalue actualValue�E  
� �@�?�>�@ 0 expectedvalue expectedValue�? 0 actualvalue actualValue�> 0 	refscount 	refsCount
� TU�=�<�;�:�9
�= 
kocl
�< 
obj 
�; .corecnte****       ****
�: 
pcls
�9 
bool�D 9�� 5��lv��l E�O�k 
 �j 	 ��,��,�&�& fY hO�� V�J L  �P ��K S�
� �8L  
��8 (0 exactequalitycheck ExactEqualityCheck
� �7
�
��7  
� �6��5�4
�
��3
�6 .���:ExMunull��� ��� null�5  �4 �2
��1
�2 
Usin
� {�0�/�.�0 0 checkobject checkObject�/  
�. 
msng�1  
� �-�,�+�*�)�(�- 0 checkobject checkObject�, *0 multiplechoicecheck MultipleChoiceCheck�+ 0 etext eText�* 0 enumber eNumber�) 0 efrom eFrom�( 
0 eto eTo
� 	�'�&�
��%
���$�#�' 20 _ascheckobjectparameter _asCheckObjectParameter�& *0 multiplechoicecheck MultipleChoiceCheck
� �"
��!� 
�
��
�" .ascrinit****      � ****
� k     
�
� ���  �!  �   
� ��  0 compareobjects compareObjects
�    ������  0 compareobjects compareObjects� ��   ���  0 expectedvalues expectedValues� 0 actualvalue actualValue�   �����  0 expectedvalues expectedValues� 0 actualvalue actualValue� 0 expectedvalue expectedValue� $0 expectedvalueref expectedValueRef ��������
�	�����
� 
kocl
� 
list
� .corecnte****       ****
� 
leng
� 
bool
� 
errn��Y
�
 
erob�	 
� 
cobj
� 
pcnt�  0 compareobjects compareObjects� ,0 _ascheckobjectresult _asCheckObjectResult� Y�kv��l j 
 	��,l�& )�����Y hO /�[��l kh *b   ��,�l+ k+  eY h[OY��Of� L  �% 0 etext eText
� ��
� 
errn� 0 enumber eNumber ��
� 
erob� 0 efrom eFrom � ����
�  
errt�� 
0 eto eTo��  �$ �# 
0 _error  �3 + *�b  l+  E�O��K S�W X  *梣���+ 
� ���������
�� .���:NmEqnull��� ��� null��  �� ����
�� 
ETyp {�������� (0 issametyperequired isSameTypeRequired��  
�� boovtrue��   ���������������� (0 issametyperequired isSameTypeRequired�� 0 	checktype 	checkType�� 00 numericalequalitycheck NumericalEqualityCheck�� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTo ��������	��
������� (0 asbooleanparameter asBooleanParameter
�� 
doub
�� 
nmbr�� 00 numericalequalitycheck NumericalEqualityCheck	 ��������
�� .ascrinit****      � **** k       ����  ��  ��   ������ 0 _isequaldelta _isEqualDelta��  0 compareobjects compareObjects ���� 0 _isequaldelta _isEqualDelta ����������  0 compareobjects compareObjects�� ����   ������ 0 expectedvalue expectedValue�� 0 actualvalue actualValue��   ���������������� 0 expectedvalue expectedValue�� 0 actualvalue actualValue�� 0 n1  �� 0 n2  �� 0 d1  �� 0 d2  �� 0 d   ������������
�� 
kocl
�� 
long
�� .corecnte****       ****
�� 
doub
�� 
cobj
�� 
bool�� ���lv��l l  	�� Y hO��lv�b  l l fY hO��&��&lvE[�k/E�Z[�l/E�ZO�j  b   � E�Y b   � E�O�'E�O�� ��lvE[�k/E�Z[�l/E�ZY hO��E�O��	 ���&�� �OL �� 0 etext eText
 ����
�� 
errn�� 0 enumber eNumber ����
�� 
erob�� 0 efrom eFrom ������
�� 
errt�� 
0 eto eTo��  �� �� 
0 _error  �� 5 $b  ��l+  �E�Y �E�O��K S�W X  *飤���+ 
� ���������
�� .���:NmRgnull��� ��� null��  �� ����
�� 
ETyp {�������� (0 issametyperequired isSameTypeRequired��  
�� boovtrue��   �������������� (0 issametyperequired isSameTypeRequired�� *0 numericalrangecheck NumericalRangeCheck�� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTo 
��������,������ (0 asbooleanparameter asBooleanParameter�� *0 numericalrangecheck NumericalRangeCheck ��������
�� .ascrinit****      � **** k      �����  ��  ��   ����  0 compareobjects compareObjects  ������� !����  0 compareobjects compareObjects�� ��"�� "  ������ 0 expectedvalue expectedValue�� 0 actualvalue actualValue��    ������������ 0 expectedvalue expectedValue�� 0 actualvalue actualValue�� "0 expectedminimum expectedMinimum�� "0 expectedmaximum expectedMaximum�� 0 	checktype 	checkType! �����������������������
�� 
kocl
�� 
list
�� .corecnte****       ****
�� 
nmbr
�� 
bool
�� 
cobj
�� 
errn���Y
�� 
erob�� 
�� 
pcls�� ��kv��l j 
 ���l l�&
 ��k/��l/�& )�����Y hO�E[�k/E�Z[�l/E�ZOb    !��,��, )�����Y hO��,E�Y �E�O�kv�l j  fY hO��	 ���&�� L  �� 0 etext eText ����#
�� 
errn�� 0 enumber eNumber# ����$
�� 
erob�� 0 efrom eFrom$ ������
�� 
errt�� 
0 eto eTo��  �� �� 
0 _error  �� + b  ��l+ E�O��K S�W X  *碣���+ 	
� ��H����%&��
�� .���:ExErnull��� ��� null��  �� ��'��
�� 
Usin' {�������� ,0 errorattributechecks errorAttributeChecks��  ��  ��  % ��������~�}�|�{�� ,0 errorattributechecks errorAttributeChecks�� :0 defaulterrorattributechecks defaultErrorAttributeChecks�� 0 checkobjects checkObjects� 0 etext eText�~ 0 enumber eNumber�} 0 efrom eFrom�| 
0 eto eTo�{ "0 exacterrorcheck ExactErrorCheck& a�z�y�x�w�v�u�t�s�r�q�p�o��n(��m�l�k�)�z &0 asrecordparameter asRecordParameter�y 0 errormessage errorMessage�x 0 errornumber errorNumber�w 0 	fromvalue 	fromValue�v 0 totype toType�u 0 partialresult partialResult�t 

�s 
leng
�r 
errn�q�Y
�p 
erob�o �n 0 etext eText( �j�i*
�j 
errn�i 0 enumber eNumber* �h�g+
�h 
erob�g 0 efrom eFrom+ �f�e�d
�f 
errt�e 
0 eto eTo�d  �m �l 
0 _error  �k "0 exacterrorcheck ExactErrorCheck) �c,�b�a-.�`
�c .ascrinit****      � ****, k     // ��_�_  �b  �a  - �^�^  0 compareobjects compareObjects. 00 �]��\�[12�Z�]  0 compareobjects compareObjects�\ �Y3�Y 3  �X�W�X 0 expectederror expectedError�W 0 actualerror actualError�[  1 �V�U�T�S�R�Q�V 0 expectederror expectedError�U 0 actualerror actualError�T 0 aref aRef�S $0 expectedproperty expectedProperty�R  0 actualproperty actualProperty�Q 0 checkobject checkObject2 �P�O�N�M�L�K�J�I�H�G�F�E�P 0 errornumber errorNumber�O 0 errormessage errorMessage�N 0 	fromvalue 	fromValue�M 0 totype toType�L 0 partialresult partialResult�K 
�J 
kocl
�I 
cobj
�H .corecnte****       ****
�G 
pcnt�F 0 novalue NoValue�E  0 compareobjects compareObjects�Z � ���,��,b  �,mv��,��,b  �,mv��,��,b  �,mv��,��,b  �,mv��,��,b  �,mv�v[��l kh ��,E[�k/E�Z[�l/E�Z[�m/E�ZO�b  �, ���l+ f  fY hY h[OY��Oe�` L  �� s Rb  ��l+ E�O�b  �b  �b  �b  �b  �E�O��%E�O��,��, )�����Y hW X  *a ����a + Oa a K S�
� �D�  4�D "0 exacterrorcheck ExactErrorCheck4 5-05 
 %677�C�B�A�@
�6 �?�>�?  �>  7 �=
�8�= 0 errormessage errorMessage8 �<
�9�< 0 errornumber errorNumber9 �;
�:�; 0 	fromvalue 	fromValue: �:
�;�: 0 totype toType; �9
��8�9 0 partialresult partialResult�8  �C  �B  �A  �@  
� �7=�6�5<=�4�7 .0 _compareassertresults _compareAssertResults�6 �3>�3 >  �2�1�0�/�.�2 0 checkobject checkObject�1  0 expectedresult expectedResult�0 0 actualresult actualResult�/ 0 
assertname 
assertName�. 0 usernote userNote�5  < 
�-�,�+�*�)�(�'�&�%�$�- 0 checkobject checkObject�,  0 expectedresult expectedResult�+ 0 actualresult actualResult�* 0 
assertname 
assertName�) 0 usernote userNote�( 0 etext eText�' 0 enumber eNumber�& 0 efrom eFrom�% 
0 eto eTo�$ 0 epartial ePartial= �#�"?ep�!� �����#  0 compareobjects compareObjects�" 0 etext eText? ��@
� 
errn� 0 enumber eNumber@ ��A
� 
erob� 0 efrom eFromA ��B
� 
errt� 
0 eto eToB ���
� 
ptlr� 0 epartial ePartial�  �! �  .0 makecaughterrorrecord makeCaughtErrorRecord� � 0 	addbroken 	addBroken
� 
errn
� 
erob�4 D ���l+  W 7X  b  ���b  ������+ lvkv�+ O)�b  �b  �h
� ����CD�
� .���:AsRenull��� ��� null�  � ��E
� 
Valu� 0 actualresult actualResultE ��F
� 
Equa�  0 expectedresult expectedResultF �
GH
�
 
SummG {�	���	 0 usernote userNote�  H �I�
� 
UsinI {���� 0 checkobject checkObject�  
� 
msng�  C ��� ����������������� 0 actualresult actualResult�  0 expectedresult expectedResult�  0 usernote userNote�� 0 checkobject checkObject�� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTo�� 0 epartial ePartial�� 0 isequal isEqual�� 0 testdata testDataD ����������������J������������������!(7��EI��
�� 
msng
�� 
errn���T�� "0 astextparameter asTextParameter�� 20 _ascheckobjectparameter _asCheckObjectParameter�� 0 etext eTextJ ����K
�� 
errn�� 0 enumber eNumberK ����L
�� 
erob�� 0 efrom eFromL ����M
�� 
errt�� 
0 eto eToM ������
�� 
ptlr�� 0 epartial ePartial��  �� �� .0 makecaughterrorrecord makeCaughtErrorRecord�� �� 0 	addbroken 	addBroken
�� 
erob�� .0 _compareassertresults _compareAssertResults�� ,0 _ascheckobjectresult _asCheckObjectResult�� 0 
addsuccess 
addSuccess�� 0 
addfailure 
addFailure� ��� �b  �  )��l�Y hO  b  ��l+ E�O*�b  l+ E�W CX 	 
b  ���b  ������+ lva �lvlva + O)�b  a b  a hO**���a ��+ k+ E�Oa �lva �lvlvE�O� b  a ��m+ OhY *b  a a ��a + O)�b  a b  a hV
� ��^����NO��
�� .���:AsErnull��� ��� null��  �� ��PQ
�� 
HandP {����e�� "0 callhandlername callHandlerName��  Q ��RS
�� 
ArgsR {��������  0 parametervalue parameterValue��  
�� 
���!S ����T
�� 
Equa�� 0 expectederror expectedErrorT ��UV
�� 
SummU {����s�� 0 usernote userNote��  V ��W��
�� 
UsinW {�������� 0 checkobject checkObject��  
�� 
msng��  N ���������������������������������� "0 callhandlername callHandlerName��  0 parametervalue parameterValue�� 0 expectederror expectedError�� 0 usernote userNote�� 0 checkobject checkObject�� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTo�� 0 epartial ePartial�� 0 
callobject 
callObject�� 0 actualerror actualError�� 0 actualresult actualResult�� 0 isequal isEqual�� 0 problemtype problemType�� 0 testdata testDataO 3z{��������������������X���������������%����������������������Y���			!	/��
�� 
msng
�� 
errn���T�� "0 astextparameter asTextParameter�� &0 asrecordparameter asRecordParameter�� <0 normalizeexpectederrorrecord normalizeExpectedErrorRecord�� 20 _ascheckobjectparameter _asCheckObjectParameter�� 0 etext eTextX ����Z
�� 
errn�� 0 enumber eNumberZ ����[
�� 
erob�� 0 efrom eFrom[ ����\
�� 
errt�� 
0 eto eTo\ ������
�� 
ptlr�� 0 epartial ePartial��  �� �� .0 makecaughterrorrecord makeCaughtErrorRecord�� �� 0 	addbroken 	addBroken
�� 
erob
�� 
ctxt
�� 
���!��  0 makecallobject makeCallObject�� 0 novalue NoValue
�� 
cobj�� 0 callhandler callHandler�� .0 _compareassertresults _compareAssertResults�� ,0 _ascheckobjectresult _asCheckObjectResult�� 0 
addsuccess 
addSuccess��  Y ������
�� 
errn���?��  �� 0 
addfailure 
addFailure��Y��Ub  �  )��l�Y hO Ib  ��l+ E�Ob  ��l+ 	E�Ob  �k+ 
E�Ob  ��l+ E�O*�b  l+ E�W CX  b  �a �a b  �����a + lvkva + O)�b  a b  a hOga  ;�a   a b  [a \[Za \Zi2%E�Y �a  a �%E�Y hVO�a   b  �jl+ E�Y b  �kl+ E�Ob  a ,b  a ,fmvE[a  k/E�Z[a  l/E�Z[a  m/E�ZO �b  �l+ !E�W /X  b  �����a + E�O**���a "�a + #k+ $E�O� #b  a %�a &�lva '�lvlvm+ (OhY � �E�W X ) *b  a ,E�O�b  a , +a +a ,�lva -�lvlvlvE[a  k/E�Z[a  l/E�ZY hO�b  a , +a .a /�lva 0�lvlvlvE[a  k/E�Z[a  l/E�ZY hOb  a 1���a + 2O)�b  a b  a hV
� ��	N����]^����  0 _genericassert _genericAssert�� ��_�� _  ���������� 0 
assertname 
assertName�� 0 
didsucceed 
didSucceed�� 0 actualresult actualResult�� 0 usernote userNote��  ] 
���������������������� 0 
assertname 
assertName�� 0 
didsucceed 
didSucceed�� 0 actualresult actualResult�� 0 usernote userNote�� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTo�� 0 epartial ePartial�� 0 testdata testData^ 	X	Y������	g	i	y���`	�	��~�}�|�{�z�y	��x	��w
�� 
msng
�� 
errn���T�� "0 astextparameter asTextParameter� 0 etext eText` �v�ua
�v 
errn�u 0 enumber eNumbera �t�sb
�t 
erob�s 0 efrom eFromb �r�qc
�r 
errt�q 
0 eto eToc �p�o�n
�p 
ptlr�o 0 epartial ePartial�n  �~ �} .0 makecaughterrorrecord makeCaughtErrorRecord�| �{ 0 	addbroken 	addBroken
�z 
erob
�y 
���!�x 0 
addsuccess 
addSuccess�w 0 
addfailure 
addFailure�� ��� �b  �  )��l�%�%Y hO b  ��l+ E�W 9X 	 
b  ���b  ������+ lvkv�+ O)�b  a b  �hO�a   	jvE�Y a �lvkvE�O� b  ���m+ OhY $b  �a ���+ O)�b  a b  �hV
� �m	��l�kde�j
�m .���:AsPanull��� ��� null�l  �k �ifg
�i 
Valuf {�h�g�f�h 0 actualresult actualResult�g  
�f 
���!g �eh�d
�e 
Summh {�c�b	��c 0 usernote userNote�b  �d  d �a�`�a 0 actualresult actualResult�` 0 usernote userNotee 
�_�^�_ �^  0 _genericassert _genericAssert�j 
*�e���+ 
� �]
�\�[ij�Z
�] .���:AsFanull��� ��� null�\  �[ �Ykl
�Y 
Valuk {�X�W�V�X 0 actualresult actualResult�W  
�V 
���!l �Um�T
�U 
Summm {�S�R
�S 0 usernote userNote�R  �T  i �Q�P�Q 0 actualresult actualResult�P 0 usernote userNotej 
&�O�N�O �N  0 _genericassert _genericAssert�Z 
*�f���+ 
� �M
A�L�Kno�J
�M .���:TRPanull��� ��� null�L  �K  n �I�H�G�F�I 0 etext eText�H 0 enumber eNumber�G 0 efrom eFrom�F 
0 eto eToo 
Q�E
T�D�C�Bp�A�@
^�?q
m�>�=
�E 
in D
�D .sysorpthalis        TEXT
�C 
furl�B  p �<�;�:
�< 
errn�;�5�:  
�A 
errn�@�@�? 0 etext eTextq �9�8r
�9 
errn�8 0 enumber eNumberr �7�6s
�7 
erob�6 0 efrom eFroms �5�4�3
�5 
errt�4 
0 eto eTo�3  �> �= 
0 _error  �J 1   ���l �&W X  )��l�W X 
 *젡���+ 
� �2
}�1�0tu�/
�2 .���:RunTnull���     file�1 0 testfile testFile�0  t �.�-�,�+�*�. 0 testfile testFile�- 0 etext eText�, 0 enumber eNumber�+ 0 efrom eFrom�* 
0 eto eTou �)�(�'�&
��%�$�#�"v
��!� 
�) .���:TRPanull��� ��� null
�( 
psxp
�' 
strq
�& 
spac�% ,0 asposixpathparameter asPOSIXPathParameter
�$ 
alen
�# .sysoexecTEXT���     TEXT�" 0 etext eTextv ��w
� 
errn� 0 enumber eNumberw ��x
� 
erob� 0 efrom eFromx ���
� 
errt� 
0 eto eTo�  �! �  
0 _error  �/ 6 %*j  �,�,�%b  ��l+ �,%�fl W X  	*ꡢ���+ ascr  ��ޭ