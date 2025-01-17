FasdUAS 1.101.10   ��   ��    k             l      ��  ��    X R TestSupport -- handlers and constants used by TestTools's unit testing framework
     � 	 	 �   T e s t S u p p o r t   - -   h a n d l e r s   a n d   c o n s t a n t s   u s e d   b y   T e s t T o o l s ' s   u n i t   t e s t i n g   f r a m e w o r k 
   
  
 l     ��������  ��  ��        l     ��  ��    J D--------------------------------------------------------------------     �   � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -      l     ��  ��     
 constants     �      c o n s t a n t s      l     ��������  ��  ��        h     �� �� 0 novalue NoValue  l     ��  ��   HB used as unique placeholder to indicate an omitted value; since it's a script object, AS will compare for identity (i.e. is it the same object instance), not merely logical equality, so it can never be confused for a user-supplied value, though with the caveat that it can't go outside the current AS instance or be passed through a `copy` command as then it will be copied and thus no longer match -- TO DO: would it be safe enough just to use `�class ���!�` (no value placeholder)? (note: omitted parameters must use `�class ���!� as default parameter values must be literals)     �  �   u s e d   a s   u n i q u e   p l a c e h o l d e r   t o   i n d i c a t e   a n   o m i t t e d   v a l u e ;   s i n c e   i t ' s   a   s c r i p t   o b j e c t ,   A S   w i l l   c o m p a r e   f o r   i d e n t i t y   ( i . e .   i s   i t   t h e   s a m e   o b j e c t   i n s t a n c e ) ,   n o t   m e r e l y   l o g i c a l   e q u a l i t y ,   s o   i t   c a n   n e v e r   b e   c o n f u s e d   f o r   a   u s e r - s u p p l i e d   v a l u e ,   t h o u g h   w i t h   t h e   c a v e a t   t h a t   i t   c a n ' t   g o   o u t s i d e   t h e   c u r r e n t   A S   i n s t a n c e   o r   b e   p a s s e d   t h r o u g h   a   ` c o p y `   c o m m a n d   a s   t h e n   i t   w i l l   b e   c o p i e d   a n d   t h u s   n o   l o n g e r   m a t c h   - -   T O   D O :   w o u l d   i t   b e   s a f e   e n o u g h   j u s t   t o   u s e   ` � c l a s s   � � � ! � `   ( n o   v a l u e   p l a c e h o l d e r ) ?   ( n o t e :   o m i t t e d   p a r a m e t e r s   m u s t   u s e   ` � c l a s s   � � � ! �   a s   d e f a u l t   p a r a m e t e r   v a l u e s   m u s t   b e   l i t e r a l s )      l     ��������  ��  ��       !   j    
�� "�� 0 	_nostatus 	_NOSTATUS " m    	������ !  # $ # j    �� %�� 0 _success _SUCCESS % m    ����  $  & ' & j    �� (�� 0 _failure _FAILURE ( m    ����  '  ) * ) j    �� +�� 0 _broken _BROKEN + m    ����  *  , - , j    �� .�� 0 _skipped _SKIPPED . m    ����  -  / 0 / j    �� 1�� 0 
_skipsuite 
_SKIPSUITE 1 m    ���� 	 0  2 3 2 l     ��������  ��  ��   3  4 5 4 l     �� 6 7��   6 J D--------------------------------------------------------------------    7 � 8 8 � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 5  9 : 9 l     �� ; <��   ; t n expected/unexpected errors are trapped and their parameters stored in a 'caught error' record for portability    < � = = �   e x p e c t e d / u n e x p e c t e d   e r r o r s   a r e   t r a p p e d   a n d   t h e i r   p a r a m e t e r s   s t o r e d   i n   a   ' c a u g h t   e r r o r '   r e c o r d   f o r   p o r t a b i l i t y :  > ? > l     ��������  ��  ��   ?  @ A @ l      B C D B j    �� E�� $0 _caughterrortype _CaughtErrorType E m    ��
�� 
���� C2, the `class` property of error records passed to TestReport by `assert�` handlers; TestReport checks this record property to determine how to convert test data to its literal representation (unlike other records, which are converted wholesale, error info record properties are individually converted)    D � F FX   t h e   ` c l a s s `   p r o p e r t y   o f   e r r o r   r e c o r d s   p a s s e d   t o   T e s t R e p o r t   b y   ` a s s e r t & `   h a n d l e r s ;   T e s t R e p o r t   c h e c k s   t h i s   r e c o r d   p r o p e r t y   t o   d e t e r m i n e   h o w   t o   c o n v e r t   t e s t   d a t a   t o   i t s   l i t e r a l   r e p r e s e n t a t i o n   ( u n l i k e   o t h e r   r e c o r d s ,   w h i c h   a r e   c o n v e r t e d   w h o l e s a l e ,   e r r o r   i n f o   r e c o r d   p r o p e r t i e s   a r e   i n d i v i d u a l l y   c o n v e r t e d ) A  G H G l     ��������  ��  ��   H  I J I l     ��������  ��  ��   J  K L K i     M N M I      �� O���� .0 makecaughterrorrecord makeCaughtErrorRecord O  P Q P o      ���� 0 etext eText Q  R S R o      ���� 0 enumber eNumber S  T U T o      ���� 0 efrom eFrom U  V W V o      ���� 
0 eto eTo W  X�� X o      ���� 0 epartial ePartial��  ��   N L      Y Y K      Z Z �� [ \
�� 
pcls [ o    ���� $0 _caughterrortype _CaughtErrorType \ �� ] ^�� 0 errormessage errorMessage ] o    ���� 0 etext eText ^ �� _ `�� 0 errornumber errorNumber _ o   	 
���� 0 enumber eNumber ` �� a b�� 0 	fromvalue 	fromValue a o    ���� 0 efrom eFrom b �� c d�� 0 totype toType c o    ���� 
0 eto eTo d �� e���� 0 partialresult partialResult e o    ���� 0 epartial ePartial��   L  f g f l     ��������  ��  ��   g  h i h l     ��������  ��  ��   i  j k j j   ! ,�� l�� *0 _defaulterrorrecord _defaultErrorRecord l I   ! +�� m���� .0 makecaughterrorrecord makeCaughtErrorRecord m  n o n o   " #���� 0 novalue NoValue o  p q p o   # $���� 0 novalue NoValue q  r s r o   $ %���� 0 novalue NoValue s  t u t o   % &���� 0 novalue NoValue u  v�� v o   & '���� 0 novalue NoValue��  ��   k  w x w l     ��������  ��  ��   x  y z y l     ��������  ��  ��   z  { | { i  - 0 } ~ } I      �� ���� <0 normalizeexpectederrorrecord normalizeExpectedErrorRecord   ��� � o      ���� 0 errorrecord errorRecord��  ��   ~ l    @ � � � � k     @ � �  � � � l     �� � ���   � � � make sure errorRecord contains at least one valid property and no invalid ones (note: this uses NoValue placeholders so isn't suitable for sending out of current AS instance)    � � � �^   m a k e   s u r e   e r r o r R e c o r d   c o n t a i n s   a t   l e a s t   o n e   v a l i d   p r o p e r t y   a n d   n o   i n v a l i d   o n e s   ( n o t e :   t h i s   u s e s   N o V a l u e   p l a c e h o l d e r s   s o   i s n ' t   s u i t a b l e   f o r   s e n d i n g   o u t   o f   c u r r e n t   A S   i n s t a n c e ) �  � � � Z     � ����� � =      � � � n     � � � 1    ��
�� 
leng � o     ���� 0 errorrecord errorRecord � m    ����   � R    �� � �
�� .ascrerr ****      � **** � m     � � � � � | I n v a l i d    i s    p a r a m e t e r   ( e r r o r   r e c o r d   c o n t a i n e d   n o   p r o p e r t i e s ) . � �� � �
�� 
errn � m   
 �����Y � �� � �
�� 
erob � o    ���� 0 errorrecord errorRecord � �� ���
�� 
errt � m    ��
�� 
reco��  ��  ��   �  � � � r      � � � b     � � � o    ���� 0 errorrecord errorRecord � o    ���� *0 _defaulterrorrecord _defaultErrorRecord � o      ���� $0 normalizedrecord normalizedRecord �  � � � Z  ! = � ����� � >   ! , � � � n  ! $ � � � 1   " $��
�� 
leng � o   ! "���� $0 normalizedrecord normalizedRecord � n  $ + � � � 1   ) +��
�� 
leng � o   $ )���� *0 _defaulterrorrecord _defaultErrorRecord � R   / 9�� � �
�� .ascrerr ****      � **** � m   7 8 � � � � � � I n v a l i d    i s    p a r a m e t e r   ( e r r o r   r e c o r d   c o n t a i n e d   u n r e c o g n i z e d   p r o p e r t i e s ) . � �� � �
�� 
errn � m   1 2�����Y � �� � �
�� 
erob � o   3 4���� 0 errorrecord errorRecord � �� ���
�� 
errt � m   5 6��
�� 
reco��  ��  ��   �  ��� � L   > @ � � o   > ?���� $0 normalizedrecord normalizedRecord��   � i c ensure error info record has all the correct properties and that at least one of them is populated    � � � � �   e n s u r e   e r r o r   i n f o   r e c o r d   h a s   a l l   t h e   c o r r e c t   p r o p e r t i e s   a n d   t h a t   a t   l e a s t   o n e   o f   t h e m   i s   p o p u l a t e d |  � � � l     ��������  ��  ��   �  � � � l     ��������  ��  ��   �  � � � i  1 4 � � � I      � ��~� 20 formatcaughterrorrecord formatCaughtErrorRecord �  � � � o      �}�} 0 errorrecord errorRecord �  ��| � o      �{�{ 0 
lineindent 
lineIndent�|  �~   � k     � � �  � � � r      � � � m      � � � � �   � o      �z�z 0 	errortext 	errorText �  � � � l   �y � ��y   �jd TO DO: while fine for user-supplied 'expected error' records this is not ideal for formatting 'unexpected/incorrect' errors trapped by `on error...` clauses as AS populates unused error params with its own default values; thus all of the following will be included regardless; need to think about how to deal with that (not that there's an ideal solution)    � � � ��   T O   D O :   w h i l e   f i n e   f o r   u s e r - s u p p l i e d   ' e x p e c t e d   e r r o r '   r e c o r d s   t h i s   i s   n o t   i d e a l   f o r   f o r m a t t i n g   ' u n e x p e c t e d / i n c o r r e c t '   e r r o r s   t r a p p e d   b y   ` o n   e r r o r . . . `   c l a u s e s   a s   A S   p o p u l a t e s   u n u s e d   e r r o r   p a r a m s   w i t h   i t s   o w n   d e f a u l t   v a l u e s ;   t h u s   a l l   o f   t h e   f o l l o w i n g   w i l l   b e   i n c l u d e d   r e g a r d l e s s ;   n e e d   t o   t h i n k   a b o u t   h o w   t o   d e a l   w i t h   t h a t   ( n o t   t h a t   t h e r e ' s   a n   i d e a l   s o l u t i o n ) �  � � � Z    � ��x�w � >    � � � n    � � � o    �v�v 0 errornumber errorNumber � o    �u�u 0 errorrecord errorRecord � o    �t�t 0 novalue NoValue � r     � � � b     � � � b     � � � b     � � � o    �s�s 0 	errortext 	errorText � m     � � � � �  ( � n    � � � o    �r�r 0 errornumber errorNumber � o    �q�q 0 errorrecord errorRecord � m     � � � � �  )   � o      �p�p 0 	errortext 	errorText�x  �w   �  � � � Z    7 � ��o�n � >    ) � � � n    # � � � o   ! #�m�m 0 errormessage errorMessage � o     !�l�l 0 errorrecord errorRecord � o   # (�k�k 0 novalue NoValue � r   , 3 � � � b   , 1 � � � o   , -�j�j 0 	errortext 	errorText � n  - 0 � � � o   . 0�i�i 0 errormessage errorMessage � o   - .�h�h 0 errorrecord errorRecord � o      �g�g 0 	errortext 	errorText�o  �n   �  � � � Z  8 U � ��f�e � >  8 A � � � n  8 ; � � � o   9 ;�d�d 0 	fromvalue 	fromValue � o   8 9�c�c 0 errorrecord errorRecord � o   ; @�b�b 0 novalue NoValue � r   D Q � � � b   D O � � � b   D K �  � b   D I b   D G o   D E�a�a 0 	errortext 	errorText 1   E F�`
�` 
lnfd o   G H�_�_ 0 
lineindent 
lineIndent  m   I J �                       f r o m :   � n  K N o   L N�^�^ 0 	fromvalue 	fromValue o   K L�]�] 0 errorrecord errorRecord � o      �\�\ 0 	errortext 	errorText�f  �e   � 	
	 Z  V s�[�Z >  V _ n  V Y o   W Y�Y�Y 0 totype toType o   V W�X�X 0 errorrecord errorRecord o   Y ^�W�W 0 novalue NoValue r   b o b   b m b   b i b   b g b   b e o   b c�V�V 0 	errortext 	errorText 1   c d�U
�U 
lnfd o   e f�T�T 0 
lineindent 
lineIndent m   g h �                           t o :   n  i l o   j l�S�S 0 totype toType o   i j�R�R 0 errorrecord errorRecord o      �Q�Q 0 	errortext 	errorText�[  �Z  
   Z  t �!"�P�O! >  t }#$# n  t w%&% o   u w�N�N 0 partialresult partialResult& o   t u�M�M 0 errorrecord errorRecord$ o   w |�L�L 0 novalue NoValue" r   � �'(' b   � �)*) b   � �+,+ b   � �-.- b   � �/0/ o   � ��K�K 0 	errortext 	errorText0 1   � ��J
�J 
lnfd. o   � ��I�I 0 
lineindent 
lineIndent, m   � �11 �22   p a r t i a l   r e s u l t :  * n  � �343 o   � ��H�H 0 partialresult partialResult4 o   � ��G�G 0 errorrecord errorRecord( o      �F�F 0 	errortext 	errorText�P  �O    5�E5 L   � �66 o   � ��D�D 0 	errortext 	errorText�E   � 787 l     �C�B�A�C  �B  �A  8 9:9 l     �@�?�>�@  �?  �>  : ;<; i  5 8=>= I      �=?�<�= 0 istype isType? @A@ o      �;�; 0 thevalue theValueA B�:B o      �9�9 0 typename typeName�:  �<  > L     CC >     DED l    	F�8�7F I    	�6GH
�6 .corecnte****       ****G J     II J�5J o     �4�4 0 thevalue theValue�5  H �3K�2
�3 
koclK o    �1�1 0 typename typeName�2  �8  �7  E m   	 
�0�0  < LML l     �/�.�-�/  �.  �-  M NON l     �,�+�*�,  �+  �*  O PQP l     �)RS�)  R J D--------------------------------------------------------------------   S �TT � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -Q UVU l     �(WX�(  W "  `assert test error` support   X �YY 8   ` a s s e r t   t e s t   e r r o r `   s u p p o r tV Z[Z l     �'�&�%�'  �&  �%  [ \]\ i  9 <^_^ I      �$`�#�$ (0 sanitizeidentifier sanitizeIdentifier` a�"a o      �!�! 0 aname aName�"  �#  _ P     ubcdb k    tee fgf Z   hi� �h =   jkj o    �� 0 aname aNamek m    ll �mm  i L    nn m    oo �pp  | |�   �  g qrq r    sts m    uu �vv  t o      �� 0 res  r wxw r    yzy m    {{ �|| 6 a b c d e f g h i j k l m n o p q r s t u v w x y z _z o      �� 0 
legalchars 
legalCharsx }~} r    � m    �
� boovfals� o      �� 0 usepipes usePipes~ ��� X    a���� k   . \�� ��� r   . 3��� n  . 1��� 1   / 1�
� 
pcnt� o   . /�� 0 charref charRef� o      �� 0 c  � ��� Z   4 R����� H   4 8�� E  4 7��� o   4 5�� 0 
legalchars 
legalChars� o   5 6�� 0 c  � k   ; N�� ��� r   ; >��� m   ; <�
� boovtrue� o      �� 0 usepipes usePipes� ��� Z  ? N����� E  ? B��� m   ? @�� ���  \ |� o   @ A�� 0 c  � r   E J��� b   E H��� m   E F�� ���  \� o   F G�� 0 c  � o      �
�
 0 c  �  �  �  �  �  � ��� r   S X��� b   S V��� o   S T�	�	 0 res  � o   T U�� 0 c  � o      �� 0 res  � ��� r   Y \��� m   Y Z�� ��� J a b c d e f g h i j k l m n o p q r s t u v w x y z _ 1 2 3 4 5 6 7 8 9 0� o      �� 0 
legalchars 
legalChars�  � 0 charref charRef� o   ! "�� 0 aname aName� ��� Z  b q����� o   b c�� 0 usepipes usePipes� r   f m��� b   f k��� b   f i��� m   f g�� ���  |� o   g h� �  0 res  � m   i j�� ���  |� o      ���� 0 res  �  �  � ���� L   r t�� o   r s���� 0 res  ��  c ���
�� consdiac� ���
�� conshyph� ���
�� conspunc� ����
�� conswhit��  d ���
�� conscase� ����
�� consnume��  ] ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� i  = @��� I      �������  0 maketestobject makeTestObject� ��� o      ���� 0 suiteobject suiteObject� ���� o      ���� 0 handlername handlerName��  ��  � l    $���� k     $�� ��� r     ��� I    �����
�� .sysodsct****        scpt� b     ��� b     ��� b     ��� b     
��� m     �� ��� 8 o n   r u n  	 	 	 	 	 	 	 	 	 	 	 	 	 	 s c r i p t  � I    	������� (0 sanitizeidentifier sanitizeIdentifier� ���� b    ��� m    �� ���  T e s t O b j e c t _� o    ���� 0 handlername handlerName��  ��  � m   
 �� ��� � 
 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 p r o p e r t y   _ s u i t e O b j e c t   :   m i s s i n g   v a l u e  	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 t o   d o T e s t ( )  	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 _ s u i t e O b j e c t ' s  � I    ������� (0 sanitizeidentifier sanitizeIdentifier� ���� o    ���� 0 handlername handlerName��  ��  � m    �� ��� � ( ) 
 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 r e t u r n  	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 e n d   d o T e s t  	 	 	 	 	 	 	 	 	 	 	 	 	 	 e n d   s c r i p t 
 	 	 	 	 	 	 	 	 	 	 	 	 	 e n d   r u n��  � o      ���� 0 
testobject 
testObject� ��� r    !��� o    ���� 0 suiteobject suiteObject� n     ��� o     ���� 0 _suiteobject _suiteObject� o    ���� 0 
testobject 
testObject� ���� L   " $�� o   " #���� 0 
testobject 
testObject��  � ( " used to call `test_NAME` handlers   � ��� D   u s e d   t o   c a l l   ` t e s t _ N A M E `   h a n d l e r s� ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� i  A D��� I      �� ����  0 makecallobject makeCallObject   o      ���� 0 handlername handlerName �� o      ����  0 parametercount parameterCount��  ��  � l    ] k     ] 	 r     

 m      �   o      ���� 0 args  	  Z    >�� =     o    ����  0 parametercount parameterCount m    ����  r   
  m   
  �  p a r a m e t e r O b j e c t o      ���� 0 args    ?     o    ����  0 parametercount parameterCount m    ����  �� k    :   Y    ,!��"#��! r     '$%$ b     %&'& b     #()( o     !���� 0 args  ) m   ! "** �++ 2 ,   p a r a m e t e r O b j e c t ' s   i t e m  ' o   # $���� 0 i  % o      ���� 0 args  �� 0 i  " m    ���� # o    ����  0 parametercount parameterCount��    ,��, r   - :-.- n   - 8/0/ 7  . 8��12
�� 
ctxt1 m   2 4���� 2 m   5 7������0 o   - .���� 0 args  . o      ���� 0 args  ��  ��  ��   3��3 L   ? ]44 I  ? \��5��
�� .sysodsct****        scpt5 b   ? X676 b   ? V898 b   ? T:;: b   ? R<=< b   ? K>?> b   ? I@A@ m   ? @BB �CC 0 o n   r u n 
 	 	 	 	 	 	 	 	 	 	 s c r i p t  A I   @ H��D���� (0 sanitizeidentifier sanitizeIdentifierD E��E b   A DFGF m   A BHH �II  C a l l O b j e c t _G o   B C���� 0 handlername handlerName��  ��  ? m   I JJJ �KK � 
 	 	 	 	 	 	 	 	 	 	 	 o n   c a l l H a n d l e r ( s u i t e O b j e c t ,   p a r a m e t e r O b j e c t ) 
 	 	 	 	 	 	 	 	 	 	 	 	 r e t u r n   s u i t e O b j e c t ' s  = I   K Q��L���� (0 sanitizeidentifier sanitizeIdentifierL M��M o   L M���� 0 handlername handlerName��  ��  ; m   R SNN �OO  (9 o   T U���� 0 args  7 m   V WPP �QQ l ) 
 	 	 	 	 	 	 	 	 	 	 	 e n d 
 	 	 	 	 	 	 	 	 	 	 e n d   s c r i p t 
 	 	 	 	 	 	 	 	 	 e n d   r u n��  ��   ( " used to call `call_NAME` handlers    �RR D   u s e d   t o   c a l l   ` c a l l _ N A M E `   h a n d l e r s� STS l     ��������  ��  ��  T UVU l     ��������  ��  ��  V WXW l     ��YZ��  Y J D--------------------------------------------------------------------   Z �[[ � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -X \]\ l     ��^_��  ^   report generation   _ �`` $   r e p o r t   g e n e r a t i o n] aba l     ��������  ��  ��  b cdc i  E Hefe I      ��g���� 0 replacetext replaceTextg hih o      ���� 0 thetext theTexti jkj o      ���� 0 findtext findTextk l��l o      ���� 0 replacetext replaceText��  ��  f k     mm non r     pqp o     ���� 0 findtext findTextq n     rsr 1    ��
�� 
txdls 1    ��
�� 
ascro tut r    vwv n    	xyx 2   	��
�� 
citmy o    ���� 0 thetext theTextw o      ���� 0 	textitems 	textItemsu z{z r    |}| o    ���� 0 replacetext replaceText} n     ~~ 1    ��
�� 
txdl 1    ��
�� 
ascr{ ���� L    �� c    ��� o    ���� 0 thetext theText� m    ��
�� 
ctxt��  d ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� i  I L��� I      ������� $0 formatinvisibles formatInvisibles� ��� o      ���� 0 thetext theText� ���� o      ���� 0 linewrap lineWrap��  ��  � l    ���� k     �� ��� l     ������  �1+ TO DO: what about other invisibles? (problem: AS syntax doesn't provide escape sequences for control chars and other invisibles, so would need to use fake escapes, e.g. `\(0x00)`, `\(CODEPOINT)`; one possibility would be to extend `format text` to take `$(CODEPOINT)` escapes, then use that syntax)   � ���V   T O   D O :   w h a t   a b o u t   o t h e r   i n v i s i b l e s ?   ( p r o b l e m :   A S   s y n t a x   d o e s n ' t   p r o v i d e   e s c a p e   s e q u e n c e s   f o r   c o n t r o l   c h a r s   a n d   o t h e r   i n v i s i b l e s ,   s o   w o u l d   n e e d   t o   u s e   f a k e   e s c a p e s ,   e . g .   ` \ ( 0 x 0 0 ) ` ,   ` \ ( C O D E P O I N T ) ` ;   o n e   p o s s i b i l i t y   w o u l d   b e   t o   e x t e n d   ` f o r m a t   t e x t `   t o   t a k e   ` $ ( C O D E P O I N T ) `   e s c a p e s ,   t h e n   u s e   t h a t   s y n t a x )� ���� L     �� I     ������� 0 replacetext replaceText� ��� I    ������� 0 replacetext replaceText� ��� I    
���~� 0 replacetext replaceText� ��� o    �}�} 0 thetext theText� ��� 1    �|
�| 
tab � ��{� m    �� ���  \ t�{  �~  � ��� 1   
 �z
�z 
lnfd� ��y� b    ��� m    �� ���  \ n� o    �x�x 0 linewrap lineWrap�y  ��  � ��� o    �w
�w 
ret � ��v� b    ��� m    �� ���  \ r� o    �u�u 0 linewrap lineWrap�v  ��  ��  � %  linewrap = linefeed + N spaces   � ��� >   l i n e w r a p   =   l i n e f e e d   +   N   s p a c e s� ��� l     �t�s�r�t  �s  �r  � ��� l     �q�p�o�q  �p  �o  � ��� i  M P��� I      �n��m�n 0 linewrap lineWrap� ��� o      �l�l 0 thetext theText� ��k� o      �j�j 0 towidth toWidth�k  �m  � l    ���� L     �� o     �i�i 0 thetext theText� � � TO DO: implement; this should wrap on whole words, where practical (to keep it simple, theText should avoid using VT100 sequences, otherwise those will have to be detected and ignored when counting number of characters in line)   � ����   T O   D O :   i m p l e m e n t ;   t h i s   s h o u l d   w r a p   o n   w h o l e   w o r d s ,   w h e r e   p r a c t i c a l   ( t o   k e e p   i t   s i m p l e ,   t h e T e x t   s h o u l d   a v o i d   u s i n g   V T 1 0 0   s e q u e n c e s ,   o t h e r w i s e   t h o s e   w i l l   h a v e   t o   b e   d e t e c t e d   a n d   i g n o r e d   w h e n   c o u n t i n g   n u m b e r   o f   c h a r a c t e r s   i n   l i n e )� ��� l     �h�g�f�h  �g  �f  � ��� l     �e�d�c�e  �d  �c  � ��� i  Q T��� I      �b��a�b 0 vt100 VT100� ��`� o      �_�_ 0 
formatcode 
formatCode�`  �a  � k     �� ��� l      �^���^  �F@ Returns a magic character sequence that will apply the specified formatting or other control operation in Terminal.app and other VT100 terminal emulators. Multiple codes may be given as semicolon-separated numeric text, e.g. "1;7". Commonly used style codes are:
	
		0 = reset/normal
		1 = bold
		2 = faint
		4 = underline
		5 = blink
		7 = negative
		8 = conceal
		30-37 = foreground colors (black, red, green, yellow, blue, magenta, cyan, white)
		38;5;N = xterm-256 foreground colors (N = 0-255)
		39 = default foreground color
		40-49 = background colors (as for 30-39)
	   � ����   R e t u r n s   a   m a g i c   c h a r a c t e r   s e q u e n c e   t h a t   w i l l   a p p l y   t h e   s p e c i f i e d   f o r m a t t i n g   o r   o t h e r   c o n t r o l   o p e r a t i o n   i n   T e r m i n a l . a p p   a n d   o t h e r   V T 1 0 0   t e r m i n a l   e m u l a t o r s .   M u l t i p l e   c o d e s   m a y   b e   g i v e n   a s   s e m i c o l o n - s e p a r a t e d   n u m e r i c   t e x t ,   e . g .   " 1 ; 7 " .   C o m m o n l y   u s e d   s t y l e   c o d e s   a r e : 
 	 
 	 	 0   =   r e s e t / n o r m a l 
 	 	 1   =   b o l d 
 	 	 2   =   f a i n t 
 	 	 4   =   u n d e r l i n e 
 	 	 5   =   b l i n k 
 	 	 7   =   n e g a t i v e 
 	 	 8   =   c o n c e a l 
 	 	 3 0 - 3 7   =   f o r e g r o u n d   c o l o r s   ( b l a c k ,   r e d ,   g r e e n ,   y e l l o w ,   b l u e ,   m a g e n t a ,   c y a n ,   w h i t e ) 
 	 	 3 8 ; 5 ; N   =   x t e r m - 2 5 6   f o r e g r o u n d   c o l o r s   ( N   =   0 - 2 5 5 ) 
 	 	 3 9   =   d e f a u l t   f o r e g r o u n d   c o l o r 
 	 	 4 0 - 4 9   =   b a c k g r o u n d   c o l o r s   ( a s   f o r   3 0 - 3 9 ) 
 	� ��]� L     �� b     ��� b     	��� b     ��� l    ��\�[� 5     �Z��Y
�Z 
cha � m    �X�X 
�Y kfrmID  �\  �[  � m    �� ���  [� o    �W�W 0 
formatcode 
formatCode� m   	 
�� ���  m�]  � ��� l     �V�U�T�V  �U  �T  � ��� l     �S�R�Q�S  �R  �Q  � ��� l     �P���P  �  -----   � ��� 
 - - - - -� ��� l     �O�N�M�O  �N  �M  � ��� i  U X��� I      �L��K�L  0 maketestreport makeTestReport� ��� o      �J�J 0 testsuitename testSuiteName� ��� o      �I�I "0 testhandlername testHandlerName� ��H� o      �G�G 0 terminalwidth terminalWidth�H  �K  � k     w�� ��� l    � � r      J       m      �          	�F	 m    

 �             �F   J        o      �E�E 0 indent1   �D o      �C�C 0 indent2  �D    l f indent to bullet, indent to wrapped bulleted lines; TO DO: ideally pass initial indent from `osatest`    � �   i n d e n t   t o   b u l l e t ,   i n d e n t   t o   w r a p p e d   b u l l e t e d   l i n e s ;   T O   D O :   i d e a l l y   p a s s   i n i t i a l   i n d e n t   f r o m   ` o s a t e s t `�  Z    k�B =     o    �A�A 0 terminalwidth terminalWidth m    �@�@�� k    .  r    * K    ( �?�? 0 n   m       �!!   �>"#�> 0 b  " m    $$ �%%  # �=&'�= 0 u  & m     (( �))  ' �<*+�< 0 r  * m   ! ",, �--  + �;./�; 0 g  . m   # $00 �11  / �:2�9�: 0 e  2 m   % &33 �44  �9   o      �8�8 0 vtstyle vtStyle 5�75 r   + .676 m   + ,�6
�6 boovfals7 o      �5�5 0 uselinewrap useLineWrap�7  �B   k   1 k88 9:9 r   1 g;<; K   1 e== �4>?�4 0 n  > I   2 8�3@�2�3 0 vt100 VT100@ A�1A m   3 4�0�0  �1  �2  ? �/BC�/ 0 b  B I   9 ?�.D�-�. 0 vt100 VT100D E�,E m   : ;�+�+ �,  �-  C �*FG�* 0 u  F I   @ H�)H�(�) 0 vt100 VT100H I�'I m   A D�&�& �'  �(  G �%JK�% 0 r  J I   I Q�$L�#�$ 0 vt100 VT100L M�"M m   J MNN �OO  1 ; 3 1�"  �#  K �!PQ�! 0 g  P I   R Z� R��  0 vt100 VT100R S�S m   S VTT �UU  1 ; 3 2�  �  Q �V�� 0 e  V I   [ c�W�� 0 vt100 VT100W X�X m   \ _YY �ZZ  1 ; 3 4�  �  �  < o      �� 0 vtstyle vtStyle: [�[ r   h k\]\ m   h i�
� boovtrue] o      �� 0 uselinewrap useLineWrap�   ^�^ h   l w�_� 0 
testreport 
TestReport_ k      `` aba l     ����  �  �  b cdc l     �ef�  e � � TO DO: is it really necessary to record so much detail? all that's needed is assert count, plus whatever caused test to abort (if anything)   f �gg   T O   D O :   i s   i t   r e a l l y   n e c e s s a r y   t o   r e c o r d   s o   m u c h   d e t a i l ?   a l l   t h a t ' s   n e e d e d   i s   a s s e r t   c o u n t ,   p l u s   w h a t e v e r   c a u s e d   t e s t   t o   a b o r t   ( i f   a n y t h i n g )d hih l     ����  �  �  i jkj l     lmnl j     �o� 0 _testresults _testResultso J     �
�
  m c ] a single test_NAME handler may perform multiple asserts, the result of each is recorded here   n �pp �   a   s i n g l e   t e s t _ N A M E   h a n d l e r   m a y   p e r f o r m   m u l t i p l e   a s s e r t s ,   t h e   r e s u l t   o f   e a c h   i s   r e c o r d e d   h e r ek qrq l     �	���	  �  �  r sts i   uvu I      �w�� 0 
_addreport 
_addReportw xyx o      �� 0 outcometype outcomeTypey z{z o      �� 0 fromhandler fromHandler{ |}| o      ��  0 problemsummary problemSummary} ~~ o      �� 0 usernote userNote �� � o      ���� 0 testdata testData�   �  v l    ���� k     �� ��� l     ������  � ] W outcomeType indicates if test_NAME succeeded, failed, or aborted due to defective test   � ��� �   o u t c o m e T y p e   i n d i c a t e s   i f   t e s t _ N A M E   s u c c e e d e d ,   f a i l e d ,   o r   a b o r t e d   d u e   t o   d e f e c t i v e   t e s t� ��� l     ������  � W Q userNote is any additional info passed by `assert�` for inclusion in test report   � ��� �   u s e r N o t e   i s   a n y   a d d i t i o n a l   i n f o   p a s s e d   b y   ` a s s e r t & `   f o r   i n c l u s i o n   i n   t e s t   r e p o r t� ��� l     ������  � � � testData is record of form {expectedResult:�, expectedError:�, actualResult:�, actualError:�}, unused properties should be omitted -- TO DO: make this a key-value list (easier to read, reformat, and render)   � ����   t e s t D a t a   i s   r e c o r d   o f   f o r m   { e x p e c t e d R e s u l t : & ,   e x p e c t e d E r r o r : & ,   a c t u a l R e s u l t : & ,   a c t u a l E r r o r : & } ,   u n u s e d   p r o p e r t i e s   s h o u l d   b e   o m i t t e d   - -   T O   D O :   m a k e   t h i s   a   k e y - v a l u e   l i s t   ( e a s i e r   t o   r e a d ,   r e f o r m a t ,   a n d   r e n d e r )� ��� r     ��� K     �� ������ 0 outcometype outcomeType� o    ���� 0 outcometype outcomeType� ������ 0 fromhandler fromHandler� o    ���� 0 fromhandler fromHandler� ������  0 problemsummary problemSummary� o    ����  0 problemsummary problemSummary� ������ 0 usernote userNote� o    ���� 0 usernote userNote� ������� 0 testdata testData� o   	 
���� 0 testdata testData��  � n      ���  ;    � o    ���� 0 _testresults _testResults� ���� l   ������  �  log result -- DEBUG   � ��� & l o g   r e s u l t   - -   D E B U G��  � � � TO DO: include param for indicating cause (`assert test result` received wrong result, `assert test error` received wrong/no error, unexpected error in `test_NAME` handler, etc)   � ���d   T O   D O :   i n c l u d e   p a r a m   f o r   i n d i c a t i n g   c a u s e   ( ` a s s e r t   t e s t   r e s u l t `   r e c e i v e d   w r o n g   r e s u l t ,   ` a s s e r t   t e s t   e r r o r `   r e c e i v e d   w r o n g / n o   e r r o r ,   u n e x p e c t e d   e r r o r   i n   ` t e s t _ N A M E `   h a n d l e r ,   e t c )t ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� i   ��� I      ������� 0 
addsuccess 
addSuccess� ��� o      ���� 0 fromhandler fromHandler� ��� o      ���� 0 usernote userNote� ���� o      ���� 0 testdata testData��  ��  � I     ������� 0 
_addreport 
_addReport� ��� o    ���� 0 _success _SUCCESS� ��� o    ���� 0 fromhandler fromHandler� ��� m    �� ���  � ��� o    	���� 0 usernote userNote� ���� o   	 
���� 0 testdata testData��  ��  � ��� l     ��������  ��  ��  � ��� i   ��� I      ������� 0 
addskipped 
addSkipped� ��� o      ���� 0 fromhandler fromHandler� ���� o      ���� 0 usernote userNote��  ��  � k     �� ��� Z    ������� =    ��� o     ���� 0 usernote userNote� m    �� ���  � r    	��� m    �� ��� @ s k i p p e d   b y    c o n f i g u r e _ s k i p T e s t s � o      ���� 0 usernote userNote��  ��  � ���� I    ������� 0 
_addreport 
_addReport� ��� o    ���� 0 _skipped _SKIPPED� ��� o    ���� 0 fromhandler fromHandler� ��� m    �� ���  � ��� o    ���� 0 usernote userNote� ���� J    ����  ��  ��  ��  � ��� l     ��������  ��  ��  � ��� i   ��� I      ������� 0 	skipsuite 	skipSuite� ���� o      ���� 0 usernote userNote��  ��  � l    ���� k     �� ��� Z    ������� =    ��� o     ���� 0 usernote userNote� m    �� ���  � r    	��� m    �� �   @ s k i p p e d   b y    c o n f i g u r e _ s k i p T e s t s � o      ���� 0 usernote userNote��  ��  � �� I    ������ 0 
_addreport 
_addReport  o    ���� 0 
_skipsuite 
_SKIPSUITE  m     �   	
	 m     �  
  o    ���� 0 usernote userNote �� J    ����  ��  ��  ��  � Q K once called, `osatest` will skip this and all remaining tests in the suite   � � �   o n c e   c a l l e d ,   ` o s a t e s t `   w i l l   s k i p   t h i s   a n d   a l l   r e m a i n i n g   t e s t s   i n   t h e   s u i t e�  l     ��������  ��  ��    i    I      ������ 0 
addfailure 
addFailure  o      ���� 0 fromhandler fromHandler  o      ����  0 problemsummary problemSummary  o      ���� 0 usernote userNote �� o      ���� 0 testdata testData��  ��   I     ������ 0 
_addreport 
_addReport  !  o    ���� 0 _failure _FAILURE! "#" o    ���� 0 fromhandler fromHandler# $%$ o    ����  0 problemsummary problemSummary% &'& o    	���� 0 usernote userNote' (��( o   	 
���� 0 testdata testData��  ��   )*) l     ��������  ��  ��  * +,+ i   -.- I      ��/���� 0 	addbroken 	addBroken/ 010 o      ���� 0 fromhandler fromHandler1 232 o      ����  0 problemsummary problemSummary3 454 o      ���� 0 usernote userNote5 6��6 o      ���� 0 testdata testData��  ��  . I     ��7���� 0 
_addreport 
_addReport7 898 o    ���� 0 _broken _BROKEN9 :;: o    ���� 0 fromhandler fromHandler; <=< o    ����  0 problemsummary problemSummary= >?> o    	���� 0 usernote userNote? @��@ o   	 
���� 0 testdata testData��  ��  , ABA l     ��������  ��  ��  B CDC l     ��EF��  E  -----   F �GG 
 - - - - -D HIH l     ��JK��  J�� note: Converting AS objects to their literal representations requires some hoop-jumping: it's impractical for `perform unit test` to format test results on the fly as `osatest` doesn't have an event loop so sending itself AEs while the script is executing might be a tad fiddly. Instead, TestReport just captures everything in its _testResults property and is returned by `perform unit test` on completion (ensuring the captured data stays inside an AS context, so that e.g. application references don't lose their target application as happens when they're packed into an AE as a naked typeObjectSpecifier descriptor). `osaglue` must then repeatedly call the nextRawData() iterator via OSAExecuteEvent, which loads the result value directly into a new scriptValueID; that value's literal representation can then be retrieved via OSADisplay and the resulting text passed back to TestReport's updateRawData(), which reinserts it into the original _testResults data. Once the iterator is exhausted, `osatest` can then call TestReport's renderReport() to assemble all that information (which is now all concatenatable text values) into the final report text, which `osatext` can then print to stdout before doing the whole exercise all over again for the next test handler.   K �LL	�   n o t e :   C o n v e r t i n g   A S   o b j e c t s   t o   t h e i r   l i t e r a l   r e p r e s e n t a t i o n s   r e q u i r e s   s o m e   h o o p - j u m p i n g :   i t ' s   i m p r a c t i c a l   f o r   ` p e r f o r m   u n i t   t e s t `   t o   f o r m a t   t e s t   r e s u l t s   o n   t h e   f l y   a s   ` o s a t e s t `   d o e s n ' t   h a v e   a n   e v e n t   l o o p   s o   s e n d i n g   i t s e l f   A E s   w h i l e   t h e   s c r i p t   i s   e x e c u t i n g   m i g h t   b e   a   t a d   f i d d l y .   I n s t e a d ,   T e s t R e p o r t   j u s t   c a p t u r e s   e v e r y t h i n g   i n   i t s   _ t e s t R e s u l t s   p r o p e r t y   a n d   i s   r e t u r n e d   b y   ` p e r f o r m   u n i t   t e s t `   o n   c o m p l e t i o n   ( e n s u r i n g   t h e   c a p t u r e d   d a t a   s t a y s   i n s i d e   a n   A S   c o n t e x t ,   s o   t h a t   e . g .   a p p l i c a t i o n   r e f e r e n c e s   d o n ' t   l o s e   t h e i r   t a r g e t   a p p l i c a t i o n   a s   h a p p e n s   w h e n   t h e y ' r e   p a c k e d   i n t o   a n   A E   a s   a   n a k e d   t y p e O b j e c t S p e c i f i e r   d e s c r i p t o r ) .   ` o s a g l u e `   m u s t   t h e n   r e p e a t e d l y   c a l l   t h e   n e x t R a w D a t a ( )   i t e r a t o r   v i a   O S A E x e c u t e E v e n t ,   w h i c h   l o a d s   t h e   r e s u l t   v a l u e   d i r e c t l y   i n t o   a   n e w   s c r i p t V a l u e I D ;   t h a t   v a l u e ' s   l i t e r a l   r e p r e s e n t a t i o n   c a n   t h e n   b e   r e t r i e v e d   v i a   O S A D i s p l a y   a n d   t h e   r e s u l t i n g   t e x t   p a s s e d   b a c k   t o   T e s t R e p o r t ' s   u p d a t e R a w D a t a ( ) ,   w h i c h   r e i n s e r t s   i t   i n t o   t h e   o r i g i n a l   _ t e s t R e s u l t s   d a t a .   O n c e   t h e   i t e r a t o r   i s   e x h a u s t e d ,   ` o s a t e s t `   c a n   t h e n   c a l l   T e s t R e p o r t ' s   r e n d e r R e p o r t ( )   t o   a s s e m b l e   a l l   t h a t   i n f o r m a t i o n   ( w h i c h   i s   n o w   a l l   c o n c a t e n a t a b l e   t e x t   v a l u e s )   i n t o   t h e   f i n a l   r e p o r t   t e x t ,   w h i c h   ` o s a t e x t `   c a n   t h e n   p r i n t   t o   s t d o u t   b e f o r e   d o i n g   t h e   w h o l e   e x e r c i s e   a l l   o v e r   a g a i n   f o r   t h e   n e x t   t e s t   h a n d l e r .I MNM l     ��������  ��  ��  N OPO l     ��QR��  Q } w{class:error info record, errorMessage:eText, errorNumber:eNumber, fromValue:eFrom, toType:eTo, partialResult:ePartial}   R �SS � { c l a s s : e r r o r   i n f o   r e c o r d ,   e r r o r M e s s a g e : e T e x t ,   e r r o r N u m b e r : e N u m b e r ,   f r o m V a l u e : e F r o m ,   t o T y p e : e T o ,   p a r t i a l R e s u l t : e P a r t i a l }P TUT j    ��V�� $0 _errorrecordrefs _errorRecordRefsV J    ����  U WXW j     "��Y�� 0 
_dataindex 
_dataIndexY m     !���� X Z[Z j   # %��\�� 0 _datasubindex _dataSubIndex\ m   # $�� [ ]^] l     �~�}�|�~  �}  �|  ^ _`_ i  & )aba I      �{�z�y�{ 0 nextrawdata  �z  �y  b l   cdec k    ff ghg l     �xij�x  i g a note: while most of these values can be dealt with natively, for now just toss them to formatter   j �kk �   n o t e :   w h i l e   m o s t   o f   t h e s e   v a l u e s   c a n   b e   d e a l t   w i t h   n a t i v e l y ,   f o r   n o w   j u s t   t o s s   t h e m   t o   f o r m a t t e rh lml l     �wno�w  n D > TO DO: need to see what happens when ocids/optrs are returned   o �pp |   T O   D O :   n e e d   t o   s e e   w h a t   h a p p e n s   w h e n   o c i d s / o p t r s   a r e   r e t u r n e dm qrq Z    st�v�us B     uvu o     �t�t 0 
_dataindex 
_dataIndexv n   wxw 1   
 �s
�s 
lengx o    
�r�r 0 _testresults _testResultst k   yy z{z l   �q|}�q  | 4 . currently working way through an error record   } �~~ \   c u r r e n t l y   w o r k i n g   w a y   t h r o u g h   a n   e r r o r   r e c o r d{ � Z    n���p�o� >   ��� o    �n�n $0 _errorrecordrefs _errorRecordRefs� J    �m�m  � k    j�� ��� r    '��� n    %��� 1   # %�l
�l 
pcnt� n    #��� 4    #�k�
�k 
cobj� m   ! "�j�j � o     �i�i $0 _errorrecordrefs _errorRecordRefs� o      �h�h 0 	erroritem 	errorItem� ��� Z   ( g���g�f� =  ( /��� o   ( )�e�e 0 	erroritem 	errorItem� o   ) .�d�d 0 novalue NoValue� k   2 c�� ��� r   2 ?��� n   2 9��� 1   7 9�c
�c 
rest� o   2 7�b�b $0 _errorrecordrefs _errorRecordRefs� o      �a�a $0 _errorrecordrefs _errorRecordRefs� ��� Z  @ \���`�_� =  @ H��� o   @ E�^�^ $0 _errorrecordrefs _errorRecordRefs� J   E G�]�]  � r   K X��� [   K R��� o   K P�\�\ 0 _datasubindex _dataSubIndex� m   P Q�[�[ � o      �Z�Z 0 _datasubindex _dataSubIndex�`  �_  � ��Y� L   ] c�� I   ] b�X�W�V�X 0 nextrawdata  �W  �V  �Y  �g  �f  � ��U� L   h j�� o   h i�T�T 0 	erroritem 	errorItem�U  �p  �o  � ��� r   o ��� n   o }��� o   { }�S�S 0 testdata testData� n   o {��� 4   t {�R�
�R 
cobj� o   u z�Q�Q 0 
_dataindex 
_dataIndex� o   o t�P�P 0 _testresults _testResults� o      �O�O 0 datalist dataList� ��N� Z   ����M�� B   � ���� o   � ��L�L 0 _datasubindex _dataSubIndex� n  � ���� 1   � ��K
�K 
leng� o   � ��J�J 0 datalist dataList� k   � ��� ��� l  � ��I���I  � 4 .	log {"NEXT:", item _dataSubIndex of dataList}   � ��� \ 	 l o g   { " N E X T : " ,   i t e m   _ d a t a S u b I n d e x   o f   d a t a L i s t }� ��� r   � ���� n   � ���� 4   � ��H�
�H 
cobj� m   � ��G�G � n   � ���� 4   � ��F�
�F 
cobj� o   � ��E�E 0 _datasubindex _dataSubIndex� o   � ��D�D 0 datalist dataList� o      �C�C 0 thedata theData� ��� Z   � ����B�A� F   � ���� I   � ��@��?�@ 0 istype isType� ��� o   � ��>�> 0 thedata theData� ��=� m   � ��<
�< 
reco�=  �?  � =  � ���� n  � ���� m   � ��;
�; 
pcls� o   � ��:�: 0 thedata theData� o   � ��9�9 $0 _caughterrortype _CaughtErrorType� k   � ��� ��� r   � ���� J   � ��� ��� N   � ��� n   � ���� o   � ��8�8 0 errormessage errorMessage� o   � ��7�7 0 thedata theData� ��� l 	 � ���6�5� N   � ��� n   � ���� o   � ��4�4 0 errornumber errorNumber� o   � ��3�3 0 thedata theData�6  �5  � ��� N   � ��� n   � ���� o   � ��2�2 0 	fromvalue 	fromValue� o   � ��1�1 0 thedata theData� ��� l 	 � ���0�/� N   � ��� n   � ���� o   � ��.�. 0 totype toType� o   � ��-�- 0 thedata theData�0  �/  � ��,� N   � ��� n   � ���� o   � ��+�+ 0 partialresult partialResult� o   � ��*�* 0 thedata theData�,  � o      �)�) $0 _errorrecordrefs _errorRecordRefs� ��(� L   � ��� I   � ��'�&�%�' 0 nextrawdata  �&  �%  �(  �B  �A  � ��$� L   � ��� o   � ��#�# 0 thedata theData�$  �M  � k   ��� ��� r   �    J   � �  [   � � o   � ��"�" 0 
_dataindex 
_dataIndex m   � ��!�!  �  m   � ��� �    J       	
	 o      �� 0 
_dataindex 
_dataIndex
 � o      �� 0 _datasubindex _dataSubIndex�  � � L   I  ���� 0 nextrawdata  �  �  �  �N  �v  �u  r � l  R  ��
� .ascrerr ****      � ****�   ��
� 
errn m  ��f�   1 + `osatest` will check for this error number    � V   ` o s a t e s t `   w i l l   c h e c k   f o r   t h i s   e r r o r   n u m b e r�  d ~ x repeatedly called by `osatest` when converting test data to literal representations; once exhausted, returns error 6502   e � �   r e p e a t e d l y   c a l l e d   b y   ` o s a t e s t `   w h e n   c o n v e r t i n g   t e s t   d a t a   t o   l i t e r a l   r e p r e s e n t a t i o n s ;   o n c e   e x h a u s t e d ,   r e t u r n s   e r r o r   6 5 0 2`  l     ����  �  �    i  * - I      ��� 0 updaterawdata   � o      �� 0 literaltext literalText�  �   l    p  k     p!! "#" Z     m$%�
&$ =    '(' o     �	�	 $0 _errorrecordrefs _errorRecordRefs( J    ��  % k    3)) *+* l   �,-�  , # log {"UPDATE:", _testResults}   - �.. : l o g   { " U P D A T E : " ,   _ t e s t R e s u l t s }+ /0/ r    %121 o    �� 0 literaltext literalText2 n      343 4   ! $�5
� 
cobj5 m   " #�� 4 n    !676 4    !�8
� 
cobj8 o     �� 0 _datasubindex _dataSubIndex7 n    9:9 o    �� 0 testdata testData: n    ;<; 4    � =
�  
cobj= o    ���� 0 
_dataindex 
_dataIndex< o    ���� 0 _testresults _testResults0 >��> r   & 3?@? [   & -ABA o   & +���� 0 _datasubindex _dataSubIndexB m   + ,���� @ o      ���� 0 _datasubindex _dataSubIndex��  �
  & k   6 mCC DED r   6 BFGF o   6 7���� 0 literaltext literalTextG n      HIH 1   ? A��
�� 
pcntI n   7 ?JKJ 4  < ?��L
�� 
cobjL m   = >���� K o   7 <���� $0 _errorrecordrefs _errorRecordRefsE MNM r   C POPO n   C JQRQ 1   H J��
�� 
restR o   C H���� $0 _errorrecordrefs _errorRecordRefsP o      ���� $0 _errorrecordrefs _errorRecordRefsN S��S Z  Q mTU����T =  Q YVWV o   Q V���� $0 _errorrecordrefs _errorRecordRefsW J   V X����  U r   \ iXYX [   \ cZ[Z o   \ a���� 0 _datasubindex _dataSubIndex[ m   a b���� Y o      ���� 0 _datasubindex _dataSubIndex��  ��  ��  # \��\ L   n p����  ��  a[ called by `osatest` to reinsert the raw data's literal representation; must be called after each nextRawData() (if formatting fails for any reason, use a placeholder, e.g. "�object�") -- TO DO: might be better to pass a boolean parameter along with literalText that indicates if the conversion failed; that way, reporter can decide what to insert     �]]�   c a l l e d   b y   ` o s a t e s t `   t o   r e i n s e r t   t h e   r a w   d a t a ' s   l i t e r a l   r e p r e s e n t a t i o n ;   m u s t   b e   c a l l e d   a f t e r   e a c h   n e x t R a w D a t a ( )   ( i f   f o r m a t t i n g   f a i l s   f o r   a n y   r e a s o n ,   u s e   a   p l a c e h o l d e r ,   e . g .   " � o b j e c t � " )   - -   T O   D O :   m i g h t   b e   b e t t e r   t o   p a s s   a   b o o l e a n   p a r a m e t e r   a l o n g   w i t h   l i t e r a l T e x t   t h a t   i n d i c a t e s   i f   t h e   c o n v e r s i o n   f a i l e d ;   t h a t   w a y ,   r e p o r t e r   c a n   d e c i d e   w h a t   t o   i n s e r t ^_^ l     ��������  ��  ��  _ `a` l     ��bc��  b  -----   c �dd 
 - - - - -a efe l     ��gh��  g y s once raw test data is converted to literal text, `osatest` calls `renderreport` to turn it all into printable text   h �ii �   o n c e   r a w   t e s t   d a t a   i s   c o n v e r t e d   t o   l i t e r a l   t e x t ,   ` o s a t e s t `   c a l l s   ` r e n d e r r e p o r t `   t o   t u r n   i t   a l l   i n t o   p r i n t a b l e   t e x tf jkj l     ��������  ��  ��  k lml i  . 1non I      �������� 0 renderreport  ��  ��  o l   �pqrp k    �ss tut r     vwv J     xx yzy m     ����  z {��{ o    ���� 0 	_nostatus 	_NOSTATUS��  w J      || }~} o      ���� 0 assertcount assertCount~ �� o      ���� 0 outcometype outcomeType��  u ��� X    \����� l  * W���� k   * W�� ��� l  * /���� r   * /��� n  * -��� 1   + -��
�� 
pcnt� o   * +���� 0 	reportref 	reportRef� o      ���� 0 reportrecord reportRecord� b \ {outcomeType:FLAG, fromHandler:NAME, problemSummary:TEXT, userNote:USERTEXT, testData:LIST}   � ��� �   { o u t c o m e T y p e : F L A G ,   f r o m H a n d l e r : N A M E ,   p r o b l e m S u m m a r y : T E X T ,   u s e r N o t e : U S E R T E X T ,   t e s t D a t a : L I S T }� ��� Z  0 A������� C   0 5��� n  0 3��� o   1 3���� 0 fromhandler fromHandler� o   0 1���� 0 reportrecord reportRecord� m   3 4�� ���  a s s e r t  � r   8 =��� [   8 ;��� o   8 9���� 0 assertcount assertCount� m   9 :���� � o      ���� 0 assertcount assertCount��  ��  � ��� r   B G��� n  B E��� o   C E���� 0 outcometype outcomeType� o   B C���� 0 reportrecord reportRecord� o      ���� 0 outcometype outcomeType� ���� l  H W���� Z  H W������� >  H O��� o   H I���� 0 outcometype outcomeType� o   I N���� 0 _success _SUCCESS�  S   R S��  ��  � y s note: can't think of a reason individual asserts should ever skip (it's normally suites/tests that skip), so break   � ��� �   n o t e :   c a n ' t   t h i n k   o f   a   r e a s o n   i n d i v i d u a l   a s s e r t s   s h o u l d   e v e r   s k i p   ( i t ' s   n o r m a l l y   s u i t e s / t e s t s   t h a t   s k i p ) ,   s o   b r e a k��  � � � note: there may be more than one error report (e.g. if assert fails then tearDown fails as well); for now, just format and return the first and ignore any remaining reports   � ���Z   n o t e :   t h e r e   m a y   b e   m o r e   t h a n   o n e   e r r o r   r e p o r t   ( e . g .   i f   a s s e r t   f a i l s   t h e n   t e a r D o w n   f a i l s   a s   w e l l ) ;   f o r   n o w ,   j u s t   f o r m a t   a n d   r e t u r n   t h e   f i r s t   a n d   i g n o r e   a n y   r e m a i n i n g   r e p o r t s�� 0 	reportref 	reportRef� n   ��� o    ���� 0 _testresults _testResults�  f    � ��� Z   ]������ =  ] d��� o   ] ^���� 0 outcometype outcomeType� o   ^ c���� 0 _success _SUCCESS� r   g ���� b   g ���� b   g ���� b   g z��� b   g x��� b   g p��� n  g n��� o   l n���� 0 g  � o   g l���� 0 vtstyle vtStyle� m   n o�� ���  O K� n  p w��� o   u w���� 0 n  � o   p u���� 0 vtstyle vtStyle� m   x y�� ���    ( p e r f o r m e d  � n   z ���� 1    ���
�� 
leng� o   z ���� 0 _testresults _testResults� m   � ��� ���    a s s e r t i o n s )� o      ���� 0 
reporttext 
reportText� ��� =  � ���� o   � ����� 0 outcometype outcomeType� o   � ����� 0 	_nostatus 	_NOSTATUS� ��� l  � ����� r   � ���� b   � ���� b   � ���� b   � ���� n  � ���� o   � ����� 0 e  � o   � ����� 0 vtstyle vtStyle� m   � ��� ���  S K I P P E D   T E S T� n  � ���� o   � ����� 0 n  � o   � ����� 0 vtstyle vtStyle� m   � ��� ��� 4   ( p e r f o r m e d   n o   a s s e r t i o n s )� o      ���� 0 
reporttext 
reportText� U O no asserts were performed, so test is marked as 'skipped' rather than 'passed'   � ��� �   n o   a s s e r t s   w e r e   p e r f o r m e d ,   s o   t e s t   i s   m a r k e d   a s   ' s k i p p e d '   r a t h e r   t h a n   ' p a s s e d '� ��� =  � ���� o   � ����� 0 outcometype outcomeType� o   � ����� 0 _skipped _SKIPPED� ��� r   � ���� b   � ���� b   � ���� b   � ���� b   � ���� b   � ���� n  � ���� o   � ����� 0 e  � o   � ����� 0 vtstyle vtStyle� m   � �   �  S K I P P E D   T E S T� n  � � o   � ����� 0 n   o   � ����� 0 vtstyle vtStyle� m   � � �    (� n  � � o   � ����� 0 usernote userNote o   � ����� 0 reportrecord reportRecord� m   � � �		  )� o      ���� 0 
reporttext 
reportText� 

 =  � � o   � ����� 0 outcometype outcomeType o   � ����� 0 
_skipsuite 
_SKIPSUITE �� r   �
 b   � b   � b   � � b   � � b   � � n  � � o   � ����� 0 e   o   � ����� 0 vtstyle vtStyle m   � � �  S K I P P E D   S U I T E n  � �  o   � ����� 0 n    o   � ����� 0 vtstyle vtStyle m   � �!! �""    ( n  �#$# o   ����� 0 usernote userNote$ o   � ����� 0 reportrecord reportRecord m  %% �&&  ) o      ���� 0 
reporttext 
reportText��  � k  �'' ()( Z  6*+,-* = ./. o  ���� 0 outcometype outcomeType/ o  ���� 0 _failure _FAILURE+ r  010 m  22 �33  F A I L E D1 o      ���� 0 
statustext 
statusText, 454 = &676 o   ���� 0 outcometype outcomeType7 o   %���� 0 _broken _BROKEN5 8��8 r  ).9:9 m  ),;; �<< 
 B R O K E: o      ���� 0 
statustext 
statusText��  - r  16=>= m  14?? �@@ 
 O T H E R> o      ���� 0 
statustext 
statusText) ABA r  7DCDC b  7BEFE n 7@GHG o  <@���� 0 r  H o  7<���� 0 vtstyle vtStyleF o  @A���� 0 
statustext 
statusTextD o      ���� 0 
reporttext 
reportTextB IJI Z  EtKLMNK C  ELOPO n EHQRQ o  FH���� 0 fromhandler fromHandlerR o  EF���� 0 reportrecord reportRecordP m  HKSS �TT  a s s e r t  L r  OXUVU b  OVWXW b  OTYZY o  OP���� 0 
reporttext 
reportTextZ m  PS[[ �\\    o n   a s s e r t i o n  X o  TU���� 0 assertcount assertCountV o      ���� 0 
reporttext 
reportTextM ]^] ?  [^_`_ o  [\���� 0 assertcount assertCount` m  \]����  ^ a��a r  ajbcb b  ahded b  affgf o  ab���� 0 
reporttext 
reportTextg m  behh �ii "   a f t e r   a s s e r t i o n  e o  fg���� 0 assertcount assertCountc o      ���� 0 
reporttext 
reportText��  N r  mtjkj b  mrlml o  mn���� 0 
reporttext 
reportTextm m  nqnn �oo    a t   s t a r tk o      ���� 0 
reporttext 
reportTextJ pqp r  u�rsr b  u�tut b  u�vwv b  u�xyx b  u~z{z o  uv���� 0 
reporttext 
reportText{ n v}|}| o  {}���� 0 n  } o  v{���� 0 vtstyle vtStyley m  ~�~~ � 
   i n   w n ����� o  ������ 0 fromhandler fromHandler� o  ������ 0 reportrecord reportRecordu m  ���� ���  s o      ���� 0 
reporttext 
reportTextq ��� l ��������  �   explain the problem:   � ��� *   e x p l a i n   t h e   p r o b l e m :� ��� Z ������~� ?  ����� n ����� 1  ���}
�} 
leng� n ����� o  ���|�|  0 problemsummary problemSummary� o  ���{�{ 0 reportrecord reportRecord� m  ���z�z  � r  ����� b  ����� b  ����� o  ���y�y 0 
reporttext 
reportText� m  ���� ���   � n ����� o  ���x�x  0 problemsummary problemSummary� o  ���w�w 0 reportrecord reportRecord� o      �v�v 0 
reporttext 
reportText�  �~  � ��� Z �����u�t� > ����� n ����� o  ���s�s 0 usernote userNote� o  ���r�r 0 reportrecord reportRecord� m  ���� ���  � r  ����� b  ����� b  ����� b  ����� o  ���q�q 0 
reporttext 
reportText� m  ���� ���    (� n ����� o  ���p�p 0 usernote userNote� o  ���o�o 0 reportrecord reportRecord� m  ���� ���  )� o      �n�n 0 
reporttext 
reportText�u  �t  � ��� Z  �����m�� = ����� n ����� o  ���l�l 0 testdata testData� o  ���k�k 0 reportrecord reportRecord� J  ���j�j  � r  ����� b  ����� o  ���i�i 0 
reporttext 
reportText� m  ���� ���  .� o      �h�h 0 
reporttext 
reportText�m  � r  ����� b  ����� o  ���g�g 0 
reporttext 
reportText� m  ���� ���  :� o      �f�f 0 
reporttext 
reportText� ��e� X  ����d�� k  �}�� ��� l ����� r  ���� n  ���� 1  ��c
�c 
pcnt� o  ���b�b 0 aref aRef� J      �� ��� o      �a�a 0 k  � ��`� o      �_�_ 0 v  �`  � D > note: v should always be either text or 'caught error' record   � ��� |   n o t e :   v   s h o u l d   a l w a y s   b e   e i t h e r   t e x t   o r   ' c a u g h t   e r r o r '   r e c o r d� ��� Z 0���^�]� = ��� n ��� m  �\
�\ 
pcls� o  �[�[ 0 v  � o  �Z�Z $0 _caughterrortype _CaughtErrorType� r  ,��� I  *�Y��X�Y 20 formatcaughterrorrecord formatCaughtErrorRecord� ��� o   !�W�W 0 v  � ��V� o  !&�U�U 0 indent2  �V  �X  � o      �T�T 0 v  �^  �]  � ��� Z  1c���S�� o  16�R�R 0 uselinewrap useLineWrap� r  9U��� I  9S�Q��P�Q 0 linewrap lineWrap� ��� o  :;�O�O 0 v  � ��� I  ;J�N��M�N $0 formatinvisibles formatInvisibles� ��� o  <=�L�L 0 v  � ��K� b  =F��� 1  =@�J
�J 
lnfd� o  @E�I�I 0 indent2  �K  �M  � ��H� o  JO�G�G 0 terminalwidth terminalWidth�H  �P  � o      �F�F 0 v  �S  � l Xc���� r  Xc   I  Xa�E�D�E $0 formatinvisibles formatInvisibles  o  YZ�C�C 0 v   �B 1  Z]�A
�A 
lnfd�B  �D   o      �@�@ 0 v  � @ : include linebreak after '\n'/'\r' escapes for readability   � � t   i n c l u d e   l i n e b r e a k   a f t e r   ' \ n ' / ' \ r '   e s c a p e s   f o r   r e a d a b i l i t y� �? l d}	
 r  d} b  d{ b  dy b  du b  ds b  do b  di o  de�>�> 0 
reporttext 
reportText 1  eh�=
�= 
lnfd o  in�<�< 0 indent1   m  or �  "   o  st�;�; 0 k   m  ux �  :   o  yz�:�: 0 v   o      �9�9 0 
reporttext 
reportText	�� TO DO: need to replace any TAB, CR, and LF in strings with "\t", "\r", "\n" (specifically applies to AS string literals, though these chars ought not to appear elsewhere in data in which case it's simplest just to apply it to the lot); this should make differences in invisibles somewhat easier to spot in reports and may help avoid some confusion when text gets linewrapped for terminal display   
 �   T O   D O :   n e e d   t o   r e p l a c e   a n y   T A B ,   C R ,   a n d   L F   i n   s t r i n g s   w i t h   " \ t " ,   " \ r " ,   " \ n "   ( s p e c i f i c a l l y   a p p l i e s   t o   A S   s t r i n g   l i t e r a l s ,   t h o u g h   t h e s e   c h a r s   o u g h t   n o t   t o   a p p e a r   e l s e w h e r e   i n   d a t a   i n   w h i c h   c a s e   i t ' s   s i m p l e s t   j u s t   t o   a p p l y   i t   t o   t h e   l o t ) ;   t h i s   s h o u l d   m a k e   d i f f e r e n c e s   i n   i n v i s i b l e s   s o m e w h a t   e a s i e r   t o   s p o t   i n   r e p o r t s   a n d   m a y   h e l p   a v o i d   s o m e   c o n f u s i o n   w h e n   t e x t   g e t s   l i n e w r a p p e d   f o r   t e r m i n a l   d i s p l a y�?  �d 0 aref aRef� n �� o  ���8�8 0 testdata testData o  ���7�7 0 reportrecord reportRecord�e  �  �6  L  ��!! K  ��"" �5#$
�5 
Stat# o  ���4�4 0 outcometype outcomeType$ �3%�2
�3 
Repo% o  ���1�1 0 
reporttext 
reportText�2  �6  q 5 / construct final outcome status and report text   r �&& ^   c o n s t r u c t   f i n a l   o u t c o m e   s t a t u s   a n d   r e p o r t   t e x tm '�0' l     �/�.�-�/  �.  �-  �0  �  � ()( l     �,�+�*�,  �+  �*  ) *�)* l     �(�'�&�(  �'  �&  �)       �%+,�$�#�"�!� ��-./0123456789�%  + ��������������������
�	� 0 novalue NoValue� 0 	_nostatus 	_NOSTATUS� 0 _success _SUCCESS� 0 _failure _FAILURE� 0 _broken _BROKEN� 0 _skipped _SKIPPED� 0 
_skipsuite 
_SKIPSUITE� $0 _caughterrortype _CaughtErrorType� .0 makecaughterrorrecord makeCaughtErrorRecord� *0 _defaulterrorrecord _defaultErrorRecord� <0 normalizeexpectederrorrecord normalizeExpectedErrorRecord� 20 formatcaughterrorrecord formatCaughtErrorRecord� 0 istype isType� (0 sanitizeidentifier sanitizeIdentifier�  0 maketestobject makeTestObject�  0 makecallobject makeCallObject� 0 replacetext replaceText� $0 formatinvisibles formatInvisibles� 0 linewrap lineWrap�
 0 vt100 VT100�	  0 maketestreport makeTestReport, �   :� 0 novalue NoValue:  ;;  �$���# �" �! �  � 	
� 
����- � N��<=�� .0 makecaughterrorrecord makeCaughtErrorRecord� �>� >  ��� ����� 0 etext eText� 0 enumber eNumber�  0 efrom eFrom�� 
0 eto eTo�� 0 epartial ePartial�  < ������������ 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTo�� 0 epartial ePartial= ��������������
�� 
pcls�� 0 errormessage errorMessage�� 0 errornumber errorNumber�� 0 	fromvalue 	fromValue�� 0 totype toType�� 0 partialresult partialResult�� � �b  ������. ����?
�� 
pcls
�� 
����? ��,@�� 0 errormessage errorMessage@ ��,A�� 0 errornumber errorNumberA ��,B�� 0 	fromvalue 	fromValueB ��,C�� 0 totype toTypeC ��,���� 0 partialresult partialResult��  / �� ~����DE���� <0 normalizeexpectederrorrecord normalizeExpectedErrorRecord�� ��F�� F  ���� 0 errorrecord errorRecord��  D ������ 0 errorrecord errorRecord�� $0 normalizedrecord normalizedRecordE 	�������������� � �
�� 
leng
�� 
errn���Y
�� 
erob
�� 
errt
�� 
reco�� �� A��,j  )�������Y hO�b  	%E�O��,b  	�, )�������Y hO�0 �� �����GH���� 20 formatcaughterrorrecord formatCaughtErrorRecord�� ��I�� I  ������ 0 errorrecord errorRecord�� 0 
lineindent 
lineIndent��  G �������� 0 errorrecord errorRecord�� 0 
lineindent 
lineIndent�� 0 	errortext 	errorTextH  ��� � �����������1�� 0 errornumber errorNumber�� 0 errormessage errorMessage�� 0 	fromvalue 	fromValue
�� 
lnfd�� 0 totype toType�� 0 partialresult partialResult�� ��E�O��,b    ��%��,%�%E�Y hO��,b    ���,%E�Y hO��,b    ��%�%�%��,%E�Y hO��,b    ��%�%�%��,%E�Y hO��,b    ��%�%�%��,%E�Y hO�1 ��>����JK���� 0 istype isType�� ��L�� L  ������ 0 thevalue theValue�� 0 typename typeName��  J ������ 0 thevalue theValue�� 0 typename typeNameK ����
�� 
kocl
�� .corecnte****       ****�� �kv�l j2 ��_����MN���� (0 sanitizeidentifier sanitizeIdentifier�� ��O�� O  ���� 0 aname aName��  M �������������� 0 aname aName�� 0 res  �� 0 
legalchars 
legalChars�� 0 usepipes usePipes�� 0 charref charRef�� 0 c  N cdlou{�������������
�� 
kocl
�� 
cobj
�� .corecnte****       ****
�� 
pcnt�� v�� r��  �Y hO�E�O�E�OfE�O B�[��l kh ��,E�O�� eE�O� 
�%E�Y hY hO��%E�O�E�[OY��O� ��%�%E�Y hO�V3 �������PQ����  0 maketestobject makeTestObject�� ��R�� R  ������ 0 suiteobject suiteObject�� 0 handlername handlerName��  P �������� 0 suiteobject suiteObject�� 0 handlername handlerName�� 0 
testobject 
testObjectQ ������������ (0 sanitizeidentifier sanitizeIdentifier
�� .sysodsct****        scpt�� 0 _suiteobject _suiteObject�� %�*�%k+ %�%*�k+ %�%j E�O���,FO�4 �������ST����  0 makecallobject makeCallObject�� ��U�� U  ������ 0 handlername handlerName��  0 parametercount parameterCount��  S ���������� 0 handlername handlerName��  0 parametercount parameterCount�� 0 args  �� 0 i  T *��BH��JNP��
�� 
ctxt�� (0 sanitizeidentifier sanitizeIdentifier
�� .sysodsct****        scpt�� ^�E�O�k  �E�Y 0�k ) k�kh ��%�%E�[OY��O�[�\[Zm\Zi2E�Y hO�*�%k+ %�%*�k+ %�%�%�%j 
5 ��f����VW���� 0 replacetext replaceText�� ��X�� X  �������� 0 thetext theText�� 0 findtext findText�� 0 replacetext replaceText��  V ���������� 0 thetext theText�� 0 findtext findText�� 0 replacetext replaceText�� 0 	textitems 	textItemsW ��������
�� 
ascr
�� 
txdl
�� 
citm
�� 
ctxt�� ���,FO��-E�O���,FO��&6 �������YZ���� $0 formatinvisibles formatInvisibles�� ��[�� [  ��~� 0 thetext theText�~ 0 linewrap lineWrap��  Y �}�|�} 0 thetext theText�| 0 linewrap lineWrapZ �{��z�y��x�
�{ 
tab �z 0 replacetext replaceText
�y 
lnfd
�x 
ret �� ***���m+ ��%m+ ��%m+ 7 �w��v�u\]�t�w 0 linewrap lineWrap�v �s^�s ^  �r�q�r 0 thetext theText�q 0 towidth toWidth�u  \ �p�o�p 0 thetext theText�o 0 towidth toWidth]  �t �8 �n��m�l_`�k�n 0 vt100 VT100�m �ja�j a  �i�i 0 
formatcode 
formatCode�l  _ �h�h 0 
formatcode 
formatCode` �g�f�e��
�g 
cha �f 
�e kfrmID  �k )���0�%�%�%9 �d��c�bbc�a�d  0 maketestreport makeTestReport�c �`d�` d  �_�^�]�_ 0 testsuitename testSuiteName�^ "0 testhandlername testHandlerName�] 0 terminalwidth terminalWidth�b  b �\�[�Z�Y�X�W�V�U�\ 0 testsuitename testSuiteName�[ "0 testhandlername testHandlerName�Z 0 terminalwidth terminalWidth�Y 0 indent1  �X 0 indent2  �W 0 vtstyle vtStyle�V 0 uselinewrap useLineWrap�U 0 
testreport 
TestReportc 
�T�S �R$�Q(�P,�O0�N3�M�L�KNTY�J_e
�T 
cobj�S 0 n  �R 0 b  �Q 0 u  �P 0 r  �O 0 g  �N 0 e  �M �L 0 vt100 VT100�K �J 0 
testreport 
TestReporte �If�H�Ggh�F
�I .ascrinit****      � ****f k     1ii ljj skk �ll �mm �nn oo +pp Tqq Wrr Zss _tt uu l�E�E  �H  �G  g �D�C�B�A�@�?�>�=�<�;�:�9�8�D 0 _testresults _testResults�C 0 
_addreport 
_addReport�B 0 
addsuccess 
addSuccess�A 0 
addskipped 
addSkipped�@ 0 	skipsuite 	skipSuite�? 0 
addfailure 
addFailure�> 0 	addbroken 	addBroken�= $0 _errorrecordrefs _errorRecordRefs�< 0 
_dataindex 
_dataIndex�; 0 _datasubindex _dataSubIndex�: 0 nextrawdata  �9 0 updaterawdata  �8 0 renderreport  h �7vwxyz{�6�5�4|}~�7 0 _testresults _testResultsv �3v�2�1��0�3 0 
_addreport 
_addReport�2 �/��/ �  �.�-�,�+�*�. 0 outcometype outcomeType�- 0 fromhandler fromHandler�,  0 problemsummary problemSummary�+ 0 usernote userNote�* 0 testdata testData�1   �)�(�'�&�%�) 0 outcometype outcomeType�( 0 fromhandler fromHandler�'  0 problemsummary problemSummary�& 0 usernote userNote�% 0 testdata testData� �$�#�"�!� ��$ 0 outcometype outcomeType�# 0 fromhandler fromHandler�"  0 problemsummary problemSummary�! 0 usernote userNote�  0 testdata testData� 
�0 ������b   6FOPw �������� 0 
addsuccess 
addSuccess� ��� �  ���� 0 fromhandler fromHandler� 0 usernote userNote� 0 testdata testData�  � ���� 0 fromhandler fromHandler� 0 usernote userNote� 0 testdata testData� ���� � 0 
_addreport 
_addReport� *b  �ࡢ�+ x �������� 0 
addskipped 
addSkipped� ��� �  ��� 0 fromhandler fromHandler� 0 usernote userNote�  � �
�	�
 0 fromhandler fromHandler�	 0 usernote userNote� ������ � 0 
_addreport 
_addReport� ��  �E�Y hO*b  ��jv�+ y �������� 0 	skipsuite 	skipSuite� ��� �  �� 0 usernote userNote�  � � �  0 usernote userNote� �������� �� 0 
_addreport 
_addReport� ��  �E�Y hO*b  ��jv�+ z ������������ 0 
addfailure 
addFailure�� ����� �  ���������� 0 fromhandler fromHandler��  0 problemsummary problemSummary�� 0 usernote userNote�� 0 testdata testData��  � ���������� 0 fromhandler fromHandler��  0 problemsummary problemSummary�� 0 usernote userNote�� 0 testdata testData� ������ �� 0 
_addreport 
_addReport�� *b  �����+ { ��.���������� 0 	addbroken 	addBroken�� ����� �  ���������� 0 fromhandler fromHandler��  0 problemsummary problemSummary�� 0 usernote userNote�� 0 testdata testData��  � ���������� 0 fromhandler fromHandler��  0 problemsummary problemSummary�� 0 usernote userNote�� 0 testdata testData� ������ �� 0 
_addreport 
_addReport�� *b  �����+ �6 $0 _errorrecordrefs _errorRecordRefs�5 0 
_dataindex 
_dataIndex�4 0 _datasubindex _dataSubIndex| ��b���������� 0 nextrawdata  ��  ��  � �������� 0 	erroritem 	errorItem�� 0 datalist dataList�� 0 thedata theData� ������������������������������������
�� 
leng
�� 
cobj
�� 
pcnt
�� 
rest�� 0 nextrawdata  �� 0 testdata testData
�� 
reco�� 0 istype isType
�� 
pcls
�� 
bool�� 0 errormessage errorMessage�� 0 errornumber errorNumber�� 0 	fromvalue 	fromValue�� 0 totype toType�� 0 partialresult partialResult�� 
�� 
errn��f��b  b   �, �b  jv Tb  �k/�,E�O�b     6b  �,Ec  Ob  jv  b  	kEc  	Y hO*j+ Y hO�Y hOb   �b  /�,E�Ob  	��, U��b  	/�l/E�O*��l+ 	 ��,b   �& (��,��,��,��,��,�vEc  O*j+ Y hO�Y *b  kklvE[�k/Ec  Z[�l/Ec  	ZO*j+ Y hO)a a lh} ������������ 0 updaterawdata  �� ����� �  ���� 0 literaltext literalText��  � ���� 0 literaltext literalText� ��������
�� 
cobj�� 0 testdata testData
�� 
pcnt
�� 
rest�� qb  jv  -�b   �b  /�,�b  	/�l/FOb  	kEc  	Y 9�b  �k/�,FOb  �,Ec  Ob  jv  b  	kEc  	Y hOh~ ��o���������� 0 renderreport  ��  ��  � 	�������������������� 0 assertcount assertCount�� 0 outcometype outcomeType�� 0 	reportref 	reportRef�� 0 reportrecord reportRecord�� 0 
reporttext 
reportText�� 0 
statustext 
statusText�� 0 aref aRef�� 0 k  �� 0 v  � 4���������������������������� ��!%2;?��S[hn~���������������������������
�� 
cobj�� 0 _testresults _testResults
�� 
kocl
�� .corecnte****       ****
�� 
pcnt�� 0 fromhandler fromHandler�� 0 outcometype outcomeType�� 0 g  �� 0 n  
�� 
leng�� 0 e  �� 0 usernote userNote�� 0 r  ��  0 problemsummary problemSummary�� 0 testdata testData
�� 
pcls�� 20 formatcaughterrorrecord formatCaughtErrorRecord
�� 
lnfd�� $0 formatinvisibles formatInvisibles�� 0 linewrap lineWrap
�� 
Stat
�� 
Repo�� ���jb  lvE[�k/E�Z[�l/E�ZO C)�,[��l kh ��,E�O��,� 
�kE�Y hO��,E�O�b   Y h[OY��O�b    $b  �,�%b  �,%�%b   �,%�%E�Y��b    b  �,�%b  �,%a %E�Yסb    (b  �,a %b  �,%a %�a ,%a %E�Y��b    (b  �,a %b  �,%a %�a ,%a %E�Yw�b    
a E�Y �b    
a E�Y a E�Ob  a ,�%E�O��,a  �a %�%E�Y �j �a %�%E�Y 	�a %E�O�b  �,%a  %��,%a !%E�O�a ",�,j �a #%�a ",%E�Y hO�a ,a $ �a %%�a ,%a &%E�Y hO�a ',jv  �a (%E�Y 	�a )%E�O ��a ',[��l kh ��,E[�k/E�Z[�l/E�ZO�a *,b    *�b  l+ +E�Y hOb   !*�*�_ ,b  %l+ -b  m+ .E�Y *�_ ,l+ -E�O�_ ,%b  %a /%�%a 0%�%E�[OY�{Oa 1�a 2�a 3�F 2jv�OL OL OL OL OL OL Ojv�Ok�Ok�OL 
OL OL �a x��lvE[�k/E�Z[�l/E�ZO�i  �������������E�OfE�Y <�*jk+ �*kk+ �*a k+ �*a k+ �*a k+ �*a k+ �E�OeE�Oa a K S�ascr  ��ޭ