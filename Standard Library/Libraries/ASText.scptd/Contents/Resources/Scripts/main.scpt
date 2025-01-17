FasdUAS 1.101.10   ��   ��    k             l      ��  ��   c] Text -- commonly-used text processing commands

Notes: 

- When matching text item delimiters in text value, AppleScript uses the current scope's existing considering/ignoring case, diacriticals, hyphens, punctuation, white space and numeric strings settings; thus, wrapping a `search text` command in different considering/ignoring blocks can produce different results. For example, `search text "fud" for "F" will normally match the first character since AppleScript uses case-insensitive matching by default, whereas enclosing it in a `considering case` block will cause the same command to return zero matches. Conversely, `search text "f ud" for "fu"` will normally return zero matches as AppleScript considers white space by default, but when enclosed in an `ignoring white space` block will match the first three characters: "f u". This is how AppleScript is designed to work, but users need to be reminded of this as considering/ignoring blocks affect ALL script handlers called within that block, including nested calls (and all to any osax and application handlers that understand considering/ignoring attributes).

- Unlike AS text values, which preserve original Unicode normalization but ignore differences in form when comparing and counting, NSString and NSRegularExpression don't ignore normalization differences when comparing for equality. Therefore, handlers such as `search text`, `split text`, etc. that perform comparison operations on/using these Cocoa classes must normalize their input and pattern text first. (Be aware that this means that these commands may output text that uses different normalization form to input text; this shouldn't affect AppleScript itself, but might be a consideration when using that text elsewhere, e.g. in text files or scriptable apps.)

- Useful summary of NSString and Unicode: https://www.objc.io/issues/9-strings/unicode/

     � 	 	�   T e x t   - -   c o m m o n l y - u s e d   t e x t   p r o c e s s i n g   c o m m a n d s 
 
 N o t e s :   
 
 -   W h e n   m a t c h i n g   t e x t   i t e m   d e l i m i t e r s   i n   t e x t   v a l u e ,   A p p l e S c r i p t   u s e s   t h e   c u r r e n t   s c o p e ' s   e x i s t i n g   c o n s i d e r i n g / i g n o r i n g   c a s e ,   d i a c r i t i c a l s ,   h y p h e n s ,   p u n c t u a t i o n ,   w h i t e   s p a c e   a n d   n u m e r i c   s t r i n g s   s e t t i n g s ;   t h u s ,   w r a p p i n g   a   ` s e a r c h   t e x t `   c o m m a n d   i n   d i f f e r e n t   c o n s i d e r i n g / i g n o r i n g   b l o c k s   c a n   p r o d u c e   d i f f e r e n t   r e s u l t s .   F o r   e x a m p l e ,   ` s e a r c h   t e x t   " f u d "   f o r   " F "   w i l l   n o r m a l l y   m a t c h   t h e   f i r s t   c h a r a c t e r   s i n c e   A p p l e S c r i p t   u s e s   c a s e - i n s e n s i t i v e   m a t c h i n g   b y   d e f a u l t ,   w h e r e a s   e n c l o s i n g   i t   i n   a   ` c o n s i d e r i n g   c a s e `   b l o c k   w i l l   c a u s e   t h e   s a m e   c o m m a n d   t o   r e t u r n   z e r o   m a t c h e s .   C o n v e r s e l y ,   ` s e a r c h   t e x t   " f   u d "   f o r   " f u " `   w i l l   n o r m a l l y   r e t u r n   z e r o   m a t c h e s   a s   A p p l e S c r i p t   c o n s i d e r s   w h i t e   s p a c e   b y   d e f a u l t ,   b u t   w h e n   e n c l o s e d   i n   a n   ` i g n o r i n g   w h i t e   s p a c e `   b l o c k   w i l l   m a t c h   t h e   f i r s t   t h r e e   c h a r a c t e r s :   " f   u " .   T h i s   i s   h o w   A p p l e S c r i p t   i s   d e s i g n e d   t o   w o r k ,   b u t   u s e r s   n e e d   t o   b e   r e m i n d e d   o f   t h i s   a s   c o n s i d e r i n g / i g n o r i n g   b l o c k s   a f f e c t   A L L   s c r i p t   h a n d l e r s   c a l l e d   w i t h i n   t h a t   b l o c k ,   i n c l u d i n g   n e s t e d   c a l l s   ( a n d   a l l   t o   a n y   o s a x   a n d   a p p l i c a t i o n   h a n d l e r s   t h a t   u n d e r s t a n d   c o n s i d e r i n g / i g n o r i n g   a t t r i b u t e s ) . 
 
 -   U n l i k e   A S   t e x t   v a l u e s ,   w h i c h   p r e s e r v e   o r i g i n a l   U n i c o d e   n o r m a l i z a t i o n   b u t   i g n o r e   d i f f e r e n c e s   i n   f o r m   w h e n   c o m p a r i n g   a n d   c o u n t i n g ,   N S S t r i n g   a n d   N S R e g u l a r E x p r e s s i o n   d o n ' t   i g n o r e   n o r m a l i z a t i o n   d i f f e r e n c e s   w h e n   c o m p a r i n g   f o r   e q u a l i t y .   T h e r e f o r e ,   h a n d l e r s   s u c h   a s   ` s e a r c h   t e x t ` ,   ` s p l i t   t e x t ` ,   e t c .   t h a t   p e r f o r m   c o m p a r i s o n   o p e r a t i o n s   o n / u s i n g   t h e s e   C o c o a   c l a s s e s   m u s t   n o r m a l i z e   t h e i r   i n p u t   a n d   p a t t e r n   t e x t   f i r s t .   ( B e   a w a r e   t h a t   t h i s   m e a n s   t h a t   t h e s e   c o m m a n d s   m a y   o u t p u t   t e x t   t h a t   u s e s   d i f f e r e n t   n o r m a l i z a t i o n   f o r m   t o   i n p u t   t e x t ;   t h i s   s h o u l d n ' t   a f f e c t   A p p l e S c r i p t   i t s e l f ,   b u t   m i g h t   b e   a   c o n s i d e r a t i o n   w h e n   u s i n g   t h a t   t e x t   e l s e w h e r e ,   e . g .   i n   t e x t   f i l e s   o r   s c r i p t a b l e   a p p s . ) 
 
 -   U s e f u l   s u m m a r y   o f   N S S t r i n g   a n d   U n i c o d e :   h t t p s : / / w w w . o b j c . i o / i s s u e s / 9 - s t r i n g s / u n i c o d e / 
 
   
  
 l     ��������  ��  ��        x     �� ����    4    �� 
�� 
frmk  m       �    F o u n d a t i o n��        x    �� ����    2   ��
�� 
osax��        l     ��������  ��  ��        l     ��  ��    J D--------------------------------------------------------------------     �   � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -      l     ��  ��      record types     �        r e c o r d   t y p e s   ! " ! l     ��������  ��  ��   "  # $ # j    �� %�� (0 _unmatchedtexttype _UnmatchedTextType % m    ��
�� 
TxtU $  & ' & j    �� (�� $0 _matchedtexttype _MatchedTextType ( m    ��
�� 
TxtM '  ) * ) j    �� +�� &0 _matchedgrouptype _MatchedGroupType + m    ��
�� 
TxtG *  , - , l     ��������  ��  ��   -  . / . l     ��������  ��  ��   /  0 1 0 l     �� 2 3��   2 J D--------------------------------------------------------------------    3 � 4 4 � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 1  5 6 5 l     �� 7 8��   7   support    8 � 9 9    s u p p o r t 6  : ; : l     ��������  ��  ��   ;  < = < l      > ? @ > j     &�� A�� 0 _support   A N     % B B 4     $�� C
�� 
scpt C m   " # D D � E E  T y p e S u p p o r t ? "  used for parameter checking    @ � F F 8   u s e d   f o r   p a r a m e t e r   c h e c k i n g =  G H G l     ��������  ��  ��   H  I J I l     ��������  ��  ��   J  K L K i  ' * M N M I      �� O���� 
0 _error   O  P Q P o      ���� 0 handlername handlerName Q  R S R o      ���� 0 etext eText S  T U T o      ���� 0 enumber eNumber U  V W V o      ���� 0 efrom eFrom W  X�� X o      ���� 
0 eto eTo��  ��   N n     Y Z Y I    �� [���� &0 throwcommanderror throwCommandError [  \ ] \ m     ^ ^ � _ _  T e x t ]  ` a ` o    ���� 0 handlername handlerName a  b c b o    ���� 0 etext eText c  d e d o    	���� 0 enumber eNumber e  f g f o   	 
���� 0 efrom eFrom g  h�� h o   
 ���� 
0 eto eTo��  ��   Z o     ���� 0 _support   L  i j i l     ��������  ��  ��   j  k l k l     ��������  ��  ��   l  m n m l     �� o p��   o J D--------------------------------------------------------------------    p � q q � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - n  r s r l     ��������  ��  ��   s  t u t i  + . v w v I      �� x���� B0 _asnsregularexpressionparameter _asNSRegularExpressionParameter x  y z y o      ���� 0 patterntext patternText z  {�� { o      ���� 0 parametername parameterName��  ��   w l     | } ~ | L        n     � � � I    �� ����� @0 asnsregularexpressionparameter asNSRegularExpressionParameter �  � � � o    ���� 0 patterntext patternText �  � � � l 	   ����� � l    ����� � [     � � � [     � � � [     � � � l   
 ����� � e    
 � � n   
 � � � o    	���� H0 "nsregularexpressioncaseinsensitive "NSRegularExpressionCaseInsensitive � m    ��
�� misccura��  ��   � l 	 
  ����� � l  
  ����� � e   
  � � n  
  � � � o    ���� L0 $nsregularexpressionanchorsmatchlines $NSRegularExpressionAnchorsMatchLines � m   
 ��
�� misccura��  ��  ��  ��   � l 	   ����� � l    ����� � e     � � n    � � � o    ���� Z0 +nsregularexpressiondotmatcheslineseparators +NSRegularExpressionDotMatchesLineSeparators � m    ��
�� misccura��  ��  ��  ��   � l 	   ����� � l    ����� � e     � � n    � � � o    ���� Z0 +nsregularexpressionuseunicodewordboundaries +NSRegularExpressionUseUnicodeWordBoundaries � m    ��
�� misccura��  ��  ��  ��  ��  ��  ��  ��   �  ��� � o    ���� 0 parametername parameterName��  ��   � o     ���� 0 _support   } H B returns a regexp object with `(?imsw)` options enabled by default    ~ � � � �   r e t u r n s   a   r e g e x p   o b j e c t   w i t h   ` ( ? i m s w ) `   o p t i o n s   e n a b l e d   b y   d e f a u l t u  � � � l     ��������  ��  ��   �  � � � l     ��������  ��  ��   �  � � � l     ��������  ��  ��   �  � � � l      � � � � j   / 1�� ��� 0 _tokens   � m   / 0 � � � � �" 
 \ \ 	 	 	 	 	 	 	 	 #   m a t c h   a   b a c k s l a s h   e s c a p e ,   f o l l o w e d   b y   o n e   o f : 
           ( ? : ( n | r | t | \ \ ) 	 	 	 #   n e w l i n e ,   r e t u r n ,   t a b   o r   b a c k s l a s h   c h a r a c t e r 
       |   (   [ 0 - 9 ]   ) 	 	 	 	 	 #   b a c k s l a s h   +   s i n g l e   d i g i t   ( i n s e r t i o n   i n d e x ) 
       |   \ {   ( [ ^ } { \ \ ] * )   \ } 	 	 #   b a c k s l a s h   +   a n y   t e x t   i n   b r a c e s   ( i n s e r t i o n   i n d e x   o r   n a m e ) 
 ) � � � note: \N{...}, \u1234, and \U00123456 escape sequences are processed separately (via ICU transforms); any other backslash sequences are unrecognized and left unchanged    � � � �P   n o t e :   \ N { . . . } ,   \ u 1 2 3 4 ,   a n d   \ U 0 0 1 2 3 4 5 6   e s c a p e   s e q u e n c e s   a r e   p r o c e s s e d   s e p a r a t e l y   ( v i a   I C U   t r a n s f o r m s ) ;   a n y   o t h e r   b a c k s l a s h   s e q u e n c e s   a r e   u n r e c o g n i z e d   a n d   l e f t   u n c h a n g e d �  � � � l     ��������  ��  ��   �  � � � i  2 5 � � � I      �� ����� (0 _parsetemplatetext _parseTemplateText �  ��� � o      ���� 0 templatetext templateText��  ��   � l   c � � � � k    c � �  � � � r     
 � � � n     � � � I    �� ����� &0 stringwithstring_ stringWithString_ �  ��� � o    �� 0 templatetext templateText��  ��   � n     � � � o    �~�~ 0 nsstring NSString � m     �}
�} misccura � o      �|�| 0 
asocstring 
asocString �  � � � r     � � � n    � � � I    �{ ��z�{ Z0 +regularexpressionwithpattern_options_error_ +regularExpressionWithPattern_options_error_ �  � � � l 
   ��y�x � o    �w�w 0 _tokens  �y  �x   �  � � � l    ��v�u � e     � � n    � � � o    �t�t ^0 -nsregularexpressionallowcommentsandwhitespace -NSRegularExpressionAllowCommentsAndWhitespace � m    �s
�s misccura�v  �u   �  ��r � l    ��q�p � m    �o
�o 
msng�q  �p  �r  �z   � n    � � � o    �n�n *0 nsregularexpression NSRegularExpression � m    �m
�m misccura � o      �l�l 0 asocpattern asocPattern �  � � � r    " � � � m     �k�k   � o      �j�j &0 asocnonmatchstart asocNonMatchStart �  � � � r   # ' � � � J   # %�i�i   � o      �h�h 0 
resultlist 
resultList �  � � � r   ( 9 � � � n  ( 7 � � � I   ) 7�g ��f�g @0 matchesinstring_options_range_ matchesInString_options_range_ �  � � � o   ) *�e�e 0 
asocstring 
asocString �  � � � m   * +�d�d   �  ��c � J   + 3 � �  � � � m   + ,�b�b   �  ��a � n  , 1 � � � I   - 1�`�_�^�` 
0 length  �_  �^   � o   , -�]�] 0 
asocstring 
asocString�a  �c  �f   � o   ( )�\�\ 0 asocpattern asocPattern � o      �[�[  0 asocmatcharray asocMatchArray �  � � � r   : = � � � m   : ;�Z
�Z boovfals � o      �Y�Y 0 
concatnext 
concatNext �  � � � Y   >0 ��X � ��W � k   N+    r   N V l  N T�V�U n  N T I   O T�T�S�T  0 objectatindex_ objectAtIndex_ 	�R	 o   O P�Q�Q 0 i  �R  �S   o   N O�P�P  0 asocmatcharray asocMatchArray�V  �U   o      �O�O 0 	asocmatch 	asocMatch 

 r   W _ l  W ]�N�M n  W ] I   X ]�L�K�L 0 rangeatindex_ rangeAtIndex_ �J m   X Y�I�I  �J  �K   o   W X�H�H 0 	asocmatch 	asocMatch�N  �M   o      �G�G  0 asocmatchrange asocMatchRange  l  ` `�F�F   T N get text before match, convert entities to characters, and add to result list    � �   g e t   t e x t   b e f o r e   m a t c h ,   c o n v e r t   e n t i t i e s   t o   c h a r a c t e r s ,   a n d   a d d   t o   r e s u l t   l i s t  r   ` g n  ` e I   a e�E�D�C�E 0 location  �D  �C   o   ` a�B�B  0 asocmatchrange asocMatchRange o      �A�A  0 asocmatchstart asocMatchStart  l  h  !"  r   h #$# c   h }%&% l  h y'�@�?' n  h y()( I   s y�>*�=�> H0 "stringbyapplyingtransform_reverse_ "stringByApplyingTransform_reverse_* +,+ l  s t-�<�;- m   s t.. �// $ H e x - A n y / C ; N a m e - A n y�<  �;  , 0�:0 m   t u�9
�9 boovfals�:  �=  ) l  h s1�8�71 n  h s232 I   i s�64�5�6 *0 substringwithrange_ substringWithRange_4 5�45 J   i o66 787 o   i j�3�3 &0 asocnonmatchstart asocNonMatchStart8 9�29 l  j m:�1�0: \   j m;<; o   j k�/�/  0 asocmatchstart asocMatchStart< o   k l�.�. &0 asocnonmatchstart asocNonMatchStart�1  �0  �2  �4  �5  3 o   h i�-�- 0 
asocstring 
asocString�8  �7  �@  �?  & m   y |�,
�, 
ctxt$ o      �+�+ 0 nonmatchtext nonMatchText! X R convert \u1234, \U00123456, \N{CHARNAME} escapes to specified characters (10.11+)   " �== �   c o n v e r t   \ u 1 2 3 4 ,   \ U 0 0 1 2 3 4 5 6 ,   \ N { C H A R N A M E }   e s c a p e s   t o   s p e c i f i e d   c h a r a c t e r s   ( 1 0 . 1 1 + ) >?> Z   � �@A�*B@ o   � ��)�) 0 
concatnext 
concatNextA l  � �CDEC k   � �FF GHG r   � �IJI b   � �KLK n   � �MNM 4  � ��(O
�( 
cobjO m   � ��'�'��N o   � ��&�& 0 
resultlist 
resultListL o   � ��%�% 0 nonmatchtext nonMatchTextJ n      PQP 4  � ��$R
�$ 
cobjR m   � ��#�#��Q o   � ��"�" 0 
resultlist 
resultListH S�!S r   � �TUT m   � �� 
�  boovfalsU o      �� 0 
concatnext 
concatNext�!  D 8 2 only item indexes/names should be at even indexes   E �VV d   o n l y   i t e m   i n d e x e s / n a m e s   s h o u l d   b e   a t   e v e n   i n d e x e s�*  B r   � �WXW o   � ��� 0 nonmatchtext nonMatchTextX n      YZY  ;   � �Z o   � ��� 0 
resultlist 
resultList? [\[ r   � �]^] [   � �_`_ o   � ���  0 asocmatchstart asocMatchStart` l  � �a��a n  � �bcb I   � ����� 
0 length  �  �  c o   � ���  0 asocmatchrange asocMatchRange�  �  ^ o      �� &0 asocnonmatchstart asocNonMatchStart\ ded l  � ��fg�  f L F get the matched text (escaped linefeed, etc. or insertion index/name)   g �hh �   g e t   t h e   m a t c h e d   t e x t   ( e s c a p e d   l i n e f e e d ,   e t c .   o r   i n s e r t i o n   i n d e x / n a m e )e i�i Y   �+j�kl�j l  �&mnom k   �&pp qrq r   � �sts l  � �u��u n  � �vwv I   � ��x�� 0 rangeatindex_ rangeAtIndex_x y�y o   � ��� 0 j  �  �  w o   � ��
�
 0 	asocmatch 	asocMatch�  �  t o      �	�	  0 asocgrouprange asocGroupRanger z�z Z   �&{|��{ ?   � �}~} n  � �� I   � ����� 
0 length  �  �  � o   � ���  0 asocgrouprange asocGroupRange~ m   � ���  | k   �"�� ��� r   � ���� l  � ��� ��� n  � ���� I   � �������� *0 substringwithrange_ substringWithRange_� ���� o   � �����  0 asocgrouprange asocGroupRange��  ��  � o   � ����� 0 
asocstring 
asocString�   ��  � o      ���� "0 asocmatchstring asocMatchString� ��� r   � ���� c   � ���� o   � ����� "0 asocmatchstring asocMatchString� m   � ���
�� 
ctxt� o      ���� 0 itemtext itemText� ��� Z   � ������ =   � ���� o   � ����� 0 j  � m   � ����� � k   ��� ��� r   ���� b   ���� n   � ���� 4  � ����
�� 
cobj� m   � �������� o   � ����� 0 
resultlist 
resultList� l  ������� n   ���� 4   ����
�� 
cobj� l  ������� I  ������ z����
�� .sysooffslong    ��� null
�� misccura��  � ����
�� 
psof� o   � ����� 0 itemtext itemText� �����
�� 
psin� m  �� ���  n r t \��  ��  ��  � J   � ��� ��� 1   � ���
�� 
lnfd� ��� o   � ���
�� 
ret � ��� 1   � ���
�� 
tab � ���� m   � ��� ���  \��  ��  ��  � n      ��� 4 ���
�� 
cobj� m  ������� o  ���� 0 
resultlist 
resultList� ���� r  ��� m  ��
�� boovtrue� o      ���� 0 
concatnext 
concatNext��  ��  � r   ��� o  ���� 0 itemtext itemText� n      ���  ;  � o  ���� 0 
resultlist 
resultList� ����  S  !"��  �  �  �  n G A _tokens defines 3 groups (index 0 is full match, so ignore that)   o ��� �   _ t o k e n s   d e f i n e s   3   g r o u p s   ( i n d e x   0   i s   f u l l   m a t c h ,   s o   i g n o r e   t h a t )� 0 j  k m   � ����� l m   � ����� �  �  �X 0 i   � m   A B����   � \   B I��� l  B G������ n  B G��� I   C G�������� 	0 count  ��  ��  � o   B C����  0 asocmatcharray asocMatchArray��  ��  � m   G H���� �W   � ��� l 1E���� r  1E��� c  1C��� l 1?������ n 1?��� I  7?������� H0 "stringbyapplyingtransform_reverse_ "stringByApplyingTransform_reverse_� ��� l 7:������ m  7:�� ��� $ H e x - A n y / C ; N a m e - A n y��  ��  � ���� m  :;��
�� boovfals��  ��  � l 17������ n 17��� I  27������� *0 substringfromindex_ substringFromIndex_� ���� o  23���� &0 asocnonmatchstart asocNonMatchStart��  ��  � o  12���� 0 
asocstring 
asocString��  ��  ��  ��  � m  ?B��
�� 
ctxt� o      ���� 0 itemtext itemText� ( " trailing text; convert and append   � ��� D   t r a i l i n g   t e x t ;   c o n v e r t   a n d   a p p e n d� ��� Z  F`������ o  FG���� 0 
concatnext 
concatNext� r  JY��� b  JR��� n  JP��� 4 KP���
�� 
cobj� m  NO������� o  JK���� 0 
resultlist 
resultList� o  PQ���� 0 itemtext itemText� n      ��� 4 SX���
�� 
cobj� m  VW������� o  RS���� 0 
resultlist 
resultList��  � r  \`��� o  \]���� 0 itemtext itemText� n      ���  ;  ^_� o  ]^���� 0 
resultlist 
resultList� ���� L  ac�� o  ab���� 0 
resultlist 
resultList��   � convert template text containing backslashed special characters (\t, \u1234, \3, etc.) to a list of text items of form {text, index or name, ..., text}, where every 2nd item is an unprocessed back reference; used by the _parseSearchTemplate and _parseFormatTemplate handlers    � ���&   c o n v e r t   t e m p l a t e   t e x t   c o n t a i n i n g   b a c k s l a s h e d   s p e c i a l   c h a r a c t e r s   ( \ t ,   \ u 1 2 3 4 ,   \ 3 ,   e t c . )   t o   a   l i s t   o f   t e x t   i t e m s   o f   f o r m   { t e x t ,   i n d e x   o r   n a m e ,   . . . ,   t e x t } ,   w h e r e   e v e r y   2 n d   i t e m   i s   a n   u n p r o c e s s e d   b a c k   r e f e r e n c e ;   u s e d   b y   t h e   _ p a r s e S e a r c h T e m p l a t e   a n d   _ p a r s e F o r m a t T e m p l a t e   h a n d l e r s � ��� l     ��������  ��  ��  � ��� l     ������  �  -----   � ��� 
 - - - - -� � � l     ����   B < parse template text used in `search text` and `format text`    � x   p a r s e   t e m p l a t e   t e x t   u s e d   i n   ` s e a r c h   t e x t `   a n d   ` f o r m a t   t e x t `   l     ����   F @ (note: last parsed template is cached for more efficient reuse)    � �   ( n o t e :   l a s t   p a r s e d   t e m p l a t e   i s   c a c h e d   f o r   m o r e   e f f i c i e n t   r e u s e ) 	
	 l     ��������  ��  ��  
  j   6 :���� :0 _previoussearchtemplatetext _previousSearchTemplateText m   6 9 �    j   ; ?���� F0 !_previoussearchtemplateparsedtext !_previousSearchTemplateParsedText m   ; > �    l     ��������  ��  ��    i  @ C I      ������ ,0 _parsesearchtemplate _parseSearchTemplate �� o      ���� 0 templatetext templateText��  ��   P     � k    �   !"! Z    �#$����# >   %&% o    ���� 0 templatetext templateText& o    ���� :0 _previoussearchtemplatetext _previousSearchTemplateText$ k    �'' ()( r    *+* I    ��,���� (0 _parsetemplatetext _parseTemplateText, -��- o    ���� 0 templatetext templateText��  ��  + o      ���� 0 templateitems templateItems) ./. Y    �0��12��0 k   % �33 454 r   % +676 n   % )898 4   & )��:
�� 
cobj: o   ' (���� 0 i  9 o   % &���� 0 templateitems templateItems7 o      ���� 0 itemtext itemText5 ;��; Z   , �<=��>< =   , 1?@? `   , /ABA o   , -���� 0 i  B m   - .���� @ m   / 0����  = l  4 hCDEC k   4 hFF GHG r   4 ;IJI b   4 9KLK m   4 5MM �NN  $L l  5 8O����O c   5 8PQP o   5 6���� 0 itemtext itemTextQ m   6 7��
�� 
long��  ��  J o      ���� 0 itemtext itemTextH RSR r   < DTUT n   < BVWV 4   = B��X
�� 
cobjX l  > AY����Y [   > AZ[Z o   > ?���� 0 i  [ m   ? @�� ��  ��  W o   < =�~�~ 0 templateitems templateItemsU o      �}�} 0 nextitem nextItemS \]\ l  E a^_`^ Z  E aab�|�{a F   E Ucdc ?   E Jefe n  E Hghg 1   F H�z
�z 
lengh o   E F�y�y 0 nextitem nextItemf m   H I�x�x  d E  M Siji m   M Nkk �ll  1 2 3 4 5 6 7 8 9 0j n  N Rmnm 4   O R�wo
�w 
cha o m   P Q�v�v n o   N O�u�u 0 nextitem nextItemb r   X ]pqp b   X [rsr o   X Y�t�t 0 itemtext itemTexts m   Y Ztt �uu  \q o      �s�s 0 itemtext itemText�|  �{  _ 8 2 make sure ICT template doesn't consume next digit   ` �vv d   m a k e   s u r e   I C T   t e m p l a t e   d o e s n ' t   c o n s u m e   n e x t   d i g i t] w�rw r   b hxyx o   b c�q�q 0 itemtext itemTexty n      z{z 4   d g�p|
�p 
cobj| o   e f�o�o 0 i  { o   c d�n�n 0 templateitems templateItems�r  D #  substitute integer N with $N   E �}} :   s u b s t i t u t e   i n t e g e r   N   w i t h   $ N��  > l  k �~�~ k   k ��� ��� r   k w��� n  k u��� I   p u�m��l�m 0 
asnsstring 
asNSString� ��k� o   p q�j�j 0 itemtext itemText�k  �l  � o   k p�i�i 0 _support  � o      �h�h 0 
asocstring 
asocString� ��g� r   x ���� c   x ���� l  x ���f�e� n  x ���� I   y ��d��c�d �0 >stringbyreplacingoccurrencesofstring_withstring_options_range_ >stringByReplacingOccurrencesOfString_withString_options_range_� ��� m   y z�� ���  ( [ \ $ ] )� ��� m   z {�� ���  \ \ $ 1� ��� l  { ~��b�a� n  { ~��� o   | ~�`�` 60 nsregularexpressionsearch NSRegularExpressionSearch� m   { |�_
�_ misccura�b  �a  � ��^� J   ~ ��� ��� m   ~ �]�]  � ��\� n   ���� I   � ��[�Z�Y�[ 
0 length  �Z  �Y  � o    ��X�X 0 
asocstring 
asocString�\  �^  �c  � o   x y�W�W 0 
asocstring 
asocString�f  �e  � m   � ��V
�V 
ctxt� n      ��� 4   � ��U�
�U 
cobj� o   � ��T�T 0 i  � o   � ��S�S 0 templateitems templateItems�g     re-escape '/' and '$'   � ��� ,   r e - e s c a p e   ' / '   a n d   ' $ '��  �� 0 i  1 m    �R�R 2 n    ��� 1    �Q
�Q 
leng� o    �P�P 0 templateitems templateItems��  / ��� r   � ���� I   � ��O��N�O 0 	_jointext 	_joinText� ��� o   � ��M�M 0 templateitems templateItems� ��L� m   � ��� ���  �L  �N  � o      �K�K F0 !_previoussearchtemplateparsedtext !_previousSearchTemplateParsedText� ��J� r   � ���� o   � ��I�I 0 templatetext templateText� o      �H�H :0 _previoussearchtemplatetext _previousSearchTemplateText�J  ��  ��  " ��G� L   � ��� o   � ��F�F F0 !_previoussearchtemplateparsedtext !_previousSearchTemplateParsedText�G   �E�
�E conscase� �D�
�D consdiac� �C�
�C conshyph� �B�
�B conspunc� �A�@
�A conswhit�@   �?�>
�? consnume�>   ��� l     �=�<�;�=  �<  �;  � ��� l     �:�9�8�:  �9  �8  � ��� j   D H�7��7 :0 _previousformattemplatetext _previousFormatTemplateText� m   D G�� ���  � ��� l     ���� j   I M�6��6 H0 "_previousformattemplateparseditems "_previousFormatTemplateParsedItems� m   I L�� ���  � 4 . list of form {text, index or name, ..., text}   � ��� \   l i s t   o f   f o r m   { t e x t ,   i n d e x   o r   n a m e ,   . . . ,   t e x t }� ��� l     �5�4�3�5  �4  �3  � ��� i  N Q��� I      �2��1�2 ,0 _parseformattemplate _parseFormatTemplate� ��0� o      �/�/ 0 templatetext templateText�0  �1  � P     2���� k    1�� ��� Z    '���.�-� >   ��� o    �,�, 0 templatetext templateText� o    �+�+ :0 _previousformattemplatetext _previousFormatTemplateText� k    #�� ��� r    ��� I    �*��)�* (0 _parsetemplatetext _parseTemplateText� ��(� o    �'�' 0 templatetext templateText�(  �)  � o      �&�& H0 "_previousformattemplateparseditems "_previousFormatTemplateParsedItems� ��%� r    #��� o    �$�$ 0 templatetext templateText� o      �#�# :0 _previousformattemplatetext _previousFormatTemplateText�%  �.  �-  � ��"� L   ( 1�� n  ( 0��� 2  - /�!
�! 
cobj� o   ( -� �  H0 "_previousformattemplateparseditems "_previousFormatTemplateParsedItems�"  � ��
� conscase� ��
� consdiac� ��
� conshyph� ��
� conspunc� ��
� conswhit�  � ��
� consnume�  � ��� l     ����  �  �  � ��� l     ����  �  �  � ��� l     ����  � J D--------------------------------------------------------------------   � ��� � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -� � � l     ��     Find and Replace Suite    � .   F i n d   a n d   R e p l a c e   S u i t e   l     ����  �  �    l     �	�     find pattern   	 �

    f i n d   p a t t e r n  l     ��
�	�  �
  �	    i  R U I      ��� $0 _matchinforecord _matchInfoRecord  o      �� 0 
asocstring 
asocString  o      ��  0 asocmatchrange asocMatchRange  o      �� 0 
textoffset 
textOffset � o      �� 0 
recordtype 
recordType�  �   k     #  r     
 c      l     ��   n    !"! I    ��#���� *0 substringwithrange_ substringWithRange_# $��$ o    ����  0 asocmatchrange asocMatchRange��  ��  " o     ���� 0 
asocstring 
asocString�  �    m    ��
�� 
ctxt o      ���� 0 	foundtext 	foundText %&% l   '()' r    *+* [    ,-, o    ���� 0 
textoffset 
textOffset- l   .����. n    /0/ 1    ��
�� 
leng0 o    ���� 0 	foundtext 	foundText��  ��  + o      ����  0 nexttextoffset nextTextOffset( : 4 calculate the start index of the next AS text range   ) �11 h   c a l c u l a t e   t h e   s t a r t   i n d e x   o f   t h e   n e x t   A S   t e x t   r a n g e& 232 l   ��45��  4
 note: record keys are identifiers, not keywords, as 1. library-defined keywords are a huge pain to use outside of `tell script...` blocks and 2. importing the library's terminology into the global namespace via `use script...` is an excellent way to create keyword conflicts; only the class value is a keyword since Script Editor/OSAKit don't correctly handle records that use non-typename values (e.g. `{class:"matched text",...}`), but this shouldn't impact usability as it's really only used for informational purposes   5 �66   n o t e :   r e c o r d   k e y s   a r e   i d e n t i f i e r s ,   n o t   k e y w o r d s ,   a s   1 .   l i b r a r y - d e f i n e d   k e y w o r d s   a r e   a   h u g e   p a i n   t o   u s e   o u t s i d e   o f   ` t e l l   s c r i p t . . . `   b l o c k s   a n d   2 .   i m p o r t i n g   t h e   l i b r a r y ' s   t e r m i n o l o g y   i n t o   t h e   g l o b a l   n a m e s p a c e   v i a   ` u s e   s c r i p t . . . `   i s   a n   e x c e l l e n t   w a y   t o   c r e a t e   k e y w o r d   c o n f l i c t s ;   o n l y   t h e   c l a s s   v a l u e   i s   a   k e y w o r d   s i n c e   S c r i p t   E d i t o r / O S A K i t   d o n ' t   c o r r e c t l y   h a n d l e   r e c o r d s   t h a t   u s e   n o n - t y p e n a m e   v a l u e s   ( e . g .   ` { c l a s s : " m a t c h e d   t e x t " , . . . } ` ) ,   b u t   t h i s   s h o u l d n ' t   i m p a c t   u s a b i l i t y   a s   i t ' s   r e a l l y   o n l y   u s e d   f o r   i n f o r m a t i o n a l   p u r p o s e s3 7��7 L    #88 J    "99 :;: K    << ��=>
�� 
pcls= o    ���� 0 
recordtype 
recordType> ��?@�� 0 
startindex 
startIndex? o    ���� 0 
textoffset 
textOffset@ ��AB�� 0 endindex endIndexA \    CDC o    ����  0 nexttextoffset nextTextOffsetD m    ���� B ��E���� 0 	foundtext 	foundTextE o    ���� 0 	foundtext 	foundText��  ; F��F o     ����  0 nexttextoffset nextTextOffset��  ��   GHG l     ��������  ��  ��  H IJI l     ��������  ��  ��  J KLK i  V YMNM I      ��O���� 0 _matchrecords _matchRecordsO PQP o      ���� 0 
asocstring 
asocStringQ RSR o      ����  0 asocmatchrange asocMatchRangeS TUT o      ����  0 asocstartindex asocStartIndexU VWV o      ���� 0 
textoffset 
textOffsetW XYX o      ���� (0 nonmatchrecordtype nonMatchRecordTypeY Z��Z o      ���� "0 matchrecordtype matchRecordType��  ��  N k     V[[ \]\ l     ��^_��  ^TN important: NSString character indexes aren't guaranteed to be same as AS character indexes (AS sensibly counts glyphs but NSString only counts UTF16 codepoints, and a glyph may be composed of more than one codepoint), so reconstruct both non-matching and matching AS text values, and calculate accurate AS character ranges from those   _ �``�   i m p o r t a n t :   N S S t r i n g   c h a r a c t e r   i n d e x e s   a r e n ' t   g u a r a n t e e d   t o   b e   s a m e   a s   A S   c h a r a c t e r   i n d e x e s   ( A S   s e n s i b l y   c o u n t s   g l y p h s   b u t   N S S t r i n g   o n l y   c o u n t s   U T F 1 6   c o d e p o i n t s ,   a n d   a   g l y p h   m a y   b e   c o m p o s e d   o f   m o r e   t h a n   o n e   c o d e p o i n t ) ,   s o   r e c o n s t r u c t   b o t h   n o n - m a t c h i n g   a n d   m a t c h i n g   A S   t e x t   v a l u e s ,   a n d   c a l c u l a t e   a c c u r a t e   A S   c h a r a c t e r   r a n g e s   f r o m   t h o s e] aba r     cdc n    efe I    �������� 0 location  ��  ��  f o     ����  0 asocmatchrange asocMatchRanged o      ����  0 asocmatchstart asocMatchStartb ghg r    iji [    klk o    	����  0 asocmatchstart asocMatchStartl l  	 m����m n  	 non I   
 �������� 
0 length  ��  ��  o o   	 
����  0 asocmatchrange asocMatchRange��  ��  j o      ���� 0 asocmatchend asocMatchEndh pqp r    rsr K    tt ��uv�� 0 location  u o    ����  0 asocstartindex asocStartIndexv ��w���� 
0 length  w \    xyx o    ����  0 asocmatchstart asocMatchStarty o    ����  0 asocstartindex asocStartIndex��  s o      ���� &0 asocnonmatchrange asocNonMatchRangeq z{z r    5|}| I      ��~���� $0 _matchinforecord _matchInfoRecord~ � o    ���� 0 
asocstring 
asocString� ��� o     ���� &0 asocnonmatchrange asocNonMatchRange� ��� o     !���� 0 
textoffset 
textOffset� ���� o   ! "���� (0 nonmatchrecordtype nonMatchRecordType��  ��  } J      �� ��� o      ���� 0 nonmatchinfo nonMatchInfo� ���� o      ���� 0 
textoffset 
textOffset��  { ��� r   6 N��� I      ������� $0 _matchinforecord _matchInfoRecord� ��� o   7 8���� 0 
asocstring 
asocString� ��� o   8 9����  0 asocmatchrange asocMatchRange� ��� o   9 :���� 0 
textoffset 
textOffset� ���� o   : ;���� "0 matchrecordtype matchRecordType��  ��  � J      �� ��� o      ���� 0 	matchinfo 	matchInfo� ���� o      ���� 0 
textoffset 
textOffset��  � ���� L   O V�� J   O U�� ��� o   O P���� 0 nonmatchinfo nonMatchInfo� ��� o   P Q���� 0 	matchinfo 	matchInfo� ��� o   Q R���� 0 asocmatchend asocMatchEnd� ���� o   R S���� 0 
textoffset 
textOffset��  ��  L ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� i  Z ]��� I      ������� &0 _matchedgrouplist _matchedGroupList� ��� o      ���� 0 
asocstring 
asocString� ��� o      ���� 0 	asocmatch 	asocMatch� ��� o      ���� 0 
textoffset 
textOffset� ���� o      ���� &0 includenonmatches includeNonMatches��  ��  � k     ��� ��� r     ��� J     ����  � o      ���� "0 submatchresults subMatchResults� ��� r    ��� \    ��� l   
������ n   
��� I    
��������  0 numberofranges numberOfRanges��  ��  � o    ���� 0 	asocmatch 	asocMatch��  ��  � m   
 ���� � o      ���� 0 groupindexes groupIndexes� ��� Z    �������� ?    ��� o    ���� 0 groupindexes groupIndexes� m    ����  � k    ��� ��� r    ��� n   ��� I    ������� 0 rangeatindex_ rangeAtIndex_� ���� m    ����  ��  ��  � o    ���� 0 	asocmatch 	asocMatch� o      ���� (0 asocfullmatchrange asocFullMatchRange� ��� r    %��� n   #��� I    #�������� 0 location  ��  ��  � o    ���� (0 asocfullmatchrange asocFullMatchRange� o      ���� &0 asocnonmatchstart asocNonMatchStart� ��� r   & /��� [   & -��� o   & '���� &0 asocnonmatchstart asocNonMatchStart� l  ' ,���~� n  ' ,��� I   ( ,�}�|�{�} 
0 length  �|  �{  � o   ' (�z�z (0 asocfullmatchrange asocFullMatchRange�  �~  � o      �y�y $0 asocfullmatchend asocFullMatchEnd� ��� Y   0 ���x���w� k   : ��� ��� r   : o��� I      �v��u�v 0 _matchrecords _matchRecords� ��� o   ; <�t�t 0 
asocstring 
asocString� ��� n  < B��� I   = B�s��r�s 0 rangeatindex_ rangeAtIndex_� ��q� o   = >�p�p 0 i  �q  �r  � o   < =�o�o 0 	asocmatch 	asocMatch� ��� o   B C�n�n &0 asocnonmatchstart asocNonMatchStart� ��� o   C D�m�m 0 
textoffset 
textOffset� ��� o   D I�l�l (0 _unmatchedtexttype _UnmatchedTextType� ��k� o   I N�j�j &0 _matchedgrouptype _MatchedGroupType�k  �u  � J      �� ��� o      �i�i 0 nonmatchinfo nonMatchInfo� ��� o      �h�h 0 	matchinfo 	matchInfo� � � o      �g�g &0 asocnonmatchstart asocNonMatchStart  �f o      �e�e 0 
textoffset 
textOffset�f  �  Z  p |�d�c o   p q�b�b &0 includenonmatches includeNonMatches r   t x o   t u�a�a 0 nonmatchinfo nonMatchInfo n      	  ;   v w	 o   u v�`�` "0 submatchresults subMatchResults�d  �c   
�_
 r   } � o   } ~�^�^ 0 	matchinfo 	matchInfo n        ;    � o   ~ �]�] "0 submatchresults subMatchResults�_  �x 0 i  � m   3 4�\�\ � o   4 5�[�[ 0 groupindexes groupIndexes�w  � �Z Z   � ��Y�X o   � ��W�W &0 includenonmatches includeNonMatches k   � �  r   � � K   � � �V�V 0 location   o   � ��U�U &0 asocnonmatchstart asocNonMatchStart �T�S�T 
0 length   \   � � o   � ��R�R $0 asocfullmatchend asocFullMatchEnd o   � ��Q�Q &0 asocnonmatchstart asocNonMatchStart�S   o      �P�P &0 asocnonmatchrange asocNonMatchRange �O r   � � n   � � !  4   � ��N"
�N 
cobj" m   � ��M�M ! I   � ��L#�K�L $0 _matchinforecord _matchInfoRecord# $%$ o   � ��J�J 0 
asocstring 
asocString% &'& o   � ��I�I &0 asocnonmatchrange asocNonMatchRange' ()( o   � ��H�H 0 
textoffset 
textOffset) *�G* o   � ��F�F (0 _unmatchedtexttype _UnmatchedTextType�G  �K   n      +,+  ;   � �, o   � ��E�E "0 submatchresults subMatchResults�O  �Y  �X  �Z  ��  ��  � -�D- L   � �.. o   � ��C�C "0 submatchresults subMatchResults�D  � /0/ l     �B�A�@�B  �A  �@  0 121 l     �?�>�=�?  �>  �=  2 343 l     �<�;�:�<  �;  �:  4 565 i  ^ a787 I      �99�8�9 0 _findpattern _findPattern9 :;: o      �7�7 0 thetext theText; <=< o      �6�6 0 patterntext patternText= >?> o      �5�5 &0 includenonmatches includeNonMatches? @�4@ o      �3�3  0 includematches includeMatches�4  �8  8 k    AA BCB r     DED n    FGF I    �2H�1�2 (0 asbooleanparameter asBooleanParameterH IJI o    �0�0 &0 includenonmatches includeNonMatchesJ K�/K m    LL �MM  u n m a t c h e d   t e x t�/  �1  G o     �.�. 0 _support  E o      �-�- &0 includenonmatches includeNonMatchesC NON r    PQP n   RSR I    �,T�+�, (0 asbooleanparameter asBooleanParameterT UVU o    �*�*  0 includematches includeMatchesV W�)W m    XX �YY  m a t c h e d   t e x t�)  �+  S o    �(�( 0 _support  Q o      �'�'  0 includematches includeMatchesO Z[Z r    %\]\ I    #�&^�%�& B0 _asnsregularexpressionparameter _asNSRegularExpressionParameter^ _`_ o    �$�$ 0 patterntext patternText` a�#a m    bb �cc  f o r�#  �%  ] o      �"�" 0 asocpattern asocPattern[ ded r   & 2fgf n  & 0hih I   + 0�!j� �! ,0 asnormalizednsstring asNormalizedNSStringj k�k o   + ,�� 0 thetext theText�  �   i o   & +�� 0 _support  g o      �� 0 
asocstring 
asocStringe lml l  3 6nopn r   3 6qrq m   3 4��  r o      �� &0 asocnonmatchstart asocNonMatchStarto G A used to calculate NSRanges for non-matching portions of NSString   p �ss �   u s e d   t o   c a l c u l a t e   N S R a n g e s   f o r   n o n - m a t c h i n g   p o r t i o n s   o f   N S S t r i n gm tut l  7 :vwxv r   7 :yzy m   7 8�� z o      �� 0 
textoffset 
textOffsetw B < used to calculate correct AppleScript start and end indexes   x �{{ x   u s e d   t o   c a l c u l a t e   c o r r e c t   A p p l e S c r i p t   s t a r t   a n d   e n d   i n d e x e su |}| r   ; ?~~ J   ; =��   o      �� 0 
resultlist 
resultList} ��� l  @ @����  � @ : iterate over each non-matched + matched range in NSString   � ��� t   i t e r a t e   o v e r   e a c h   n o n - m a t c h e d   +   m a t c h e d   r a n g e   i n   N S S t r i n g� ��� r   @ Q��� n  @ O��� I   A O���� @0 matchesinstring_options_range_ matchesInString_options_range_� ��� o   A B�� 0 
asocstring 
asocString� ��� m   B C��  � ��� J   C K�� ��� m   C D��  � ��� n  D I��� I   E I���� 
0 length  �  �  � o   D E�
�
 0 
asocstring 
asocString�  �  �  � o   @ A�	�	 0 asocpattern asocPattern� o      ��  0 asocmatcharray asocMatchArray� ��� Y   R ������� k   b ��� ��� r   b j��� l  b h���� n  b h��� I   c h����  0 objectatindex_ objectAtIndex_� ��� o   c d� �  0 i  �  �  � o   b c����  0 asocmatcharray asocMatchArray�  �  � o      ���� 0 	asocmatch 	asocMatch� ��� l  k k������  � � � the first range in match identifies the text matched by the entire pattern, so generate records for full match and its preceding (unmatched) text   � ���$   t h e   f i r s t   r a n g e   i n   m a t c h   i d e n t i f i e s   t h e   t e x t   m a t c h e d   b y   t h e   e n t i r e   p a t t e r n ,   s o   g e n e r a t e   r e c o r d s   f o r   f u l l   m a t c h   a n d   i t s   p r e c e d i n g   ( u n m a t c h e d )   t e x t� ��� r   k ���� I      ������� 0 _matchrecords _matchRecords� ��� o   l m���� 0 
asocstring 
asocString� ��� n  m s��� I   n s������� 0 rangeatindex_ rangeAtIndex_� ���� m   n o����  ��  ��  � o   m n���� 0 	asocmatch 	asocMatch� ��� o   s t���� &0 asocnonmatchstart asocNonMatchStart� ��� o   t u���� 0 
textoffset 
textOffset� ��� o   u z���� (0 _unmatchedtexttype _UnmatchedTextType� ���� o   z ���� $0 _matchedtexttype _MatchedTextType��  ��  � J      �� ��� o      ���� 0 nonmatchinfo nonMatchInfo� ��� o      ���� 0 	matchinfo 	matchInfo� ��� o      ���� &0 asocnonmatchstart asocNonMatchStart� ���� o      ���� 0 
textoffset 
textOffset��  � ��� Z  � �������� o   � ����� &0 includenonmatches includeNonMatches� r   � ���� o   � ����� 0 nonmatchinfo nonMatchInfo� n      ���  ;   � �� o   � ����� 0 
resultlist 
resultList��  ��  � ���� Z   � �������� o   � �����  0 includematches includeMatches� k   � ��� ��� l  � �������  � any additional ranges in match identify text matched by group references within regexp pattern, e.g. "([0-9]{4})-([0-9]{2})-([0-9]{2})" will match `YYYY-MM-DD` style date strings, returning the entire text match, plus sub-matches representing year, month and day text   � ���   a n y   a d d i t i o n a l   r a n g e s   i n   m a t c h   i d e n t i f y   t e x t   m a t c h e d   b y   g r o u p   r e f e r e n c e s   w i t h i n   r e g e x p   p a t t e r n ,   e . g .   " ( [ 0 - 9 ] { 4 } ) - ( [ 0 - 9 ] { 2 } ) - ( [ 0 - 9 ] { 2 } ) "   w i l l   m a t c h   ` Y Y Y Y - M M - D D `   s t y l e   d a t e   s t r i n g s ,   r e t u r n i n g   t h e   e n t i r e   t e x t   m a t c h ,   p l u s   s u b - m a t c h e s   r e p r e s e n t i n g   y e a r ,   m o n t h   a n d   d a y   t e x t� ���� r   � ���� b   � ���� o   � ����� 0 	matchinfo 	matchInfo� K   � ��� ������� 0 foundgroups foundGroups� I   � �������� &0 _matchedgrouplist _matchedGroupList� ��� o   � ����� 0 
asocstring 
asocString� ��� o   � ����� 0 	asocmatch 	asocMatch� ��� n  � ���� o   � ����� 0 
startindex 
startIndex� o   � ����� 0 	matchinfo 	matchInfo� ���� o   � ����� &0 includenonmatches includeNonMatches��  ��  ��  � n      ���  ;   � �� o   � ����� 0 
resultlist 
resultList��  ��  ��  ��  � 0 i  � m   U V����  � \   V ]��� l  V [������ n  V [��� I   W [�������� 	0 count  ��  ��  � o   V W����  0 asocmatcharray asocMatchArray��  ��  � m   [ \���� �  � ��� l  � �������  � "  add final non-matched range   � ��� 8   a d d   f i n a l   n o n - m a t c h e d   r a n g e� ��� Z   �������� o   � ����� &0 includenonmatches includeNonMatches� k   ��� ��� r   � ���� c   � ���� l  � � ����  n  � � I   � ������� *0 substringfromindex_ substringFromIndex_ �� o   � ����� &0 asocnonmatchstart asocNonMatchStart��  ��   o   � ����� 0 
asocstring 
asocString��  ��  � m   � ���
�� 
ctxt� o      ���� 0 	foundtext 	foundText� �� r   � K   � � ��	

�� 
pcls	 o   � ����� (0 _unmatchedtexttype _UnmatchedTextType
 ���� 0 
startindex 
startIndex o   � ����� 0 
textoffset 
textOffset ���� 0 endindex endIndex n   � � 1   � ���
�� 
leng o   � ����� 0 thetext theText ������ 0 	foundtext 	foundText o   � ����� 0 	foundtext 	foundText��   n        ;   �  o   � ����� 0 
resultlist 
resultList��  ��  ��  � �� L   o  ���� 0 
resultlist 
resultList��  6  l     ��������  ��  ��    l     ��������  ��  ��    l     ����    -----    � 
 - - - - -   l     ��!"��  !   replace pattern   " �##     r e p l a c e   p a t t e r n  $%$ l     ��������  ��  ��  % &'& i  b e()( I      ��*���� "0 _replacepattern _replacePattern* +,+ o      ���� 0 thetext theText, -.- o      ���� 0 patterntext patternText. /��/ o      ���� 0 templatetext templateText��  ��  ) k    t00 121 r     343 n    
565 I    
��7���� ,0 asnormalizednsstring asNormalizedNSString7 8��8 o    ���� 0 thetext theText��  ��  6 o     ���� 0 _support  4 o      ���� 0 
asocstring 
asocString2 9:9 r    ;<; I    ��=���� B0 _asnsregularexpressionparameter _asNSRegularExpressionParameter= >?> o    ���� 0 patterntext patternText? @��@ m    AA �BB  f o r��  ��  < o      ���� 0 asocpattern asocPattern: C��C Z   tDE��FD =    "GHG l    I����I I    ��JK
�� .corecnte****       ****J J    LL M��M o    ���� 0 templatetext templateText��  K ��N��
�� 
koclN m    ��
�� 
scpt��  ��  ��  H m     !���� E k   %WOO PQP h   % ,��R�� 0 
resultlist 
resultListR j     ��S�� 
0 _list_  S J     ����  Q TUT r   - 0VWV m   - .����  W o      ���� &0 asocnonmatchstart asocNonMatchStartU XYX r   1 BZ[Z n  1 @\]\ I   2 @��^���� @0 matchesinstring_options_range_ matchesInString_options_range_^ _`_ o   2 3���� 0 
asocstring 
asocString` aba m   3 4����  b c��c J   4 <dd efe m   4 5��  f g�~g n  5 :hih I   6 :�}�|�{�} 
0 length  �|  �{  i o   5 6�z�z 0 
asocstring 
asocString�~  ��  ��  ] o   1 2�y�y 0 asocpattern asocPattern[ o      �x�x  0 asocmatcharray asocMatchArrayY jkj Y   Cl�wmn�vl k   S	oo pqp l  S [rstr r   S [uvu l  S Yw�u�tw n  S Yxyx I   T Y�sz�r�s  0 objectatindex_ objectAtIndex_z {�q{ o   T U�p�p 0 i  �q  �r  y o   S T�o�o  0 asocmatcharray asocMatchArray�u  �t  v o      �n�n 0 	asocmatch 	asocMatchs   a single match   t �||    a   s i n g l e   m a t c hq }~} l  \ d�� r   \ d��� l  \ b��m�l� n  \ b��� I   ] b�k��j�k 0 rangeatindex_ rangeAtIndex_� ��i� m   ] ^�h�h  �i  �j  � o   \ ]�g�g 0 	asocmatch 	asocMatch�m  �l  � o      �f�f  0 asocmatchrange asocMatchRange� "  the full range of the match   � ��� 8   t h e   f u l l   r a n g e   o f   t h e   m a t c h~ ��� r   e l��� n  e j��� I   f j�e�d�c�e 0 location  �d  �c  � o   e f�b�b  0 asocmatchrange asocMatchRange� o      �a�a  0 asocmatchstart asocMatchStart� ��� r   m w��� K   m u�� �`���` 0 location  � o   n o�_�_ &0 asocnonmatchstart asocNonMatchStart� �^��]�^ 
0 length  � \   p s��� o   p q�\�\  0 asocmatchstart asocMatchStart� o   q r�[�[ &0 asocnonmatchstart asocNonMatchStart�]  � o      �Z�Z &0 asocnonmatchrange asocNonMatchRange� ��� l  x ����� r   x ���� c   x ���� l  x ~��Y�X� n  x ~��� I   y ~�W��V�W *0 substringwithrange_ substringWithRange_� ��U� o   y z�T�T &0 asocnonmatchrange asocNonMatchRange�U  �V  � o   x y�S�S 0 
asocstring 
asocString�Y  �X  � m   ~ ��R
�R 
ctxt� n      ���  ;   � �� n  � ���� o   � ��Q�Q 
0 _list_  � o   � ��P�P 0 
resultlist 
resultList�   interstitial text   � ��� $   i n t e r s t i t i a l   t e x t� ��� l  � ����� r   � ���� c   � ���� l  � ���O�N� n  � ���� I   � ��M��L�M *0 substringwithrange_ substringWithRange_� ��K� o   � ��J�J  0 asocmatchrange asocMatchRange�K  �L  � o   � ��I�I 0 
asocstring 
asocString�O  �N  � m   � ��H
�H 
ctxt� o      �G�G 0 	foundtext 	foundText�   range 0 is full match   � ��� ,   r a n g e   0   i s   f u l l   m a t c h� ��� r   � ���� J   � ��F�F  � o      �E�E 0 foundgroups foundGroups� ��� Y   � ���D���C� l  � ����� r   � ���� c   � ���� l  � ���B�A� n  � ���� I   � ��@��?�@ *0 substringwithrange_ substringWithRange_� ��>� l  � ���=�<� n  � ���� I   � ��;��:�; 0 rangeatindex_ rangeAtIndex_� ��9� o   � ��8�8 0 j  �9  �:  � o   � ��7�7 0 	asocmatch 	asocMatch�=  �<  �>  �?  � o   � ��6�6 0 
asocstring 
asocString�B  �A  � m   � ��5
�5 
ctxt� n      ���  ;   � �� o   � ��4�4 0 foundgroups foundGroups� ' ! ranges above 0 are group matches   � ��� B   r a n g e s   a b o v e   0   a r e   g r o u p   m a t c h e s�D 0 j  � m   � ��3�3 � \   � ���� l  � ���2�1� n  � ���� I   � ��0�/�.�0  0 numberofranges numberOfRanges�/  �.  � o   � ��-�- 0 	asocmatch 	asocMatch�2  �1  � m   � ��,�, �C  � ��� Q   � ����� r   � ���� c   � ���� n  � ���� I   � ��+��*�+  0 replacepattern replacePattern� ��� o   � ��)�) 0 	foundtext 	foundText� ��(� o   � ��'�' 0 foundgroups foundGroups�(  �*  � o   � ��&�& 0 templatetext templateText� m   � ��%
�% 
ctxt� n      ���  ;   � �� n  � ���� o   � ��$�$ 
0 _list_  � o   � ��#�# 0 
resultlist 
resultList� R      �"��
�" .ascrerr ****      � ****� o      �!�! 0 etext eText� � ��
�  
errn� o      �� 0 enumber eNumber� ���
� 
erob� o      �� 0 efrom eFrom� ���
� 
errt� o      �� 
0 eto eTo�  � R   � ����
� .ascrerr ****      � ****� b   � ���� m   � ��� ��� � A n   e r r o r   o c c u r r e d   w h e n   c a l l i n g   t h e    r e p l a c i n g   w i t h    p a r a m e t e r  s    r e p l a c e P a t t e r n    h a n d l e r :  � o   � ��� 0 etext eText� ���
� 
errn� o   � ��� 0 enumber eNumber� � 
� 
erob  o   � ��� 0 efrom eFrom ��
� 
errt o   � ��� 
0 eto eTo�  � � l  	 r   	 [   	
	 o   ��  0 asocmatchstart asocMatchStart
 l �� n  I  ���
� 
0 length  �  �
   o  �	�	  0 asocmatchrange asocMatchRange�  �   o      �� &0 asocnonmatchstart asocNonMatchStart   asocMatchEnd    �    a s o c M a t c h E n d�  �w 0 i  m m   F G��  n \   G N l  G L�� n  G L I   H L���� 	0 count  �  �   o   G H��  0 asocmatcharray asocMatchArray�  �   m   L M� �  �v  k  l ����   "  add final non-matched range    � 8   a d d   f i n a l   n o n - m a t c h e d   r a n g e  l   r    c   !  l "����" n #$# I  ��%���� *0 substringfromindex_ substringFromIndex_% &��& o  ���� &0 asocnonmatchstart asocNonMatchStart��  ��  $ o  ���� 0 
asocstring 
asocString��  ��  ! m  ��
�� 
ctxt n      '('  ;  ( n )*) o  ���� 
0 _list_  * o  ���� 0 
resultlist 
resultList   last interstitial    �++ $   l a s t   i n t e r s t i t i a l ,-, r  !,./. n !(010 1  $(��
�� 
txdl1 1  !$��
�� 
ascr/ o      ���� 0 oldtids oldTIDs- 232 r  -8454 m  -066 �77  5 n     898 1  37��
�� 
txdl9 1  03��
�� 
ascr3 :;: r  9F<=< c  9B>?> n 9>@A@ o  :>���� 
0 _list_  A o  9:���� 0 
resultlist 
resultList? m  >A��
�� 
ctxt= o      ���� 0 
resulttext 
resultText; BCB r  GRDED o  GJ���� 0 oldtids oldTIDsE n     FGF 1  MQ��
�� 
txdlG 1  JM��
�� 
ascrC H��H L  SWII o  SV���� 0 
resulttext 
resultText��  ��  F L  ZtJJ c  ZsKLK l ZoM����M n ZoNON I  [o��P���� |0 <stringbyreplacingmatchesinstring_options_range_withtemplate_ <stringByReplacingMatchesInString_options_range_withTemplate_P QRQ l 
[\S����S o  [\���� 0 
asocstring 
asocString��  ��  R TUT m  \]����  U VWV J  ]eXX YZY m  ]^����  Z [��[ n ^c\]\ I  _c�������� 
0 length  ��  ��  ] o  ^_���� 0 
asocstring 
asocString��  W ^��^ I  ek��_���� ,0 _parsesearchtemplate _parseSearchTemplate_ `��` o  fg���� 0 templatetext templateText��  ��  ��  ��  O o  Z[���� 0 asocpattern asocPattern��  ��  L m  or��
�� 
ctxt��  ' aba l     ��������  ��  ��  b cdc l     ��������  ��  ��  d efe l     ��gh��  g  -----   h �ii 
 - - - - -f jkj l     ��lm��  l  
 find text   m �nn    f i n d   t e x tk opo l     ��������  ��  ��  p qrq i  f ists I      ��u���� 0 	_findtext 	_findTextu vwv o      ���� 0 thetext theTextw xyx o      ���� 0 fortext forTexty z{z o      ���� &0 includenonmatches includeNonMatches{ |��| o      ����  0 includematches includeMatches��  ��  t k    	}} ~~ r     ��� J     ����  � o      ���� 0 
resultlist 
resultList ��� r    
��� n   ��� 1    ��
�� 
txdl� 1    ��
�� 
ascr� o      ���� 0 oldtids oldTIDs� ��� r    ��� o    ���� 0 fortext forText� n     ��� 1    ��
�� 
txdl� 1    ��
�� 
ascr� ��� r    ��� m    ���� � o      ���� 0 
startindex 
startIndex� ��� r    ��� n    ��� 1    ��
�� 
leng� n    ��� 4    ���
�� 
citm� m    ���� � o    ���� 0 thetext theText� o      ���� 0 endindex endIndex� ��� Z    Q������� o    ���� &0 includenonmatches includeNonMatches� k   " M�� ��� Z   " ;������ B   " %��� o   " #���� 0 
startindex 
startIndex� o   # $���� 0 endindex endIndex� r   ( 5��� n   ( 3��� 7  ) 3����
�� 
ctxt� o   - /���� 0 
startindex 
startIndex� o   0 2���� 0 endindex endIndex� o   ( )���� 0 thetext theText� o      ���� 0 	foundtext 	foundText��  � r   8 ;��� m   8 9�� ���  � o      ���� 0 	foundtext 	foundText� ���� r   < M��� K   < J�� ����
�� 
pcls� o   = B���� (0 _unmatchedtexttype _UnmatchedTextType� ������ 0 
startindex 
startIndex� o   C D���� 0 
startindex 
startIndex� ������ 0 endindex endIndex� o   E F���� 0 endindex endIndex� ������� 0 	foundtext 	foundText� o   G H���� 0 	foundtext 	foundText��  � n      ���  ;   K L� o   J K���� 0 
resultlist 
resultList��  ��  ��  � ��� Y   R �������� k   b ��� ��� r   b g��� [   b e��� o   b c���� 0 endindex endIndex� m   c d���� � o      ���� 0 
startindex 
startIndex� ��� r   h }��� \   h {��� l  h k������ n   h k��� 1   i k��
�� 
leng� o   h i���� 0 thetext theText��  ��  � l  k z������ n   k z��� 1   x z��
�� 
leng� n   k x��� 7  l x����
�� 
ctxt� l  p s������ 4   p s���
�� 
citm� o   q r���� 0 i  ��  ��  � l  t w������ 4   t w���
�� 
citm� m   u v��������  ��  � o   k l���� 0 thetext theText��  ��  � o      ���� 0 endindex endIndex� ��� Z   ~ �������� o   ~ ����  0 includematches includeMatches� k   � ��� ��� Z   � ������ B   � ���� o   � ��~�~ 0 
startindex 
startIndex� o   � ��}�} 0 endindex endIndex� r   � ���� n   � ���� 7  � ��|��
�| 
ctxt� o   � ��{�{ 0 
startindex 
startIndex� o   � ��z�z 0 endindex endIndex� o   � ��y�y 0 thetext theText� o      �x�x 0 	foundtext 	foundText�  � r   � ���� m   � ��� ���  � o      �w�w 0 	foundtext 	foundText� ��v� r   � ���� K   � ��� �u��
�u 
pcls� o   � ��t�t $0 _matchedtexttype _MatchedTextType� �s���s 0 
startindex 
startIndex� o   � ��r�r 0 
startindex 
startIndex� �q���q 0 endindex endIndex� o   � ��p�p 0 endindex endIndex� �o���o 0 	foundtext 	foundText� o   � ��n�n 0 	foundtext 	foundText� �m �l�m 0 foundgroups foundGroups  J   � ��k�k  �l  � n        ;   � � o   � ��j�j 0 
resultlist 
resultList�v  ��  ��  �  r   � � [   � � o   � ��i�i 0 endindex endIndex m   � ��h�h  o      �g�g 0 
startindex 
startIndex 	
	 r   � � \   � � [   � � o   � ��f�f 0 
startindex 
startIndex l  � ��e�d n   � � 1   � ��c
�c 
leng n   � � 4   � ��b
�b 
citm o   � ��a�a 0 i   o   � ��`�` 0 thetext theText�e  �d   m   � ��_�_  o      �^�^ 0 endindex endIndex
 �] Z   � ��\�[ o   � ��Z�Z &0 includenonmatches includeNonMatches k   � �  Z   � ��Y B   � � !  o   � ��X�X 0 
startindex 
startIndex! o   � ��W�W 0 endindex endIndex r   � �"#" n   � �$%$ 7  � ��V&'
�V 
ctxt& o   � ��U�U 0 
startindex 
startIndex' o   � ��T�T 0 endindex endIndex% o   � ��S�S 0 thetext theText# o      �R�R 0 	foundtext 	foundText�Y   r   � �()( m   � �** �++  ) o      �Q�Q 0 	foundtext 	foundText ,�P, r   � �-.- K   � �// �O01
�O 
pcls0 o   � ��N�N (0 _unmatchedtexttype _UnmatchedTextType1 �M23�M 0 
startindex 
startIndex2 o   � ��L�L 0 
startindex 
startIndex3 �K45�K 0 endindex endIndex4 o   � ��J�J 0 endindex endIndex5 �I6�H�I 0 	foundtext 	foundText6 o   � ��G�G 0 	foundtext 	foundText�H  . n      787  ;   � �8 o   � ��F�F 0 
resultlist 
resultList�P  �\  �[  �]  �� 0 i  � m   U V�E�E � I  V ]�D9�C
�D .corecnte****       ****9 n   V Y:;: 2  W Y�B
�B 
citm; o   V W�A�A 0 thetext theText�C  ��  � <=< r  >?> o  �@�@ 0 oldtids oldTIDs? n     @A@ 1  �?
�? 
txdlA 1  �>
�> 
ascr= B�=B L  	CC o  �<�< 0 
resultlist 
resultList�=  r DED l     �;�:�9�;  �:  �9  E FGF l     �8�7�6�8  �7  �6  G HIH l     �5JK�5  J  -----   K �LL 
 - - - - -I MNM l     �4OP�4  O   replace text   P �QQ    r e p l a c e   t e x tN RSR l     �3�2�1�3  �2  �1  S TUT i  j mVWV I      �0X�/�0 0 _replacetext _replaceTextX YZY o      �.�. 0 thetext theTextZ [\[ o      �-�- 0 fortext forText\ ]�,] o      �+�+ 0 newtext newText�,  �/  W k    '^^ _`_ r     aba n    cdc 1    �*
�* 
txdld 1     �)
�) 
ascrb o      �(�( 0 oldtids oldTIDs` efe r    ghg o    �'�' 0 fortext forTexth n     iji 1    
�&
�& 
txdlj 1    �%
�% 
ascrf klk Z   mn�$om >    pqp l   r�#�"r I   �!st
�! .corecnte****       ****s J    uu v� v o    �� 0 newtext newText�   t �w�
� 
koclw m    �
� 
scpt�  �#  �"  q m    ��  n k    �xx yzy r    ;{|{ J    %}} ~~ J    ��   ��� m    �� � ��� n    #��� 1   ! #�
� 
leng� n    !��� 4    !��
� 
citm� m     �� � o    �� 0 thetext theText�  | J      �� ��� o      �� 0 
resultlist 
resultList� ��� o      �� 0 
startindex 
startIndex� ��� o      �� 0 endindex endIndex�  z ��� Z  < T����� B   < ?��� o   < =�� 0 
startindex 
startIndex� o   = >�� 0 endindex endIndex� r   B P��� n   B M��� 7  C M���
� 
ctxt� o   G I�
�
 0 
startindex 
startIndex� o   J L�	�	 0 endindex endIndex� o   B C�� 0 thetext theText� n      ���  ;   N O� o   M N�� 0 
resultlist 
resultList�  �  � ��� Y   U ������� k   e ��� ��� r   e j��� [   e h��� o   e f�� 0 endindex endIndex� m   f g�� � o      �� 0 
startindex 
startIndex� ��� r   k ���� \   k ~��� l  k n��� � n   k n��� 1   l n��
�� 
leng� o   k l���� 0 thetext theText�  �   � l  n }������ n   n }��� 1   { }��
�� 
leng� n   n {��� 7  o {����
�� 
ctxt� l  s v������ 4   s v���
�� 
citm� o   t u���� 0 i  ��  ��  � l  w z������ 4   w z���
�� 
citm� m   x y��������  ��  � o   n o���� 0 thetext theText��  ��  � o      ���� 0 endindex endIndex� ��� Z   � ������� B   � ���� o   � ����� 0 
startindex 
startIndex� o   � ����� 0 endindex endIndex� r   � ���� n   � ���� 7  � �����
�� 
ctxt� o   � ����� 0 
startindex 
startIndex� o   � ����� 0 endindex endIndex� o   � ����� 0 thetext theText� o      ���� 0 	foundtext 	foundText��  � r   � ���� m   � ��� ���  � o      ���� 0 	foundtext 	foundText� ��� Q   � ����� r   � ���� c   � ���� n  � ���� I   � �������� 0 replacetext replaceText� ���� o   � ����� 0 	foundtext 	foundText��  ��  � o   � ����� 0 newtext newText� m   � ���
�� 
ctxt� n      ���  ;   � �� o   � ����� 0 
resultlist 
resultList� R      ����
�� .ascrerr ****      � ****� o      ���� 0 etext eText� ����
�� 
errn� o      ���� 0 enumber eNumber� ����
�� 
erob� o      ���� 0 efrom eFrom� �����
�� 
errt� o      ���� 
0 eto eTo��  � R   � �����
�� .ascrerr ****      � ****� b   � ���� m   � ��� ��� � A n   e r r o r   o c c u r r e d   w h e n   c a l l i n g   t h e    r e p l a c i n g   w i t h    p a r a m e t e r  s    r e p l a c e T e x t    h a n d l e r :  � o   � ����� 0 etext eText� ����
�� 
errn� o   � ����� 0 enumber eNumber� ����
�� 
erob� o   � ����� 0 efrom eFrom� �����
�� 
errt� o   � ����� 
0 eto eTo��  � ��� r   � ���� [   � ���� o   � ����� 0 endindex endIndex� m   � ����� � o      ���� 0 
startindex 
startIndex� ��� r   � ���� \   � ���� [   � ���� o   � ����� 0 
startindex 
startIndex� l  � ������� n   � ���� 1   � ���
�� 
leng� n   � �� � 4   � ���
�� 
citm o   � ����� 0 i    o   � ����� 0 thetext theText��  ��  � m   � ����� � o      ���� 0 endindex endIndex� �� Z  � ����� B   � � o   � ����� 0 
startindex 
startIndex o   � ����� 0 endindex endIndex r   � � n   � �	
	 7  � ���
�� 
ctxt o   � ����� 0 
startindex 
startIndex o   � ����� 0 endindex endIndex
 o   � ����� 0 thetext theText n        ;   � � o   � ����� 0 
resultlist 
resultList��  ��  ��  � 0 i  � m   X Y���� � I  Y `����
�� .corecnte****       **** n   Y \ 2  Z \��
�� 
citm o   Y Z���� 0 thetext theText��  �  � �� r   � � m   � � �   n      1   � ���
�� 
txdl 1   � ���
�� 
ascr��  �$  o l  � k   �  l  � ��� ��     replace with text     �!! $   r e p l a c e   w i t h   t e x t "#" r   �$%$ n  �
&'& I  
��(���� "0 astextparameter asTextParameter( )*) o  ���� 0 newtext newText* +��+ m  ,, �--  r e p l a c i n g   w i t h��  ��  ' o   ����� 0 _support  % o      ���� 0 newtext newText# ./. l 0120 r  343 n 565 2 ��
�� 
citm6 o  ���� 0 thetext theText4 o      ���� 0 
resultlist 
resultList1 J D note: TID-based matching uses current considering/ignoring settings   2 �77 �   n o t e :   T I D - b a s e d   m a t c h i n g   u s e s   c u r r e n t   c o n s i d e r i n g / i g n o r i n g   s e t t i n g s/ 8��8 r  9:9 o  ���� 0 newtext newText: n     ;<; 1  ��
�� 
txdl< 1  ��
�� 
ascr��   * $ replace with callback-supplied text    �== H   r e p l a c e   w i t h   c a l l b a c k - s u p p l i e d   t e x tl >?> r  @A@ c  BCB o  ���� 0 
resultlist 
resultListC m  ��
�� 
ctxtA o      ���� 0 
resulttext 
resultText? DED r  $FGF o   ���� 0 oldtids oldTIDsG n     HIH 1  !#��
�� 
txdlI 1   !��
�� 
ascrE J��J L  %'KK o  %&���� 0 
resulttext 
resultText��  U LML l     ��������  ��  ��  M NON l     ��������  ��  ��  O PQP l     ��RS��  R  -----   S �TT 
 - - - - -Q UVU l     ��������  ��  ��  V WXW i  n qYZY I     ��[\
�� .Txt:Srchnull���     ctxt[ o      ���� 0 thetext theText\ ��]^
�� 
For_] o      ���� 0 fortext forText^ ��_`
�� 
Usin_ |����a��b��  ��  a o      ���� 0 matchformat matchFormat��  b l 
    c����c l     d����d m      ��
�� SerECmpI��  ��  ��  ��  ` ��ef
�� 
Reple |���g�~h��  �  g o      �}�} 0 newtext newText�~  h l     i�|�{i m      �z
�z 
msng�|  �{  f �yj�x
�y 
Retuj |�w�vk�ul�w  �v  k o      �t�t 0 resultformat resultFormat�u  l l     m�s�rm m      �q
�q RetEMatT�s  �r  �x  Z Q    )nopn k   qq rsr r    tut n   vwv I    �px�o�p "0 astextparameter asTextParameterx yzy o    	�n�n 0 thetext theTextz {�m{ m   	 
|| �}}  �m  �o  w o    �l�l 0 _support  u o      �k�k 0 thetext theTexts ~~ r    ��� n   ��� I    �j��i�j "0 astextparameter asTextParameter� ��� o    �h�h 0 fortext forText� ��g� m    �� ���  f o r�g  �i  � o    �f�f 0 _support  � o      �e�e 0 fortext forText ��� Z   8���d�c� =    $��� n   "��� 1     "�b
�b 
leng� o     �a�a 0 fortext forText� m   " #�`�`  � n  ' 4��� I   , 4�_��^�_ .0 throwinvalidparameter throwInvalidParameter� ��� o   , -�]�] 0 fortext forText� ��� m   - .�� ���  f o r� ��� m   . /�\
�\ 
ctxt� ��[� m   / 0�� ��� ( C a n  t   b e   e m p t y   t e x t .�[  �^  � o   ' ,�Z�Z 0 _support  �d  �c  � ��Y� Z   9���X�� =  9 <��� o   9 :�W�W 0 newtext newText� m   : ;�V
�V 
msng� l  ?p���� k   ?p�� ��� Z   ? j���U�T� =   ? D��� n  ? B��� 1   @ B�S
�S 
leng� o   ? @�R�R 0 thetext theText� m   B C�Q�Q  � Z   G f���P�� =  G J��� o   G H�O�O 0 resultformat resultFormat� m   H I�N
�N RetEMatT� L   M P�� J   M O�M�M  �P  � L   S f�� J   S e�� ��L� K   S c�� �K��
�K 
pcls� o   T Y�J�J (0 _unmatchedtexttype _UnmatchedTextType� �I���I 0 
startindex 
startIndex� m   Z [�H�H � �G���G 0 endindex endIndex� m   \ ]�F�F  � �E��D�E 0 	foundtext 	foundText� m   ^ _�� ���  �D  �L  �U  �T  � ��� Z   k ������ =  k n��� o   k l�C�C 0 resultformat resultFormat� m   l m�B
�B RetEMatT� r   q ���� J   q u�� ��� m   q r�A
�A boovfals� ��@� m   r s�?
�? boovtrue�@  � J      �� ��� o      �>�> &0 includenonmatches includeNonMatches� ��=� o      �<�<  0 includematches includeMatches�=  � ��� =  � ���� o   � ��;�; 0 resultformat resultFormat� m   � ��:
�: RetEUmaT� ��� r   � ���� J   � ��� ��� m   � ��9
�9 boovtrue� ��8� m   � ��7
�7 boovfals�8  � J      �� ��� o      �6�6 &0 includenonmatches includeNonMatches� ��5� o      �4�4  0 includematches includeMatches�5  � ��� =  � ���� o   � ��3�3 0 resultformat resultFormat� m   � ��2
�2 RetEAllT� ��1� r   � ���� J   � ��� ��� m   � ��0
�0 boovtrue� ��/� m   � ��.
�. boovtrue�/  � J      �� ��� o      �-�- &0 includenonmatches includeNonMatches� ��,� o      �+�+  0 includematches includeMatches�,  �1  � n  � ���� I   � ��*��)�* >0 throwinvalidconstantparameter throwInvalidConstantParameter� ��� o   � ��(�( 0 resultformat resultFormat� ��'� m   � ��� ���  r e t u r n i n g�'  �)  � o   � ��&�& 0 _support  � ��%� Z   �p�	 		� =  � �			 o   � ��$�$ 0 matchformat matchFormat	 m   � ��#
�# SerECmpI	  l  � �				 P   � �				
	 L   � �		 I   � ��"	�!�" 0 	_findtext 	_findText	 			 o   � �� �  0 thetext theText	 			 o   � ��� 0 fortext forText	 			 o   � ��� &0 includenonmatches includeNonMatches	 	�	 o   � ���  0 includematches includeMatches�  �!  		 �	
� consdiac	 �	
� conshyph	 �	
� conspunc	 ��
� conswhit�  	
 �	
� conscase	 ��
� consnume�  	   the default   	 �		    t h e   d e f a u l t	 			 =  �			 o   � ��� 0 matchformat matchFormat	 m   � �
� SerECmpE	 			 P  		 	!	 L  	"	" I  �	#�� 0 	_findtext 	_findText	# 	$	%	$ o  �� 0 thetext theText	% 	&	'	& o  �� 0 fortext forText	' 	(	)	( o  �� &0 includenonmatches includeNonMatches	) 	*�	* o  ��  0 includematches includeMatches�  �  	  �
	+
�
 conscase	+ �		,
�	 consdiac	, �	-
� conshyph	- �	.
� conspunc	. ��
� conswhit�  	! ��
� consnume�  	 	/	0	/ =  	1	2	1 o  �� 0 matchformat matchFormat	2 m  �
� SerECmpP	0 	3	4	3 L  #-	5	5 I  #,� 	6���  0 _findpattern _findPattern	6 	7	8	7 o  $%���� 0 thetext theText	8 	9	:	9 o  %&���� 0 fortext forText	: 	;	<	; o  &'���� &0 includenonmatches includeNonMatches	< 	=��	= o  '(����  0 includematches includeMatches��  ��  	4 	>	?	> = 05	@	A	@ o  01���� 0 matchformat matchFormat	A m  14��
�� SerECmpD	? 	B��	B k  8`	C	C 	D	E	D l 8U	F	G	H	F Z 8U	I	J����	I = 8=	K	L	K o  89���� 0 fortext forText	L m  9<	M	M �	N	N  	J n @Q	O	P	O I  EQ��	Q���� .0 throwinvalidparameter throwInvalidParameter	Q 	R	S	R o  EF���� 0 fortext forText	S 	T	U	T m  FI	V	V �	W	W  f o r	U 	X	Y	X m  IJ��
�� 
ctxt	Y 	Z��	Z m  JM	[	[ �	\	\ ~ O n l y   c o n t a i n s   c h a r a c t e r s   i g n o r e d   b y   t h e   c u r r e n t   c o n s i d e r a t i o n s .��  ��  	P o  @E���� 0 _support  ��  ��  	G�� checks if all characters in forText are ignored by current considering/ignoring settings (the alternative would be to return each character as a non-match separated by a zero-length match, but that's probably not what the user intended); note that unlike `aString's length = 0`, which is what library code normally uses to check for empty text, on this occasion we do want to take into account the current considering/ignoring settings so deliberately use `forText is ""` here. For example, when ignoring punctuation, searching for the TID `"!?"` is no different to searching for `""`, because all of its characters are being ignored when comparing the text being searched against the text being searched for. Thus, a simple `forText is ""` test can be used to check in advance if the text contains any matchable characters under the current considering/ignoring settings, and report a meaningful error if not.   	H �	]	]   c h e c k s   i f   a l l   c h a r a c t e r s   i n   f o r T e x t   a r e   i g n o r e d   b y   c u r r e n t   c o n s i d e r i n g / i g n o r i n g   s e t t i n g s   ( t h e   a l t e r n a t i v e   w o u l d   b e   t o   r e t u r n   e a c h   c h a r a c t e r   a s   a   n o n - m a t c h   s e p a r a t e d   b y   a   z e r o - l e n g t h   m a t c h ,   b u t   t h a t ' s   p r o b a b l y   n o t   w h a t   t h e   u s e r   i n t e n d e d ) ;   n o t e   t h a t   u n l i k e   ` a S t r i n g ' s   l e n g t h   =   0 ` ,   w h i c h   i s   w h a t   l i b r a r y   c o d e   n o r m a l l y   u s e s   t o   c h e c k   f o r   e m p t y   t e x t ,   o n   t h i s   o c c a s i o n   w e   d o   w a n t   t o   t a k e   i n t o   a c c o u n t   t h e   c u r r e n t   c o n s i d e r i n g / i g n o r i n g   s e t t i n g s   s o   d e l i b e r a t e l y   u s e   ` f o r T e x t   i s   " " `   h e r e .   F o r   e x a m p l e ,   w h e n   i g n o r i n g   p u n c t u a t i o n ,   s e a r c h i n g   f o r   t h e   T I D   ` " ! ? " `   i s   n o   d i f f e r e n t   t o   s e a r c h i n g   f o r   ` " " ` ,   b e c a u s e   a l l   o f   i t s   c h a r a c t e r s   a r e   b e i n g   i g n o r e d   w h e n   c o m p a r i n g   t h e   t e x t   b e i n g   s e a r c h e d   a g a i n s t   t h e   t e x t   b e i n g   s e a r c h e d   f o r .   T h u s ,   a   s i m p l e   ` f o r T e x t   i s   " " `   t e s t   c a n   b e   u s e d   t o   c h e c k   i n   a d v a n c e   i f   t h e   t e x t   c o n t a i n s   a n y   m a t c h a b l e   c h a r a c t e r s   u n d e r   t h e   c u r r e n t   c o n s i d e r i n g / i g n o r i n g   s e t t i n g s ,   a n d   r e p o r t   a   m e a n i n g f u l   e r r o r   i f   n o t .	E 	^��	^ L  V`	_	_ I  V_��	`���� 0 	_findtext 	_findText	` 	a	b	a o  WX���� 0 thetext theText	b 	c	d	c o  XY���� 0 fortext forText	d 	e	f	e o  YZ���� &0 includenonmatches includeNonMatches	f 	g��	g o  Z[����  0 includematches includeMatches��  ��  ��  ��  	 n cp	h	i	h I  hp��	j���� >0 throwinvalidconstantparameter throwInvalidConstantParameter	j 	k	l	k o  hi���� 0 matchformat matchFormat	l 	m��	m m  il	n	n �	o	o 
 u s i n g��  ��  	i o  ch���� 0 _support  �%  �   find matches   � �	p	p    f i n d   m a t c h e s�X  � l s	q	r	s	q k  s	t	t 	u	v	u Z s�	w	x����	w =  sx	y	z	y n sv	{	|	{ 1  tv��
�� 
leng	| o  st���� 0 thetext theText	z m  vw����  	x L  {	}	} m  {~	~	~ �		  ��  ��  	v 	���	� Z  �	�	�	�	�	� = ��	�	�	� o  ������ 0 matchformat matchFormat	� m  ����
�� SerECmpI	� l ��	�	�	�	� P  ��	�	�	�	� L  ��	�	� I  ����	����� 0 _replacetext _replaceText	� 	�	�	� o  ������ 0 thetext theText	� 	�	�	� o  ������ 0 fortext forText	� 	���	� o  ������ 0 newtext newText��  ��  	� ��	�
�� consdiac	� ��	�
�� conshyph	� ��	�
�� conspunc	� ����
�� conswhit��  	� ��	�
�� conscase	� ����
�� consnume��  	�   the default   	� �	�	�    t h e   d e f a u l t	� 	�	�	� = ��	�	�	� o  ������ 0 matchformat matchFormat	� m  ����
�� SerECmpE	� 	�	�	� P  ��	�	�	�	� L  ��	�	� I  ����	����� 0 _replacetext _replaceText	� 	�	�	� o  ������ 0 thetext theText	� 	�	�	� o  ������ 0 fortext forText	� 	���	� o  ������ 0 newtext newText��  ��  	� ��	�
�� conscase	� ��	�
�� consdiac	� ��	�
�� conshyph	� ��	�
�� conspunc	� ����
�� conswhit��  	� ����
�� consnume��  	� 	�	�	� = ��	�	�	� o  ������ 0 matchformat matchFormat	� m  ����
�� SerECmpP	� 	�	�	� L  ��	�	� I  ����	����� "0 _replacepattern _replacePattern	� 	�	�	� o  ������ 0 thetext theText	� 	�	�	� o  ������ 0 fortext forText	� 	���	� o  ������ 0 newtext newText��  ��  	� 	�	�	� = ��	�	�	� o  ������ 0 matchformat matchFormat	� m  ����
�� SerECmpD	� 	���	� k  �	�	� 	�	�	� Z ��	�	�����	� = ��	�	�	� o  ������ 0 fortext forText	� m  ��	�	� �	�	�  	� n ��	�	�	� I  ����	����� .0 throwinvalidparameter throwInvalidParameter	� 	�	�	� o  ������ 0 fortext forText	� 	�	�	� m  ��	�	� �	�	�  f o r	� 	�	�	� m  ����
�� 
ctxt	� 	���	� m  ��	�	� �	�	� ~ O n l y   c o n t a i n s   c h a r a c t e r s   i g n o r e d   b y   t h e   c u r r e n t   c o n s i d e r a t i o n s .��  ��  	� o  ������ 0 _support  ��  ��  	� 	���	� L  �	�	� I  ���	����� 0 _replacetext _replaceText	� 	�	�	� o  ������ 0 thetext theText	� 	�	�	� o  ������ 0 fortext forText	� 	���	� o  ������ 0 newtext newText��  ��  ��  ��  	� n 	�	�	� I  ��	����� >0 throwinvalidconstantparameter throwInvalidConstantParameter	� 	�	�	� o  ���� 0 matchformat matchFormat	� 	���	� m  	�	� �	�	� 
 u s i n g��  ��  	� o  ���� 0 _support  ��  	r   replace matches   	s �	�	�     r e p l a c e   m a t c h e s�Y  o R      ��	�	�
�� .ascrerr ****      � ****	� o      ���� 0 etext eText	� ��	�	�
�� 
errn	� o      ���� 0 enumber eNumber	� ��	�	�
�� 
erob	� o      ���� 0 efrom eFrom	� ��	���
�� 
errt	� o      ���� 
0 eto eTo��  p I  )��	����� 
0 _error  	� 	�	�	� m  	�	� �	�	�  s e a r c h   t e x t	� 	�	�	� o   ���� 0 etext eText	� 	�	�	� o   !���� 0 enumber eNumber	� 	�	�	� o  !"���� 0 efrom eFrom	� 	���	� o  "#���� 
0 eto eTo��  ��  X 	�	�	� l     ��������  ��  ��  	� 	�	�	� l     ��������  ��  ��  	� 	�	�	� i  r u
 

  I     ��
��
�� .Txt:EPatnull���     ctxt
 o      ���� 0 thetext theText��  
 Q     *



 L    

 c    


 l   
	����
	 n   




 I    �
�~� 40 escapedpatternforstring_ escapedPatternForString_
 
�}
 l   
�|�{
 n   


 I    �z
�y�z "0 astextparameter asTextParameter
 


 o    �x�x 0 thetext theText
 
�w
 m    

 �

  �w  �y  
 o    �v�v 0 _support  �|  �{  �}  �~  
 n   


 o    �u�u *0 nsregularexpression NSRegularExpression
 m    �t
�t misccura��  ��  
 m    �s
�s 
ctxt
 R      �r


�r .ascrerr ****      � ****
 o      �q�q 0 etext eText
 �p


�p 
errn
 o      �o�o 0 enumber eNumber
 �n


�n 
erob
 o      �m�m 0 efrom eFrom
 �l
�k
�l 
errt
 o      �j�j 
0 eto eTo�k  
 I     *�i
 �h�i 
0 _error  
  
!
"
! m   ! "
#
# �
$
$  e s c a p e   p a t t e r n
" 
%
&
% o   " #�g�g 0 etext eText
& 
'
(
' o   # $�f�f 0 enumber eNumber
( 
)
*
) o   $ %�e�e 0 efrom eFrom
* 
+�d
+ o   % &�c�c 
0 eto eTo�d  �h  	� 
,
-
, l     �b�a�`�b  �a  �`  
- 
.
/
. l     �_�^�]�_  �^  �]  
/ 
0
1
0 i  v y
2
3
2 I     �\
4�[
�\ .Txt:ETemnull���     ctxt
4 o      �Z�Z 0 thetext theText�[  
3 Q     -
5
6
7
5 L    
8
8 I    �Y
9�X�Y 0 	_jointext 	_joinText
9 
:
;
: I    �W
<�V�W 0 
_splittext 
_splitText
< 
=
>
= n   
?
@
? I   
 �U
A�T�U "0 astextparameter asTextParameter
A 
B
C
B o   
 �S�S 0 thetext theText
C 
D�R
D m    
E
E �
F
F  �R  �T  
@ o    
�Q�Q 0 _support  
> 
G�P
G m    
H
H �
I
I  \�P  �V  
; 
J�O
J m    
K
K �
L
L  \ \�O  �X  
6 R      �N
M
N
�N .ascrerr ****      � ****
M o      �M�M 0 etext eText
N �L
O
P
�L 
errn
O o      �K�K 0 enumber eNumber
P �J
Q
R
�J 
erob
Q o      �I�I 0 efrom eFrom
R �H
S�G
�H 
errt
S o      �F�F 
0 eto eTo�G  
7 I   # -�E
T�D�E 
0 _error  
T 
U
V
U m   $ %
W
W �
X
X  e s c a p e   t e m p l a t e
V 
Y
Z
Y o   % &�C�C 0 etext eText
Z 
[
\
[ o   & '�B�B 0 enumber eNumber
\ 
]
^
] o   ' (�A�A 0 efrom eFrom
^ 
_�@
_ o   ( )�?�? 
0 eto eTo�@  �D  
1 
`
a
` l     �>�=�<�>  �=  �<  
a 
b
c
b l     �;�:�9�;  �:  �9  
c 
d
e
d l     �8
f
g�8  
f J D--------------------------------------------------------------------   
g �
h
h � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
e 
i
j
i l     �7
k
l�7  
k   Conversion Suite   
l �
m
m "   C o n v e r s i o n   S u i t e
j 
n
o
n l     �6�5�4�6  �5  �4  
o 
p
q
p i  z }
r
s
r I     �3
t
u
�3 .Txt:UppTnull���     ctxt
t o      �2�2 0 thetext theText
u �1
v�0
�1 
Loca
v |�/�.
w�-
x�/  �.  
w o      �,�, 0 
localecode 
localeCode�-  
x m      �+
�+ 
msng�0  
s Q     P
y
z
{
y k    >
|
| 
}
~
} r    

�
 n   
�
�
� I    �*
��)�* 0 
asnsstring 
asNSString
� 
��(
� n   
�
�
� I    �'
��&�' "0 astextparameter asTextParameter
� 
�
�
� o    �%�% 0 thetext theText
� 
��$
� m    
�
� �
�
�  �$  �&  
� o    �#�# 0 _support  �(  �)  
� o    �"�" 0 _support  
� o      �!�! 0 
asocstring 
asocString
~ 
�� 
� Z    >
�
��
�
� =   
�
�
� o    �� 0 
localecode 
localeCode
� m    �
� 
msng
� L     (
�
� c     '
�
�
� l    %
���
� n    %
�
�
� I   ! %���� "0 uppercasestring uppercaseString�  �  
� o     !�� 0 
asocstring 
asocString�  �  
� m   % &�
� 
ctxt�  
� L   + >
�
� c   + =
�
�
� l  + ;
���
� n  + ;
�
�
� I   , ;�
��� 80 uppercasestringwithlocale_ uppercaseStringWithLocale_
� 
��
� l  , 7
���
� n  , 7
�
�
� I   1 7�
��� *0 asnslocaleparameter asNSLocaleParameter
� 
�
�
� o   1 2�� 0 
localecode 
localeCode
� 
��
� m   2 3
�
� �
�
�  f o r   l o c a l e�  �  
� o   , 1�
�
 0 _support  �  �  �  �  
� o   + ,�	�	 0 
asocstring 
asocString�  �  
� m   ; <�
� 
ctxt�   
z R      �
�
�
� .ascrerr ****      � ****
� o      �� 0 etext eText
� �
�
�
� 
errn
� o      �� 0 enumber eNumber
� �
�
�
� 
erob
� o      �� 0 efrom eFrom
� �
�� 
� 
errt
� o      ���� 
0 eto eTo�   
{ I   F P��
����� 
0 _error  
� 
�
�
� m   G H
�
� �
�
�  u p p e r c a s e   t e x t
� 
�
�
� o   H I���� 0 etext eText
� 
�
�
� o   I J���� 0 enumber eNumber
� 
�
�
� o   J K���� 0 efrom eFrom
� 
���
� o   K L���� 
0 eto eTo��  ��  
q 
�
�
� l     ��������  ��  ��  
� 
�
�
� l     ��������  ��  ��  
� 
�
�
� i  ~ �
�
�
� I     ��
�
�
�� .Txt:CapTnull���     ctxt
� o      ���� 0 thetext theText
� ��
���
�� 
Loca
� |����
���
���  ��  
� o      ���� 0 
localecode 
localeCode��  
� m      ��
�� 
msng��  
� Q     P
�
�
�
� k    >
�
� 
�
�
� r    
�
�
� n   
�
�
� I    ��
����� 0 
asnsstring 
asNSString
� 
���
� n   
�
�
� I    ��
����� "0 astextparameter asTextParameter
� 
�
�
� o    ���� 0 thetext theText
� 
���
� m    
�
� �
�
�  ��  ��  
� o    ���� 0 _support  ��  ��  
� o    ���� 0 _support  
� o      ���� 0 
asocstring 
asocString
� 
���
� Z    >
�
���
�
� =   
�
�
� o    ���� 0 
localecode 
localeCode
� m    ��
�� 
msng
� L     (
�
� c     '
�
�
� l    %
�����
� n    %
�
�
� I   ! %�������� &0 capitalizedstring capitalizedString��  ��  
� o     !���� 0 
asocstring 
asocString��  ��  
� m   % &��
�� 
ctxt��  
� L   + >
�
� c   + =
�
�
� l  + ;
�����
� n  + ;
�
�
� I   , ;��
����� <0 capitalizedstringwithlocale_ capitalizedStringWithLocale_
� 
���
� l  , 7
�����
� n  , 7
�
�
� I   1 7��
����� *0 asnslocaleparameter asNSLocaleParameter
� 
�
�
� o   1 2���� 0 
localecode 
localeCode
� 
���
� m   2 3
�
� �
�
�  f o r   l o c a l e��  ��  
� o   , 1���� 0 _support  ��  ��  ��  ��  
� o   + ,���� 0 
asocstring 
asocString��  ��  
� m   ; <��
�� 
ctxt��  
� R      ��
�
�
�� .ascrerr ****      � ****
� o      ���� 0 etext eText
� ��
�
�
�� 
errn
� o      ���� 0 enumber eNumber
� ��
� 
�� 
erob
� o      ���� 0 efrom eFrom  ����
�� 
errt o      ���� 
0 eto eTo��  
� I   F P������ 
0 _error    m   G H �  c a p i t a l i z e   t e x t  o   H I���� 0 etext eText 	
	 o   I J���� 0 enumber eNumber
  o   J K���� 0 efrom eFrom �� o   K L���� 
0 eto eTo��  ��  
�  l     ��������  ��  ��    l     ��������  ��  ��    i  � � I     ��
�� .Txt:LowTnull���     ctxt o      ���� 0 thetext theText ����
�� 
Loca |��������  ��   o      ���� 0 
localecode 
localeCode��   m      ��
�� 
msng��   Q     P k    >   r    !"! n   #$# I    ��%���� 0 
asnsstring 
asNSString% &��& n   '(' I    ��)���� "0 astextparameter asTextParameter) *+* o    ���� 0 thetext theText+ ,��, m    -- �..  ��  ��  ( o    ���� 0 _support  ��  ��  $ o    ���� 0 _support  " o      ���� 0 
asocstring 
asocString  /��/ Z    >01��20 =   343 o    ���� 0 
localecode 
localeCode4 m    ��
�� 
msng1 L     (55 c     '676 l    %8����8 n    %9:9 I   ! %�������� "0 lowercasestring lowercaseString��  ��  : o     !���� 0 
asocstring 
asocString��  ��  7 m   % &��
�� 
ctxt��  2 L   + >;; c   + =<=< l  + ;>����> n  + ;?@? I   , ;��A���� 80 lowercasestringwithlocale_ lowercaseStringWithLocale_A B��B l  , 7C����C n  , 7DED I   1 7��F���� *0 asnslocaleparameter asNSLocaleParameterF GHG o   1 2���� 0 
localecode 
localeCodeH I��I m   2 3JJ �KK  f o r   l o c a l e��  ��  E o   , 1���� 0 _support  ��  ��  ��  ��  @ o   + ,���� 0 
asocstring 
asocString��  ��  = m   ; <��
�� 
ctxt��   R      ��LM
�� .ascrerr ****      � ****L o      ���� 0 etext eTextM ��NO
�� 
errnN o      ���� 0 enumber eNumberO �PQ
� 
erobP o      �~�~ 0 efrom eFromQ �}R�|
�} 
errtR o      �{�{ 
0 eto eTo�|   I   F P�zS�y�z 
0 _error  S TUT m   G HVV �WW  l o w e r c a s e   t e x tU XYX o   H I�x�x 0 etext eTextY Z[Z o   I J�w�w 0 enumber eNumber[ \]\ o   J K�v�v 0 efrom eFrom] ^�u^ o   K L�t�t 
0 eto eTo�u  �y   _`_ l     �s�r�q�s  �r  �q  ` aba l     �p�o�n�p  �o  �n  b cdc i  � �efe I     �mgh
�m .Txt:FTxtnull���     ctxtg o      �l�l 0 templatetext templateTexth �ki�j
�k 
Usini |�i�hj�gk�i  �h  j o      �f�f 0 	thevalues 	theValues�g  k J      �e�e  �j  f Q     �lmnl P    �opqo k    �rr sts r    uvu I    �dw�c�d ,0 _parseformattemplate _parseFormatTemplatew x�bx n  	 yzy I    �a{�`�a "0 astextparameter asTextParameter{ |}| o    �_�_ 0 templatetext templateText} ~�^~ m     ���  �^  �`  z o   	 �]�] 0 _support  �b  �c  v o      �\�\ 0 templateitems templateItemst ��� r    ��� m    �[�[ � o      �Z�Z 0 i  � ��� Q    ����� Z   " ����Y�� =   " -��� l  " +��X�W� I  " +�V��
�V .corecnte****       ****� J   " %�� ��U� o   " #�T�T 0 	thevalues 	theValues�U  � �S��R
�S 
kocl� m   & '�Q
�Q 
scpt�R  �X  �W  � m   + ,�P�P � l  0 S���� Y   0 S��O���� r   = N��� c   = I��� n  = G��� I   > G�N��M�N 0 getitem getItem� ��L� e   > C�� n   > C��� 4   ? B�K�
�K 
cobj� o   @ A�J�J 0 i  � o   > ?�I�I 0 templateitems templateItems�L  �M  � o   = >�H�H 0 	thevalues 	theValues� m   G H�G
�G 
ctxt� n      ��� 4   J M�F�
�F 
cobj� o   K L�E�E 0 i  � o   I J�D�D 0 templateitems templateItems�O 0 i  � m   3 4�C�C � n  4 8��� 1   5 7�B
�B 
leng� o   4 5�A�A 0 templateitems templateItems� m   8 9�@�@ � S M assume it's a script object with getItem handler (e.g. DictionaryCollection)   � ��� �   a s s u m e   i t ' s   a   s c r i p t   o b j e c t   w i t h   g e t I t e m   h a n d l e r   ( e . g .   D i c t i o n a r y C o l l e c t i o n )�Y  � l  V ����� k   V ��� ��� r   V c��� n  V a��� I   [ a�?��>�? "0 aslistparameter asListParameter� ��� o   [ \�=�= 0 	thevalues 	theValues� ��<� m   \ ]�� ��� 
 u s i n g�<  �>  � o   V [�;�; 0 _support  � o      �:�: 0 	thevalues 	theValues� ��9� Y   d ���8���� r   q ���� c   q ~��� l  q |��7�6� e   q |�� n  q |��� 4   r {�5�
�5 
cobj� l  s z��4�3� c   s z��� l  s x��2�1� e   s x�� n   s x��� 4   t w�0�
�0 
cobj� o   u v�/�/ 0 i  � o   s t�.�. 0 templateitems templateItems�2  �1  � m   x y�-
�- 
long�4  �3  � o   q r�,�, 0 	thevalues 	theValues�7  �6  � m   | }�+
�+ 
ctxt� n      ��� 4    ��*�
�* 
cobj� o   � ��)�) 0 i  � o   ~ �(�( 0 templateitems templateItems�8 0 i  � m   g h�'�' � n  h l��� 1   i k�&
�& 
leng� o   h i�%�% 0 templateitems templateItems� m   l m�$�$ �9  � * $ it's a list (or a single-item list)   � ��� H   i t ' s   a   l i s t   ( o r   a   s i n g l e - i t e m   l i s t )� R      �#��
�# .ascrerr ****      � ****� o      �"�" 0 etext eText� �!��
�! 
errn� o      � �  0 enumber eNumber� ���
� 
erob� o      �� 0 efrom eFrom� ���
� 
errt� o      �� 
0 eto eTo�  � R   � ����
� .ascrerr ****      � ****� b   � ���� b   � ���� b   � ���� m   � ��� ��� : C a n  t   s u b s i t u t e   p l a c e h o l d e r   � n   � ���� 4   � ���
� 
cobj� o   � ��� 0 i  � o   � ��� 0 templateitems templateItems� m   � ��� ���   :  � o   � ��� 0 etext eText� ���
� 
errn� o   � ��� 0 enumber eNumber� ���
� 
erob� o   � ��� 0 efrom eFrom� ���
� 
errt� o   � ��� 
0 eto eTo�  � ��� L   � ��� I   � ����� 0 	_jointext 	_joinText� ��� o   � ��� 0 templateitems templateItems� ��
� m   � ��� ���  �
  �  �  p �	�
�	 conscase� ��
� consdiac� ��
� conshyph� � 
� conspunc  ��
� conswhit�  q ��
� consnume�  m R      �
� .ascrerr ****      � **** o      � �  0 etext eText ��
�� 
errn o      ���� 0 enumber eNumber ��
�� 
erob o      ���� 0 efrom eFrom ����
�� 
errt o      ���� 
0 eto eTo��  n I   � ������� 
0 _error   	
	 m   � � �  f o r m a t   t e x t
  o   � ����� 0 etext eText  o   � ����� 0 enumber eNumber  o   � ����� 0 efrom eFrom �� o   � ����� 
0 eto eTo��  ��  d  l     ��������  ��  ��    l     ��������  ��  ��    i  � � I     ��
�� .Txt:Normnull���     ctxt o      ���� 0 thetext theText ��
�� 
NoFo |���� ��!��  ��    o      ���� 0 nopts nOpts��  ! J      "" #��# m      ��
�� LiBrLiOX��   ��$��
�� 
Loca$ |����%��&��  ��  % o      ���� 0 
localecode 
localeCode��  & l     '����' m      (( �))  n o n e��  ��  ��   Q    *+,* k   i-- ./. r    010 n   232 I    ��4���� "0 astextparameter asTextParameter4 565 o    	���� 0 thetext theText6 7��7 m   	 
88 �99  ��  ��  3 o    ���� 0 _support  1 o      ���� 0 thetext theText/ :;: r    <=< n   >?> I    ��@���� "0 aslistparameter asListParameter@ ABA o    ���� 0 nopts nOptsB C��C m    DD �EE 
 u s i n g��  ��  ? o    ���� 0 _support  = o      ���� 0 nopts nOpts; FGF l   ��HI��  H   common case shortcuts   I �JJ ,   c o m m o n   c a s e   s h o r t c u t sG KLK Z   -MN����M =    $OPO n   "QRQ 1     "��
�� 
lengR o     ���� 0 thetext theTextP m   " #����  N L   ' )SS m   ' (TT �UU  ��  ��  L VWV Z  . DXY����X =  . 3Z[Z o   . /���� 0 nopts nOpts[ J   / 2\\ ]��] m   / 0��
�� LiBrLiOX��  Y L   6 @^^ I   6 ?��_���� 0 	_jointext 	_joinText_ `a` n  7 :bcb 2  8 :��
�� 
cparc o   7 8���� 0 thetext theTexta d��d 1   : ;��
�� 
lnfd��  ��  ��  ��  W efe Z  E Rgh����g =  E Iiji o   E F���� 0 nopts nOptsj J   F H����  h L   L Nkk o   L M���� 0 thetext theText��  ��  f lml l  S S��no��  n &   else fully process options list   o �pp @   e l s e   f u l l y   p r o c e s s   o p t i o n s   l i s tm qrq Q   Sbstus k   VGvv wxw Z   V gyz��{y E  V [|}| o   V W���� 0 nopts nOpts} J   W Z~~ �� m   W X��
�� LiBrLiOX��  z r   ^ a��� 1   ^ _��
�� 
lnfd� o      ���� 0 	linebreak 	lineBreak��  { r   d g��� m   d e��
�� 
msng� o      ���� 0 	linebreak 	lineBreakx ��� Z   h �������� E  h m��� o   h i���� 0 nopts nOpts� J   i l�� ���� m   i j��
�� LiBrLiCM��  � k   p ��� ��� Z  p �������� >  p s��� o   p q���� 0 	linebreak 	lineBreak� m   q r��
�� 
msng� R   v |����
�� .ascrerr ****      � ****� m   z {�� ��� > C o n f l i c t i n g   l i n e   b r e a k   o p t i o n s .� �����
�� 
errn� m   x y����f��  ��  ��  � ��� Z  � �������� =   � ���� n  � ���� 1   � ���
�� 
leng� o   � ����� 0 nopts nOpts� m   � ����� � L   � ��� I   � �������� 0 	_jointext 	_joinText� ��� n  � ���� 2  � ���
�� 
cpar� o   � ����� 0 thetext theText� ���� o   � ���
�� 
ret ��  ��  ��  ��  � ���� r   � ���� o   � ���
�� 
ret � o      ���� 0 	linebreak 	lineBreak��  ��  ��  � ��� Z   � �������� E  � ���� o   � ����� 0 nopts nOpts� J   � ��� ���� m   � ���
�� LiBrLiWi��  � k   � ��� ��� Z  � �������� >  � ���� o   � ����� 0 	linebreak 	lineBreak� m   � ���
�� 
msng� R   � �����
�� .ascrerr ****      � ****� m   � ��� ��� > C o n f l i c t i n g   l i n e   b r e a k   o p t i o n s .� �����
�� 
errn� m   � �����f��  ��  ��  � ��� Z  � �������� =   � ���� n  � ���� 1   � ���
�� 
leng� o   � ����� 0 nopts nOpts� m   � ����� � L   � ��� I   � �������� 0 	_jointext 	_joinText� ��� n  � ���� 2  � ���
�� 
cpar� o   � ��� 0 thetext theText� ��~� b   � ���� o   � ��}
�} 
ret � 1   � ��|
�| 
lnfd�~  ��  ��  ��  � ��{� r   � ���� b   � ���� o   � ��z
�z 
ret � 1   � ��y
�y 
lnfd� o      �x�x 0 	linebreak 	lineBreak�{  ��  ��  � ��� r   � ���� n  � ���� I   � ��w��v�w 0 
asnsstring 
asNSString� ��u� o   � ��t�t 0 thetext theText�u  �v  � o   � ��s�s 0 _support  � o      �r�r 0 
asocstring 
asocString� ��� l  � ��q���q  � , & fold case, diacriticals, and/or width   � ��� L   f o l d   c a s e ,   d i a c r i t i c a l s ,   a n d / o r   w i d t h� ��� r   � ���� m   � ��p�p  � o      �o�o 0 foldingflags foldingFlags� ��� Z  ����n�m� E  � ���� o   � ��l�l 0 nopts nOpts� J   � ��� ��k� m   � ��j
�j NoFoNoCa�k  � r   � ��� [   � ���� o   � ��i�i 0 foldingflags foldingFlags� m   � ��h�h � o      �g�g 0 foldingflags foldingFlags�n  �m  � ��� Z ���f�e� E ��� o  �d�d 0 nopts nOpts� J  �� ��c� m  	�b
�b NoFoNoDi�c  � r  ��� [  ��� o  �a�a 0 foldingflags foldingFlags� m  �`�` �� o      �_�_ 0 foldingflags foldingFlags�f  �e  � ��� Z 0� �^�]� E " o  �\�\ 0 nopts nOpts J  ! �[ m  �Z
�Z NoFoNoWi�[    r  %, [  %* o  %&�Y�Y 0 foldingflags foldingFlags m  &)�X�X  o      �W�W 0 foldingflags foldingFlags�^  �]  � 	
	 Z 1P�V�U >  14 o  12�T�T 0 foldingflags foldingFlags m  23�S�S   r  7L n 7J I  8J�R�Q�R H0 "stringbyfoldingwithoptions_locale_ "stringByFoldingWithOptions_locale_  o  89�P�P 0 foldingflags foldingFlags �O l 9F�N�M n 9F I  >F�L�K�L *0 asnslocaleparameter asNSLocaleParameter  o  >?�J�J 0 
localecode 
localeCode �I m  ?B �  f o r   l o c a l e�I  �K   o  9>�H�H 0 _support  �N  �M  �O  �Q   o  78�G�G 0 
asocstring 
asocString o      �F�F 0 
asocstring 
asocString�V  �U  
  !  l QQ�E"#�E  " !  normalize white space runs   # �$$ 6   n o r m a l i z e   w h i t e   s p a c e   r u n s! %&% Z  Q'()�D' E QX*+* o  QR�C�C 0 nopts nOpts+ J  RW,, -�B- m  RU�A
�A NoFoNoSp�B  ( k  [�.. /0/ l [y1231 r  [y454 n [w676 I  \w�@8�?�@ �0 >stringbyreplacingoccurrencesofstring_withstring_options_range_ >stringByReplacingOccurrencesOfString_withString_options_range_8 9:9 m  \_;; �<< ^ \ A ( ? : \ u 2 0 2 8 | \ u 2 0 2 9 | \ s ) + | ( ? : \ u 2 0 2 8 | \ u 2 0 2 9 | \ s ) + \ z: =>= m  _b?? �@@  > ABA l biC�>�=C n biDED o  ei�<�< 60 nsregularexpressionsearch NSRegularExpressionSearchE m  be�;
�; misccura�>  �=  B F�:F J  iqGG HIH m  ij�9�9  I J�8J n joKLK I  ko�7�6�5�7 
0 length  �6  �5  L o  jk�4�4 0 
asocstring 
asocString�8  �:  �?  7 o  [\�3�3 0 
asocstring 
asocString5 o      �2�2 0 
asocstring 
asocString2 ( " trim leading/trailing white space   3 �MM D   t r i m   l e a d i n g / t r a i l i n g   w h i t e   s p a c e0 N�1N Z  z�OP�0QO = z}RSR o  z{�/�/ 0 	linebreak 	lineBreakS m  {|�.
�. 
msngP l ��TUVT r  ��WXW n ��YZY I  ���-[�,�- �0 >stringbyreplacingoccurrencesofstring_withstring_options_range_ >stringByReplacingOccurrencesOfString_withString_options_range_[ \]\ m  ��^^ �__ @ ( ? : \ r \ n | \ r | \ n | \ u 2 0 2 8 | \ u 2 0 2 9 | \ s ) +] `a` 1  ���+
�+ 
spaca bcb l ��d�*�)d n ��efe o  ���(�( 60 nsregularexpressionsearch NSRegularExpressionSearchf m  ���'
�' misccura�*  �)  c g�&g J  ��hh iji m  ���%�%  j k�$k n ��lml I  ���#�"�!�# 
0 length  �"  �!  m o  ��� �  0 
asocstring 
asocString�$  �&  �,  Z o  ���� 0 
asocstring 
asocStringX o      �� 0 
asocstring 
asocStringU b \ also convert line breaks (including Unicode line and paragraph separators) to single spaces   V �nn �   a l s o   c o n v e r t   l i n e   b r e a k s   ( i n c l u d i n g   U n i c o d e   l i n e   a n d   p a r a g r a p h   s e p a r a t o r s )   t o   s i n g l e   s p a c e s�0  Q l ��opqo k  ��rr sts r  ��uvu n ��wxw I  ���y�� �0 >stringbyreplacingoccurrencesofstring_withstring_options_range_ >stringByReplacingOccurrencesOfString_withString_options_range_y z{z m  ��|| �}} N ( ? : \ s * ( ? : \ r \ n | \ r | \ n | \ u 2 0 2 8 | \ u 2 0 2 9 ) ) + \ s *{ ~~ o  ���� 0 	linebreak 	lineBreak ��� l ������ n ����� o  ���� 60 nsregularexpressionsearch NSRegularExpressionSearch� m  ���
� misccura�  �  � ��� J  ���� ��� m  ����  � ��� n ����� I  ������ 
0 length  �  �  � o  ���� 0 
asocstring 
asocString�  �  �  x o  ���� 0 
asocstring 
asocStringv o      �� 0 
asocstring 
asocStringt ��� r  ����� n ����� I  ������ �0 >stringbyreplacingoccurrencesofstring_withstring_options_range_ >stringByReplacingOccurrencesOfString_withString_options_range_� ��� m  ���� ���  [ \ f \ t \ p { Z } ] +� ��� 1  ���

�
 
spac� ��� l ����	�� n ����� o  ���� 60 nsregularexpressionsearch NSRegularExpressionSearch� m  ���
� misccura�	  �  � ��� J  ���� ��� m  ����  � ��� n ����� I  ����� � 
0 length  �  �   � o  ������ 0 
asocstring 
asocString�  �  �  � o  ������ 0 
asocstring 
asocString� o      ���� 0 
asocstring 
asocString�  p � � convert line break runs (including any other white space) to single `lineBreak`, and any other white space runs (tabs, spaces, etc) to single spaces   q ���*   c o n v e r t   l i n e   b r e a k   r u n s   ( i n c l u d i n g   a n y   o t h e r   w h i t e   s p a c e )   t o   s i n g l e   ` l i n e B r e a k ` ,   a n d   a n y   o t h e r   w h i t e   s p a c e   r u n s   ( t a b s ,   s p a c e s ,   e t c )   t o   s i n g l e   s p a c e s�1  ) ��� > ����� o  ������ 0 	linebreak 	lineBreak� m  ����
�� 
msng� ���� l ����� r  ���� n ����� I  ��������� �0 >stringbyreplacingoccurrencesofstring_withstring_options_range_ >stringByReplacingOccurrencesOfString_withString_options_range_� ��� m  ���� ��� 0 \ r \ n | \ r | \ n | \ u 2 0 2 8 | \ u 2 0 2 9� ��� o  ������ 0 	linebreak 	lineBreak� ��� l �������� n ����� o  ������ 60 nsregularexpressionsearch NSRegularExpressionSearch� m  ����
�� misccura��  ��  � ���� J  ���� ��� m  ������  � ���� n ����� I  ���������� 
0 length  ��  ��  � o  ������ 0 
asocstring 
asocString��  ��  ��  � o  ������ 0 
asocstring 
asocString� o      ���� 0 
asocstring 
asocString�   standardize line breaks   � ��� 0   s t a n d a r d i z e   l i n e   b r e a k s��  �D  & ��� l ������  � 8 2 apply punctuation, ASCII-only transforms (10.11+)   � ��� d   a p p l y   p u n c t u a t i o n ,   A S C I I - o n l y   t r a n s f o r m s   ( 1 0 . 1 1 + )� ��� Z  ������� E ��� o  ���� 0 nopts nOpts� J  �� ���� m  
��
�� NoFoNoSP��  � k  @�� ��� Z 4������� G  %��� E ��� o  ���� 0 nopts nOpts� J  �� ���� m  ��
�� NoFoNoTP��  � E !��� o  ���� 0 nopts nOpts� J   �� ���� m  ��
�� NoFoNoAO��  � R  (0����
�� .ascrerr ****      � ****� m  ,/�� ��� J C o n f l i c t i n g   p u n c t u a t i o n / A S C I I   o p t i o n s� �����
�� 
errn� m  *+����f��  ��  ��  � ���� r  5@��� n 5>��� I  6>������� H0 "stringbyapplyingtransform_reverse_ "stringByApplyingTransform_reverse_� ��� l 69������ m  69�� ���  A n y - P u b l i s h i n g��  ��  � ���� m  9:��
�� boovfals��  ��  � o  56���� 0 
asocstring 
asocString� o      ���� 0 
asocstring 
asocString��  � ��� E CJ��� o  CD���� 0 nopts nOpts� J  DI�� ���� m  DG��
�� NoFoNoTP��  � ��� k  Mo�� ��� Z Mc������� E MT   o  MN���� 0 nopts nOpts J  NS �� m  NQ��
�� NoFoNoAO��  � R  W_��
�� .ascrerr ****      � **** m  [^ � L C o n f l i c t i n g   p u n c t u a t i o n / A S C I I   o p t i o n s . ����
�� 
errn m  YZ����f��  ��  ��  � 	��	 r  do

 n dm I  em������ H0 "stringbyapplyingtransform_reverse_ "stringByApplyingTransform_reverse_  l eh���� m  eh �  P u b l i s h i n g - A n y��  ��   �� m  hi��
�� boovfals��  ��   o  de���� 0 
asocstring 
asocString o      ���� 0 
asocstring 
asocString��  �  E ry o  rs���� 0 nopts nOpts J  sx �� m  sv��
�� NoFoNoAO��   �� k  |�  r  |�  n |�!"! I  }���#���� H0 "stringbyapplyingtransform_reverse_ "stringByApplyingTransform_reverse_# $%$ l }�&����& m  }�'' �(( * A n y - L a t i n ; L a t i n - A S C I I��  ��  % )��) m  ����
�� boovfals��  ��  " o  |}���� 0 
asocstring 
asocString  o      ���� 0 
asocstring 
asocString *��* r  ��+,+ n ��-.- I  ����/���� �0 >stringbyreplacingoccurrencesofstring_withstring_options_range_ >stringByReplacingOccurrencesOfString_withString_options_range_/ 010 m  ��22 �33 , [ ^ \ r \ n \ t \ u 0 0 2 0 - \ u 0 0 7 e ]1 454 m  ��66 �77  ?5 898 l ��:����: n ��;<; o  ������ 60 nsregularexpressionsearch NSRegularExpressionSearch< m  ����
�� misccura��  ��  9 =��= J  ��>> ?@? m  ������  @ A��A n ��BCB I  ���������� 
0 length  ��  ��  C o  ������ 0 
asocstring 
asocString��  ��  ��  . o  ������ 0 
asocstring 
asocString, o      ���� 0 
asocstring 
asocString��  ��  ��  � DED l ����FG��  F 6 0 convert to specified Unicode normalization form   G �HH `   c o n v e r t   t o   s p e c i f i e d   U n i c o d e   n o r m a l i z a t i o n   f o r mE IJI Z  ��KL��MK E ��NON o  ������ 0 nopts nOptsO J  ��PP Q��Q m  ����
�� NoFoNo_C��  L k  ��RR STS r  ��UVU n ��WXW I  ���������� N0 %precomposedstringwithcanonicalmapping %precomposedStringWithCanonicalMapping��  ��  X o  ������ 0 
asocstring 
asocStringV o      ���� 0 
asocstring 
asocStringT Y��Y r  ��Z[Z m  ����
�� boovtrue[ o      ���� 0 didnormalize didNormalize��  ��  M r  ��\]\ m  ����
�� boovfals] o      ���� 0 didnormalize didNormalizeJ ^_^ Z  ��`a����` E ��bcb o  ������ 0 nopts nOptsc J  ��dd e��e m  ����
�� NoFoNo_D��  a k  ��ff ghg Z ��ij����i o  ������ 0 didnormalize didNormalizej R  ����kl
�� .ascrerr ****      � ****k m  ��mm �nn 8 C o n f l i c t i n g   U n i c o d e   o p t i o n s .l ��o��
�� 
errno m  ������f��  ��  ��  h pqp r  ��rsr n ��tut I  ���������� L0 $decomposedstringwithcanonicalmapping $decomposedStringWithCanonicalMapping��  ��  u o  ������ 0 
asocstring 
asocStrings o      �� 0 
asocstring 
asocStringq v�~v r  ��wxw m  ���}
�} boovtruex o      �|�| 0 didnormalize didNormalize�~  ��  ��  _ yzy Z  �{|�{�z{ E ��}~} o  ���y�y 0 nopts nOpts~ J  �� ��x� m  ���w
�w NoFoNoKC�x  | k  ��� ��� Z ����v�u� o  ���t�t 0 didnormalize didNormalize� R   �s��
�s .ascrerr ****      � ****� m  �� ��� 8 C o n f l i c t i n g   U n i c o d e   o p t i o n s .� �r��q
�r 
errn� m  �p�pf�q  �v  �u  � ��� r  ��� n ��� I  �o�n�m�o V0 )precomposedstringwithcompatibilitymapping )precomposedStringWithCompatibilityMapping�n  �m  � o  �l�l 0 
asocstring 
asocString� o      �k�k 0 
asocstring 
asocString� ��j� r  ��� m  �i
�i boovtrue� o      �h�h 0 didnormalize didNormalize�j  �{  �z  z ��g� Z  G���f�e� E $��� o  �d�d 0 nopts nOpts� J  #�� ��c� m  !�b
�b NoFoNoKD�c  � k  'C�� ��� Z '7���a�`� o  '(�_�_ 0 didnormalize didNormalize� R  +3�^��
�^ .ascrerr ****      � ****� m  /2�� ��� 8 C o n f l i c t i n g   U n i c o d e   o p t i o n s .� �]��\
�] 
errn� m  -.�[�[f�\  �a  �`  � ��� r  8?��� n 8=��� I  9=�Z�Y�X�Z T0 (decomposedstringwithcompatibilitymapping (decomposedStringWithCompatibilityMapping�Y  �X  � o  89�W�W 0 
asocstring 
asocString� o      �V�V 0 
asocstring 
asocString� ��U� r  @C��� m  @A�T
�T boovtrue� o      �S�S 0 didnormalize didNormalize�U  �f  �e  �g  t R      �R��
�R .ascrerr ****      � ****� o      �Q�Q 0 etext eText� �P��O
�P 
errn� m      �N�Nf�O  u n Ob��� I  Tb�M��L�M .0 throwinvalidparameter throwInvalidParameter� ��� o  TU�K�K 0 nopts nOpts� ��� m  UX�� ��� 
 u s i n g� ��� m  X[�J
�J 
list� ��I� o  [\�H�H 0 etext eText�I  �L  � o  OT�G�G 0 _support  r ��F� L  ci�� c  ch��� o  cd�E�E 0 
asocstring 
asocString� m  dg�D
�D 
ctxt�F  + R      �C��
�C .ascrerr ****      � ****� o      �B�B 0 etext eText� �A��
�A 
errn� o      �@�@ 0 enumber eNumber� �?��
�? 
erob� o      �>�> 0 efrom eFrom� �=��<
�= 
errt� o      �;�; 
0 eto eTo�<  , I  q�:��9�: 
0 _error  � ��� m  ru�� ���  n o r m a l i z e   t e x t� ��� o  uv�8�8 0 etext eText� ��� o  vw�7�7 0 enumber eNumber� ��� o  wx�6�6 0 efrom eFrom� ��5� o  xy�4�4 
0 eto eTo�5  �9   ��� l     �3�2�1�3  �2  �1  � ��� l     �0�/�.�0  �/  �.  � ��� i  � ���� I     �-��
�- .Txt:PadTnull���     ctxt� o      �,�, 0 thetext theText� �+��
�+ 
toPl� o      �*�* 0 	textwidth 	textWidth� �)��
�) 
Char� |�(�'��&��(  �'  � o      �%�% 0 padtext padText�&  � l     ��$�#� m      �� ���                                  �$  �#  � �"��!
�" 
From� |� �����   �  � o      �� 0 whichend whichEnd�  � l     ���� m      �
� LeTrLCha�  �  �!  � Q    ���� k   �� ��� r    ��� n   ��� I    ���� "0 astextparameter asTextParameter� ��� o    	�� 0 thetext theText� ��� m   	 
�� ���  �  �  � o    �� 0 _support  � o      �� 0 thetext theText� ��� r    ��� n   � � I    ��� (0 asintegerparameter asIntegerParameter  o    �� 0 	textwidth 	textWidth � m     �  t o   p l a c e s�  �    o    �� 0 _support  � o      �� 0 	textwidth 	textWidth�  r    &	
	 \    $ o     �� 0 	textwidth 	textWidth l    #�� n    # 1   ! #�

�
 
leng o     !�	�	 0 thetext theText�  �  
 o      �� 0 
widthtoadd 
widthToAdd  Z  ' 3�� B   ' * o   ' (�� 0 
widthtoadd 
widthToAdd m   ( )��   L   - / o   - .�� 0 thetext theText�  �    r   4 A n  4 ? I   9 ?��� "0 astextparameter asTextParameter  o   9 :� �  0 padtext padText  ��  m   : ;!! �"" 
 u s i n g��  �   o   4 9���� 0 _support   o      ���� 0 padtext padText #$# r   B G%&% n  B E'(' 1   C E��
�� 
leng( o   B C���� 0 padtext padText& o      ���� 0 padsize padSize$ )*) Z  H a+,����+ =   H M-.- n  H K/0/ 1   I K��
�� 
leng0 o   H I���� 0 padtext padText. m   K L����  , n  P ]121 I   U ]��3���� .0 throwinvalidparameter throwInvalidParameter3 454 o   U V���� 0 padtext padText5 676 m   V W88 �99 
 u s i n g7 :;: m   W X��
�� 
ctxt; <��< m   X Y== �>> ( C a n  t   b e   e m p t y   t e x t .��  ��  2 o   P U���� 0 _support  ��  ��  * ?@? V   b xABA r   n sCDC b   n qEFE o   n o���� 0 padtext padTextF o   o p���� 0 padtext padTextD o      ���� 0 padtext padTextB A   f mGHG n  f iIJI 1   g i��
�� 
lengJ o   f g���� 0 padtext padTextH l  i lK����K [   i lLML o   i j���� 0 
widthtoadd 
widthToAddM o   j k���� 0 padsize padSize��  ��  @ N��N Z   yOPQRO =  y |STS o   y z���� 0 whichend whichEndT m   z {��
�� LeTrLChaP L    �UU b    �VWV l   �X����X n   �YZY 7  � ���[\
�� 
ctxt[ m   � ����� \ o   � ����� 0 
widthtoadd 
widthToAddZ o    ����� 0 padtext padText��  ��  W o   � ����� 0 thetext theTextQ ]^] =  � �_`_ o   � ����� 0 whichend whichEnd` m   � ���
�� LeTrTCha^ aba k   � �cc ded r   � �fgf `   � �hih l  � �j����j n  � �klk 1   � ���
�� 
lengl o   � ����� 0 thetext theText��  ��  i o   � ����� 0 padsize padSizeg o      ���� 0 	padoffset 	padOffsete m��m L   � �nn b   � �opo o   � ����� 0 thetext theTextp l  � �q����q n  � �rsr 7  � ���tu
�� 
ctxtt l  � �v����v [   � �wxw m   � ����� x o   � ����� 0 	padoffset 	padOffset��  ��  u l  � �y����y [   � �z{z o   � ����� 0 	padoffset 	padOffset{ o   � ����� 0 
widthtoadd 
widthToAdd��  ��  s o   � ����� 0 padtext padText��  ��  ��  b |}| =  � �~~ o   � ����� 0 whichend whichEnd m   � ���
�� LeTrBCha} ���� k   � ��� ��� Z  � �������� ?   � ���� o   � ����� 0 
widthtoadd 
widthToAdd� m   � ����� � r   � ���� b   � ���� n  � ���� 7  � �����
�� 
ctxt� m   � ����� � l  � ������� _   � ���� o   � ����� 0 
widthtoadd 
widthToAdd� m   � ����� ��  ��  � o   � ����� 0 padtext padText� o   � ����� 0 thetext theText� o      ���� 0 thetext theText��  ��  � ��� r   � ���� `   � ���� l  � ������� n  � ���� 1   � ���
�� 
leng� o   � ����� 0 thetext theText��  ��  � o   � ����� 0 padsize padSize� o      ���� 0 	padoffset 	padOffset� ���� L   � ��� b   � ���� o   � ����� 0 thetext theText� l  � ������� n  � ���� 7  � �����
�� 
ctxt� l  � ������� [   � ���� m   � ����� � o   � ����� 0 	padoffset 	padOffset��  ��  � l  � ������� [   � ���� o   � ����� 0 	padoffset 	padOffset� _   � ���� l  � ������� [   � ���� o   � ����� 0 
widthtoadd 
widthToAdd� m   � ����� ��  ��  � m   � ����� ��  ��  � o   � ����� 0 padtext padText��  ��  ��  ��  R n  ���� I   �������� >0 throwinvalidconstantparameter throwInvalidConstantParameter� ��� o   � ����� 0 whichend whichEnd� ���� m   � ��� ���  a d d i n g��  ��  � o   � ����� 0 _support  ��  � R      ����
�� .ascrerr ****      � ****� o      ���� 0 etext eText� ����
�� 
errn� o      ���� 0 enumber eNumber� ����
�� 
erob� o      ���� 0 efrom eFrom� �����
�� 
errt� o      ���� 
0 eto eTo��  � I  	������� 
0 _error  � ��� m  
�� ���  p a d   t e x t� ��� o  ���� 0 etext eText� ��� o  ���� 0 enumber eNumber� ��� o  ���� 0 efrom eFrom� ���� o  ���� 
0 eto eTo��  ��  � ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� i  � ���� I     ����
�� .Txt:SliTnull���     ctxt� o      ���� 0 thetext theText� ����
�� 
FIdx� |��~��}��  �~  � o      �|�| 0 
startindex 
startIndex�}  � l     ��{�z� m      �y
�y 
msng�{  �z  � �x��w
�x 
TIdx� |�v�u��t��v  �u  � o      �s�s 0 endindex endIndex�t  � l     ��r�q� m      �p
�p 
msng�r  �q  �w  � Q    ����� k   ��� ��� r    ��� n   ��� I    �o��n�o "0 astextparameter asTextParameter� ��� o    	�m�m 0 thetext theText� ��l� m   	 
�� ���  �l  �n  � o    �k�k 0 _support  � o      �j�j 0 thetext theText� ��� r    ��� n   ��� 1    �i
�i 
leng� o    �h�h 0 thetext theText� o      �g�g 0 	thelength 	theLength� ��� Z    S���f�e� =    ��� o    �d�d 0 	thelength 	theLength� m    �c�c  � k    O�� ��� l   �b���b  � � � note: index 0 is always disallowed as its position is ambiguous, being both before index 1 at start of text and after index -1 at end of text   � ���   n o t e :   i n d e x   0   i s   a l w a y s   d i s a l l o w e d   a s   i t s   p o s i t i o n   i s   a m b i g u o u s ,   b e i n g   b o t h   b e f o r e   i n d e x   1   a t   s t a r t   o f   t e x t   a n d   a f t e r   i n d e x   - 1   a t   e n d   o f   t e x t�    Z   4�a�` =      o    �_�_ 0 
startindex 
startIndex m    �^�^   n  # 0 I   ( 0�]�\�] .0 throwinvalidparameter throwInvalidParameter 	
	 o   ( )�[�[ 0 
startindex 
startIndex
  m   ) * �  f r o m  m   * +�Z
�Z 
long �Y m   + , � " I n d e x   c a n  t   b e   0 .�Y  �\   o   # (�X�X 0 _support  �a  �`    Z  5 L�W�V =   5 8 o   5 6�U�U 0 endindex endIndex m   6 7�T�T   n  ; H I   @ H�S�R�S .0 throwinvalidparameter throwInvalidParameter  o   @ A�Q�Q 0 endindex endIndex   m   A B!! �""  t o  #$# m   B C�P
�P 
long$ %�O% m   C D&& �'' " I n d e x   c a n  t   b e   0 .�O  �R   o   ; @�N�N 0 _support  �W  �V   (�M( L   M O)) m   M N** �++  �M  �f  �e  � ,-, Z   T �./0�L. >  T W121 o   T U�K�K 0 
startindex 
startIndex2 m   U V�J
�J 
msng/ k   Z �33 454 r   Z g676 n  Z e898 I   _ e�I:�H�I (0 asintegerparameter asIntegerParameter: ;<; o   _ `�G�G 0 
startindex 
startIndex< =�F= m   ` a>> �??  f r o m�F  �H  9 o   Z _�E�E 0 _support  7 o      �D�D 0 
startindex 
startIndex5 @A@ Z  h BC�C�BB =   h kDED o   h i�A�A 0 
startindex 
startIndexE m   i j�@�@  C n  n {FGF I   s {�?H�>�? .0 throwinvalidparameter throwInvalidParameterH IJI o   s t�=�= 0 
startindex 
startIndexJ KLK m   t uMM �NN  f r o mL OPO m   u v�<
�< 
longP Q�;Q m   v wRR �SS " I n d e x   c a n  t   b e   0 .�;  �>  G o   n s�:�: 0 _support  �C  �B  A T�9T Z   � �UV�8�7U =  � �WXW o   � ��6�6 0 endindex endIndexX m   � ��5
�5 
msngV Z   � �YZ[\Y A   � �]^] o   � ��4�4 0 
startindex 
startIndex^ d   � �__ o   � ��3�3 0 	thelength 	theLengthZ L   � �`` o   � ��2�2 0 thetext theText[ aba ?   � �cdc o   � ��1�1 0 
startindex 
startIndexd o   � ��0�0 0 	thelength 	theLengthb e�/e L   � �ff m   � �gg �hh  �/  \ L   � �ii n  � �jkj 7  � ��.lm
�. 
ctxtl o   � ��-�- 0 
startindex 
startIndexm m   � ��,�,��k o   � ��+�+ 0 thetext theText�8  �7  �9  0 non =  � �pqp o   � ��*�* 0 endindex endIndexq m   � ��)
�) 
msngo r�(r R   � ��'st
�' .ascrerr ****      � ****s m   � �uu �vv v E x p e c t e d    f r o m    a n d / o r    t o    p a r a m e t e r   b u t   r e c e i v e d   n e i t h e r .t �&w�%
�& 
errnw m   � ��$�$�[�%  �(  �L  - xyx Z   �4z{�#�"z >  � �|}| o   � ��!�! 0 endindex endIndex} m   � �� 
�  
msng{ k   �0~~ � r   � ���� n  � ���� I   � ����� (0 asintegerparameter asIntegerParameter� ��� o   � ��� 0 endindex endIndex� ��� m   � ��� ���  t o�  �  � o   � ��� 0 _support  � o      �� 0 endindex endIndex� ��� Z  � ������ =   � ���� o   � ��� 0 endindex endIndex� m   � ���  � n  � ���� I   � ����� .0 throwinvalidparameter throwInvalidParameter� ��� o   � ��� 0 endindex endIndex� ��� m   � ��� ���  t o� ��� m   � ��
� 
long� ��� m   � ��� ��� " I n d e x   c a n  t   b e   0 .�  �  � o   � ��� 0 _support  �  �  � ��� Z   �0����� =  ���� o   � ��� 0 
startindex 
startIndex� m   � �
� 
msng� Z  ,����� A  ��� o  �
�
 0 endindex endIndex� d  �� o  �	�	 0 	thelength 	theLength� L  �� m  �� ���  � ��� ?  ��� o  �� 0 endindex endIndex� o  �� 0 	thelength 	theLength� ��� L  �� o  �� 0 thetext theText�  � L  ,�� n +��� 7 *���
� 
ctxt� m  $&�� � o  ')�� 0 endindex endIndex� o  �� 0 thetext theText�  �  �  �#  �"  y ��� l 55� ���   � + % both start and end indexes are given   � ��� J   b o t h   s t a r t   a n d   e n d   i n d e x e s   a r e   g i v e n� ��� Z 5F������� A  58��� o  56���� 0 
startindex 
startIndex� m  67����  � r  ;B��� [  ;@��� [  ;>��� o  ;<���� 0 	thelength 	theLength� m  <=���� � o  >?���� 0 
startindex 
startIndex� o      ���� 0 
startindex 
startIndex��  ��  � ��� Z GX������� A  GJ��� o  GH���� 0 endindex endIndex� m  HI����  � r  MT��� [  MR��� [  MP��� o  MN���� 0 	thelength 	theLength� m  NO���� � o  PQ���� 0 endindex endIndex� o      ���� 0 endindex endIndex��  ��  � ��� Z Y�������� G  Y���� G  Yp��� ?  Y\��� o  YZ���� 0 
startindex 
startIndex� o  Z[���� 0 endindex endIndex� F  _l��� A  _b��� o  _`���� 0 
startindex 
startIndex� m  `a���� � A  eh��� o  ef���� 0 endindex endIndex� l 
fg������ m  fg���� ��  ��  � F  s���� ?  sv��� o  st���� 0 
startindex 
startIndex� o  tu���� 0 	thelength 	theLength� ?  y|��� o  yz���� 0 endindex endIndex� o  z{���� 0 	thelength 	theLength� L  ���� m  ���� ���  ��  ��  � ��� Z  �������� A  ����� o  ������ 0 
startindex 
startIndex� m  ������ � r  ����� m  ������ � o      ���� 0 
startindex 
startIndex� ��� ?  ����� o  ������ 0 
startindex 
startIndex� o  ������ 0 	thelength 	theLength� ���� r  ����� o  ������ 0 	thelength 	theLength� o      ���� 0 
startindex 
startIndex��  ��  �    Z  ���� A  �� o  ������ 0 endindex endIndex m  ������  r  �� m  ������  o      ���� 0 endindex endIndex 	
	 ?  �� o  ������ 0 endindex endIndex o  ������ 0 	thelength 	theLength
 �� r  �� o  ������ 0 	thelength 	theLength o      ���� 0 endindex endIndex��  ��   �� L  �� n  �� 7 ����
�� 
ctxt o  ������ 0 
startindex 
startIndex o  ������ 0 endindex endIndex o  ������ 0 thetext theText��  � R      ��
�� .ascrerr ****      � **** o      ���� 0 etext eText ��
�� 
errn o      ���� 0 enumber eNumber ��
�� 
erob o      ���� 0 efrom eFrom ����
�� 
errt o      ���� 
0 eto eTo��  � I  �������� 
0 _error    m  ��   �!!  s l i c e   t e x t "#" o  ������ 0 etext eText# $%$ o  ������ 0 enumber eNumber% &'& o  ������ 0 efrom eFrom' (��( o  ������ 
0 eto eTo��  ��  � )*) l     ��������  ��  ��  * +,+ l     ��������  ��  ��  , -.- i  � �/0/ I     ��12
�� .Txt:TrmTnull���     ctxt1 o      ���� 0 thetext theText2 ��3��
�� 
From3 |����4��5��  ��  4 o      ���� 0 whichend whichEnd��  5 l     6����6 m      ��
�� LeTrBCha��  ��  ��  0 Q     �7897 k    �:: ;<; r    =>= n   ?@? I    ��A���� "0 astextparameter asTextParameterA BCB o    	���� 0 thetext theTextC D��D m   	 
EE �FF  ��  ��  @ o    ���� 0 _support  > o      ���� 0 thetext theText< GHG Z    -IJ����I H    KK E   LML J    NN OPO m    ��
�� LeTrLChaP QRQ m    ��
�� LeTrTChaR S��S m    ��
�� LeTrBCha��  M J    TT U��U o    ���� 0 whichend whichEnd��  J n   )VWV I   # )��X���� >0 throwinvalidconstantparameter throwInvalidConstantParameterX YZY o   # $���� 0 whichend whichEndZ [��[ m   $ %\\ �]]  r e m o v i n g��  ��  W o    #���� 0 _support  ��  ��  H ^��^ P   . �_`a_ k   3 �bb cdc l  3 ?efge Z  3 ?hi����h =  3 6jkj o   3 4���� 0 thetext theTextk m   4 5ll �mm  i L   9 ;nn m   9 :oo �pp  ��  ��  f H B check if theText is empty or contains white space characters only   g �qq �   c h e c k   i f   t h e T e x t   i s   e m p t y   o r   c o n t a i n s   w h i t e   s p a c e   c h a r a c t e r s   o n l yd rsr r   @ Stut J   @ Dvv wxw m   @ A���� x y�y m   A B�����  u J      zz {|{ o      �� 0 
startindex 
startIndex| }�} o      �� 0 endindex endIndex�  s ~~ Z   T x����� E  T \��� J   T X�� ��� m   T U�
� LeTrLCha� ��� m   U V�
� LeTrBCha�  � J   X [�� ��� o   X Y�� 0 whichend whichEnd�  � V   _ t��� r   j o��� [   j m��� o   j k�� 0 
startindex 
startIndex� m   k l�� � o      �� 0 
startindex 
startIndex� =  c i��� n   c g��� 4   d g��
� 
cha � o   e f�� 0 
startindex 
startIndex� o   c d�~�~ 0 thetext theText� m   g h�� ���  �  �   ��� Z   y ����}�|� E  y ���� J   y }�� ��� m   y z�{
�{ LeTrTCha� ��z� m   z {�y
�y LeTrBCha�z  � J   } ��� ��x� o   } ~�w�w 0 whichend whichEnd�x  � V   � ���� r   � ���� \   � ���� o   � ��v�v 0 endindex endIndex� m   � ��u�u � o      �t�t 0 endindex endIndex� =  � ���� n   � ���� 4   � ��s�
�s 
cha � o   � ��r�r 0 endindex endIndex� o   � ��q�q 0 thetext theText� m   � ��� ���  �}  �|  � ��p� L   � ��� n   � ���� 7  � ��o��
�o 
ctxt� o   � ��n�n 0 
startindex 
startIndex� o   � ��m�m 0 endindex endIndex� o   � ��l�l 0 thetext theText�p  ` �k�
�k conscase� �j�
�j consdiac� �i�
�i conshyph� �h�g
�h conspunc�g  a �f�
�f consnume� �e�d
�e conswhit�d  ��  8 R      �c��
�c .ascrerr ****      � ****� o      �b�b 0 etext eText� �a��
�a 
errn� o      �`�` 0 enumber eNumber� �_��
�_ 
erob� o      �^�^ 0 efrom eFrom� �]��\
�] 
errt� o      �[�[ 
0 eto eTo�\  9 I   � ��Z��Y�Z 
0 _error  � ��� m   � ��� ���  t r i m   t e x t� ��� o   � ��X�X 0 etext eText� ��� o   � ��W�W 0 enumber eNumber� ��� o   � ��V�V 0 efrom eFrom� ��U� o   � ��T�T 
0 eto eTo�U  �Y  . ��� l     �S�R�Q�S  �R  �Q  � ��� l     �P�O�N�P  �O  �N  � ��� l     �M���M  � J D--------------------------------------------------------------------   � ��� � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -� ��� l     �L���L  �   Split and Join Suite   � ��� *   S p l i t   a n d   J o i n   S u i t e� ��� l     �K�J�I�K  �J  �I  � ��� i  � ���� I      �H��G�H .0 _aslinebreakparameter _asLineBreakParameter� ��� o      �F�F 0 linebreaktype lineBreakType� ��E� o      �D�D 0 parametername parameterName�E  �G  � l    /���� Z     /����� =    ��� o     �C�C 0 linebreaktype lineBreakType� m    �B
�B LiBrLiOX� L    	�� 1    �A
�A 
lnfd� ��� =   ��� o    �@�@ 0 linebreaktype lineBreakType� m    �?
�? LiBrLiCM� ��� L    �� o    �>
�> 
ret � ��� =   ��� o    �=�= 0 linebreaktype lineBreakType� m    �<
�< LiBrLiWi� ��;� L    !�� b     ��� o    �:
�: 
ret � 1    �9
�9 
lnfd�;  � n  $ /��� I   ) /�8 �7�8 >0 throwinvalidconstantparameter throwInvalidConstantParameter   o   ) *�6�6 0 linebreaktype lineBreakType �5 o   * +�4�4 0 parametername parameterName�5  �7  � o   $ )�3�3 0 _support  � < 6 used by `join paragraphs` and `normalize line breaks`   � � l   u s e d   b y   ` j o i n   p a r a g r a p h s `   a n d   ` n o r m a l i z e   l i n e   b r e a k s `�  l     �2�1�0�2  �1  �0    l     �/�.�-�/  �.  �-   	
	 i  � � I      �,�+�, 0 
_splittext 
_splitText  o      �*�* 0 thetext theText �) o      �(�( 0 theseparator theSeparator�)  �+   l    ^ k     ^  r      n    
 I    
�'�&�' 0 aslist asList �% o    �$�$ 0 theseparator theSeparator�%  �&   o     �#�# 0 _support   o      �"�" 0 delimiterlist delimiterList  X    C�!  Q    >!"#! l    )$%&$ r     )'(' c     %)*) n     #+,+ 1   ! #� 
�  
pcnt, o     !�� 0 aref aRef* m   # $�
� 
ctxt( n      -.- 1   & (�
� 
pcnt. o   % &�� 0 aref aRef%�� caution: AS silently ignores invalid TID values, so separator items must be explicitly validated to catch any user errors; for now, just coerce to text and catch errors, but might want to make it more rigorous in future (e.g. if a list of lists is given, should sublist be treated as an error instead of just coercing it to text, which is itself TIDs sensitive); see also existing TODO on TypeSupport's asTextParameter handler   & �//V   c a u t i o n :   A S   s i l e n t l y   i g n o r e s   i n v a l i d   T I D   v a l u e s ,   s o   s e p a r a t o r   i t e m s   m u s t   b e   e x p l i c i t l y   v a l i d a t e d   t o   c a t c h   a n y   u s e r   e r r o r s ;   f o r   n o w ,   j u s t   c o e r c e   t o   t e x t   a n d   c a t c h   e r r o r s ,   b u t   m i g h t   w a n t   t o   m a k e   i t   m o r e   r i g o r o u s   i n   f u t u r e   ( e . g .   i f   a   l i s t   o f   l i s t s   i s   g i v e n ,   s h o u l d   s u b l i s t   b e   t r e a t e d   a s   a n   e r r o r   i n s t e a d   o f   j u s t   c o e r c i n g   i t   t o   t e x t ,   w h i c h   i s   i t s e l f   T I D s   s e n s i t i v e ) ;   s e e   a l s o   e x i s t i n g   T O D O   o n   T y p e S u p p o r t ' s   a s T e x t P a r a m e t e r   h a n d l e r" R      ��0
� .ascrerr ****      � ****�  0 �1�
� 
errn1 d      22 m      ����  # n  1 >343 I   6 >�5�� 60 throwinvalidparametertype throwInvalidParameterType5 676 o   6 7�� 0 aref aRef7 898 m   7 8:: �;; 
 u s i n g9 <=< m   8 9�
� 
ctxt= >�> m   9 :?? �@@  l i s t   o f   t e x t�  �  4 o   1 6�� 0 _support  �! 0 aref aRef  o    �� 0 delimiterlist delimiterList ABA r   D ICDC n  D GEFE 1   E G�
� 
txdlF 1   D E�
� 
ascrD o      �� 0 oldtids oldTIDsB GHG r   J OIJI o   J K�� 0 delimiterlist delimiterListJ n     KLK 1   L N�
� 
txdlL 1   K L�

�
 
ascrH MNM r   P UOPO n   P SQRQ 2  Q S�	
�	 
citmR o   P Q�� 0 thetext theTextP o      �� 0 
resultlist 
resultListN STS r   V [UVU o   V W�� 0 oldtids oldTIDsV n     WXW 1   X Z�
� 
txdlX 1   W X�
� 
ascrT Y�Y L   \ ^ZZ o   \ ]�� 0 
resultlist 
resultList�   � � used by `split text` to split text using one or more text item delimiters and current or predefined considering/ignoring settings    �[[   u s e d   b y   ` s p l i t   t e x t `   t o   s p l i t   t e x t   u s i n g   o n e   o r   m o r e   t e x t   i t e m   d e l i m i t e r s   a n d   c u r r e n t   o r   p r e d e f i n e d   c o n s i d e r i n g / i g n o r i n g   s e t t i n g s
 \]\ l     �� ���  �   ��  ] ^_^ l     ��������  ��  ��  _ `a` i  � �bcb I      ��d���� 0 _splitpattern _splitPatternd efe o      ���� 0 thetext theTextf g��g o      ���� 0 patterntext patternText��  ��  c l    �hijh k     �kk lml Z    no����n =     pqp l    	r����r I    	��st
�� .corecnte****       ****s J     uu v��v o     ���� 0 patterntext patternText��  t ��w��
�� 
koclw m    ��
�� 
list��  ��  ��  q m   	 
���� o r    xyx I   ��z{
�� .Txt:JoiTnull���     ****z o    ���� 0 patterntext patternText{ ��|��
�� 
Sepa| m    }} �~~  |��  y o      ���� 0 patterntext patternText��  ��  m � r    %��� I    #������� B0 _asnsregularexpressionparameter _asNSRegularExpressionParameter� ��� o    ���� 0 patterntext patternText� ���� m    �� ���  a t��  ��  � o      ���� 0 asocpattern asocPattern� ��� r   & 2��� n  & 0��� I   + 0������� ,0 asnormalizednsstring asNormalizedNSString� ���� o   + ,���� 0 thetext theText��  ��  � o   & +���� 0 _support  � o      ���� 0 
asocstring 
asocString� ��� l  3 6���� r   3 6��� m   3 4����  � o      ���� &0 asocnonmatchstart asocNonMatchStart� G A used to calculate NSRanges for non-matching portions of NSString   � ��� �   u s e d   t o   c a l c u l a t e   N S R a n g e s   f o r   n o n - m a t c h i n g   p o r t i o n s   o f   N S S t r i n g� ��� r   7 ;��� J   7 9����  � o      ���� 0 
resultlist 
resultList� ��� l  < <������  � @ : iterate over each non-matched + matched range in NSString   � ��� t   i t e r a t e   o v e r   e a c h   n o n - m a t c h e d   +   m a t c h e d   r a n g e   i n   N S S t r i n g� ��� r   < M��� n  < K��� I   = K������� @0 matchesinstring_options_range_ matchesInString_options_range_� ��� o   = >���� 0 
asocstring 
asocString� ��� m   > ?����  � ���� J   ? G�� ��� m   ? @����  � ���� n  @ E��� I   A E�������� 
0 length  ��  ��  � o   @ A���� 0 
asocstring 
asocString��  ��  ��  � o   < =���� 0 asocpattern asocPattern� o      ����  0 asocmatcharray asocMatchArray� ��� Y   N ��������� k   ^ ��� ��� r   ^ k��� l  ^ i������ n  ^ i��� I   d i������� 0 rangeatindex_ rangeAtIndex_� ���� m   d e����  ��  ��  � l  ^ d������ n  ^ d��� I   _ d����  0 objectatindex_ objectAtIndex_� ��� o   _ `�� 0 i  �  �  � o   ^ _��  0 asocmatcharray asocMatchArray��  ��  ��  ��  � o      ��  0 asocmatchrange asocMatchRange� ��� r   l s��� n  l q��� I   m q���� 0 location  �  �  � o   l m��  0 asocmatchrange asocMatchRange� o      ��  0 asocmatchstart asocMatchStart� ��� r   t ���� c   t ���� l  t ����� n  t ���� I   u ����� *0 substringwithrange_ substringWithRange_� ��� K   u }�� ���� 0 location  � o   v w�� &0 asocnonmatchstart asocNonMatchStart� ���� 
0 length  � \   x {��� o   x y��  0 asocmatchstart asocMatchStart� o   y z�� &0 asocnonmatchstart asocNonMatchStart�  �  �  � o   t u�� 0 
asocstring 
asocString�  �  � m   � ��
� 
ctxt� n      ���  ;   � �� o   � ��� 0 
resultlist 
resultList� ��� r   � ���� [   � ���� o   � ���  0 asocmatchstart asocMatchStart� l  � ����� n  � ���� I   � ����� 
0 length  �  �  � o   � ���  0 asocmatchrange asocMatchRange�  �  � o      �� &0 asocnonmatchstart asocNonMatchStart�  �� 0 i  � m   Q R��  � \   R Y��� l  R W���� n  R W��� I   S W���� 	0 count  �  �  � o   R S��  0 asocmatcharray asocMatchArray�  �  � m   W X�� ��  � ��� l  � �����  � "  add final non-matched range   � ��� 8   a d d   f i n a l   n o n - m a t c h e d   r a n g e� ��� r   � ���� c   � ���� l  � ����� n  � ���� I   � ����� *0 substringfromindex_ substringFromIndex_� ��� o   � ��� &0 asocnonmatchstart asocNonMatchStart�  �  � o   � ��� 0 
asocstring 
asocString�  �  � m   � ��
� 
ctxt� n      ���  ;   � �� o   � ��� 0 
resultlist 
resultList�    l  � � Z  � ��� F   � � =   � �	
	 n  � � 1   � ��
� 
leng o   � ��� 0 
resultlist 
resultList
 m   � ���  =   � � n  � � 1   � ��
� 
leng n  � � 4   � ��
� 
cobj m   � ���  o   � ��� 0 
resultlist 
resultList m   � ���   L   � � J   � ���  �  �   U O for consistency with _splitText(), where `text items of ""` returns empty list    � �   f o r   c o n s i s t e n c y   w i t h   _ s p l i t T e x t ( ) ,   w h e r e   ` t e x t   i t e m s   o f   " " `   r e t u r n s   e m p t y   l i s t � L   � � o   � ��� 0 
resultlist 
resultList�  i Q K used by `split text` to split text using a regular expression as separator   j � �   u s e d   b y   ` s p l i t   t e x t `   t o   s p l i t   t e x t   u s i n g   a   r e g u l a r   e x p r e s s i o n   a s   s e p a r a t o ra  l     �~�}�|�~  �}  �|    l     �{�z�y�{  �z  �y    i  � �  I      �x!�w�x 0 	_jointext 	_joinText! "#" o      �v�v 0 thelist theList# $�u$ o      �t�t 0 separatortext separatorText�u  �w    k     8%% &'& r     ()( n    *+* 1    �s
�s 
txdl+ 1     �r
�r 
ascr) o      �q�q 0 oldtids oldTIDs' ,-, r    ./. o    �p�p 0 separatortext separatorText/ n     010 1    
�o
�o 
txdl1 1    �n
�n 
ascr- 232 Q    /4564 r    787 c    9:9 o    �m�m 0 thelist theList: m    �l
�l 
ctxt8 o      �k�k 0 
resulttext 
resultText5 R      �j�i;
�j .ascrerr ****      � ****�i  ; �h<�g
�h 
errn< d      == m      �f�f��g  6 k    />> ?@? r    !ABA o    �e�e 0 oldtids oldTIDsB n     CDC 1     �d
�d 
txdlD 1    �c
�c 
ascr@ E�bE n  " /FGF I   ' /�aH�`�a .0 throwinvalidparameter throwInvalidParameterH IJI o   ' (�_�_ 0 thelist theListJ KLK m   ( )MM �NN  L OPO m   ) *�^
�^ 
listP Q�]Q m   * +RR �SS , E x p e c t e d   l i s t   o f   t e x t .�]  �`  G o   " '�\�\ 0 _support  �b  3 TUT r   0 5VWV o   0 1�[�[ 0 oldtids oldTIDsW n     XYX 1   2 4�Z
�Z 
txdlY 1   1 2�Y
�Y 
ascrU Z�XZ L   6 8[[ o   6 7�W�W 0 
resulttext 
resultText�X   \]\ l     �V�U�T�V  �U  �T  ] ^_^ l     �S�R�Q�S  �R  �Q  _ `a` l     �Pbc�P  b  -----   c �dd 
 - - - - -a efe l     �O�N�M�O  �N  �M  f ghg i  � �iji I     �Lkl
�L .Txt:SplTnull���     ctxtk o      �K�K 0 thetext theTextl �Jmn
�J 
Sepam |�I�Ho�Gp�I  �H  o o      �F�F 0 theseparator theSeparator�G  p l     q�E�Dq m      �C
�C 
msng�E  �D  n �Br�A
�B 
Usinr |�@�?s�>t�@  �?  s o      �=�= 0 matchformat matchFormat�>  t l     u�<�;u m      �:
�: SerECmpI�<  �;  �A  j k     �vv wxw l     �9yz�9  y � � convenience handler for splitting text using TIDs that can also use a regular expression pattern as separator; similar to Python's str.split()   z �{{   c o n v e n i e n c e   h a n d l e r   f o r   s p l i t t i n g   t e x t   u s i n g   T I D s   t h a t   c a n   a l s o   u s e   a   r e g u l a r   e x p r e s s i o n   p a t t e r n   a s   s e p a r a t o r ;   s i m i l a r   t o   P y t h o n ' s   s t r . s p l i t ( )x |�8| Q     �}~} k    ��� ��� r    ��� n   ��� I    �7��6�7 "0 astextparameter asTextParameter� ��� o    	�5�5 0 thetext theText� ��4� m   	 
�� ���  �4  �6  � o    �3�3 0 _support  � o      �2�2 0 thetext theText� ��� Z    ���1�0� =    ��� n   ��� 1    �/
�/ 
leng� o    �.�. 0 thetext theText� m    �-�-  � L    �� J    �,�,  �1  �0  � ��+� Z   ! ������ =  ! $��� o   ! "�*�* 0 theseparator theSeparator� m   " #�)
�) 
msng� l  ' 3���� L   ' 3�� I   ' 2�(��'�( 0 _splitpattern _splitPattern� ��� I  ( -�&��%
�& .Txt:TrmTnull���     ctxt� o   ( )�$�$ 0 thetext theText�%  � ��#� m   - .�� ���  \ s +�#  �'  � � � if `at` parameter is omitted, trim ends then then split on whitespace runs, same as Python's str.split() default behavior (any `using` options are ignored)   � ���8   i f   ` a t `   p a r a m e t e r   i s   o m i t t e d ,   t r i m   e n d s   t h e n   t h e n   s p l i t   o n   w h i t e s p a c e   r u n s ,   s a m e   a s   P y t h o n ' s   s t r . s p l i t ( )   d e f a u l t   b e h a v i o r   ( a n y   ` u s i n g `   o p t i o n s   a r e   i g n o r e d )� ��� =  6 9��� o   6 7�"�" 0 matchformat matchFormat� m   7 8�!
�! SerECmpI� ��� P   < J���� L   A I�� I   A H� ���  0 
_splittext 
_splitText� ��� o   B C�� 0 thetext theText� ��� o   C D�� 0 theseparator theSeparator�  �  � ��
� consdiac� ��
� conshyph� ��
� conspunc� ��
� conswhit�  � ��
� conscase� ��
� consnume�  � ��� =  M P��� o   M N�� 0 matchformat matchFormat� m   N O�
� SerECmpE� ��� P   S a���� L   X `�� I   X _���� 0 
_splittext 
_splitText� ��� o   Y Z�� 0 thetext theText� ��� o   Z [�� 0 theseparator theSeparator�  �  � ��
� conscase� ��
� consdiac� �
�
�
 conshyph� �	�
�	 conspunc� ��
� conswhit�  � ��
� consnume�  � ��� =  d g��� o   d e�� 0 matchformat matchFormat� m   e f�
� SerECmpP� ��� L   j r�� I   j q���� 0 _splitpattern _splitPattern� ��� o   k l� �  0 thetext theText� ���� o   l m���� 0 theseparator theSeparator��  �  � ��� =  u x��� o   u v���� 0 matchformat matchFormat� m   v w��
�� SerECmpD� ���� L   { ��� I   { �������� 0 
_splittext 
_splitText� ��� o   | }���� 0 thetext theText� ���� o   } ~���� 0 theseparator theSeparator��  ��  ��  � n  � ���� I   � �������� >0 throwinvalidconstantparameter throwInvalidConstantParameter� ��� o   � ����� 0 matchformat matchFormat� ���� m   � ��� ��� 
 u s i n g��  ��  � o   � ����� 0 _support  �+  ~ R      ����
�� .ascrerr ****      � ****� o      ���� 0 etext eText� ����
�� 
errn� o      ���� 0 enumber eNumber� ����
�� 
erob� o      ���� 0 efrom eFrom� �����
�� 
errt� o      ���� 
0 eto eTo��   I   � �������� 
0 _error  � ��� m   � ��� ���  s p l i t   t e x t� ��� o   � ����� 0 etext eText� ��� o   � ����� 0 enumber eNumber� ��� o   � ����� 0 efrom eFrom� ���� o   � ����� 
0 eto eTo��  ��  �8  h ��� l     ��������  ��  ��  � � � l     ��������  ��  ��     i  � � I     ��
�� .Txt:JoiTnull���     **** o      ���� 0 thelist theList ����
�� 
Sepa |������	��  ��   o      ���� 0 separatortext separatorText��  	 m      

 �  ��   Q     1 L     I    ������ 0 	_jointext 	_joinText  n    I   	 ������ "0 aslistparameter asListParameter  o   	 
���� 0 thelist theList �� m   
  �  ��  ��   o    	���� 0 _support   �� n    I    ������ "0 astextparameter asTextParameter   o    ���� 0 separatortext separatorText  !��! m    "" �## 
 u s i n g��  ��   o    ���� 0 _support  ��  ��   R      ��$%
�� .ascrerr ****      � ****$ o      ���� 0 etext eText% ��&'
�� 
errn& o      ���� 0 enumber eNumber' ��()
�� 
erob( o      ���� 0 efrom eFrom) �*�
� 
errt* o      �� 
0 eto eTo�   I   ' 1�+�� 
0 _error  + ,-, m   ( ).. �//  j o i n   t e x t- 010 o   ) *�� 0 etext eText1 232 o   * +�� 0 enumber eNumber3 454 o   + ,�� 0 efrom eFrom5 6�6 o   , -�� 
0 eto eTo�  �   787 l     ����  �  �  8 9:9 l     ����  �  �  : ;<; i  � �=>= I     �?�
� .Txt:SplPnull���     ctxt? o      �� 0 thetext theText�  > Q     $@AB@ L    CC n    DED 2   �
� 
cparE n   FGF I    �H�� "0 astextparameter asTextParameterH IJI o    	�� 0 thetext theTextJ K�K m   	 
LL �MM  �  �  G o    �� 0 _support  A R      �NO
� .ascrerr ****      � ****N o      �� 0 etext eTextO �PQ
� 
errnP o      �� 0 enumber eNumberQ �RS
� 
erobR o      �� 0 efrom eFromS �T�
� 
errtT o      �� 
0 eto eTo�  B I    $�U�� 
0 _error  U VWV m    XX �YY   s p l i t   p a r a g r a p h sW Z[Z o    �� 0 etext eText[ \]\ o    �� 0 enumber eNumber] ^_^ o    �� 0 efrom eFrom_ `�` o     �� 
0 eto eTo�  �  < aba l     ����  �  �  b cdc l     ����  �  �  d efe i  � �ghg I     �ij
� .Txt:JoiPnull���     ****i o      �� 0 thelist theListj �k�
� 
LiBrk |��l�m�  �  l o      �� 0 linebreaktype lineBreakType�  m l     n��n m      �
� LiBrLiOX�  �  �  h Q     -opqo L    rr I    �s�� 0 	_jointext 	_joinTexts tut n   vwv I   	 �x�� "0 aslistparameter asListParameterx yzy o   	 
�� 0 thelist theListz {�{ m   
 || �}}  �  �  w o    	�� 0 _support  u ~�~~ I    �}�|�} .0 _aslinebreakparameter _asLineBreakParameter ��� o    �{�{ 0 linebreaktype lineBreakType� ��z� m    �� ��� 
 u s i n g�z  �|  �~  �  p R      �y��
�y .ascrerr ****      � ****� o      �x�x 0 etext eText� �w��
�w 
errn� o      �v�v 0 enumber eNumber� �u��
�u 
erob� o      �t�t 0 efrom eFrom� �s��r
�s 
errt� o      �q�q 
0 eto eTo�r  q I   # -�p��o�p 
0 _error  � ��� m   $ %�� ���  j o i n   p a r a g r a p h s� ��� o   % &�n�n 0 etext eText� ��� o   & '�m�m 0 enumber eNumber� ��� o   ' (�l�l 0 efrom eFrom� ��k� o   ( )�j�j 
0 eto eTo�k  �o  f ��� l     �i�h�g�i  �h  �g  � ��f� l     �e�d�c�e  �d  �c  �f       +�b���a�`�_��� ���������������������������������b  � )�^�]�\�[�Z�Y�X�W�V�U�T�S�R�Q�P�O�N�M�L�K�J�I�H�G�F�E�D�C�B�A�@�?�>�=�<�;�:�9�8�7�6
�^ 
pimr�] (0 _unmatchedtexttype _UnmatchedTextType�\ $0 _matchedtexttype _MatchedTextType�[ &0 _matchedgrouptype _MatchedGroupType�Z 0 _support  �Y 
0 _error  �X B0 _asnsregularexpressionparameter _asNSRegularExpressionParameter�W 0 _tokens  �V (0 _parsetemplatetext _parseTemplateText�U :0 _previoussearchtemplatetext _previousSearchTemplateText�T F0 !_previoussearchtemplateparsedtext !_previousSearchTemplateParsedText�S ,0 _parsesearchtemplate _parseSearchTemplate�R :0 _previousformattemplatetext _previousFormatTemplateText�Q H0 "_previousformattemplateparseditems "_previousFormatTemplateParsedItems�P ,0 _parseformattemplate _parseFormatTemplate�O $0 _matchinforecord _matchInfoRecord�N 0 _matchrecords _matchRecords�M &0 _matchedgrouplist _matchedGroupList�L 0 _findpattern _findPattern�K "0 _replacepattern _replacePattern�J 0 	_findtext 	_findText�I 0 _replacetext _replaceText
�H .Txt:Srchnull���     ctxt
�G .Txt:EPatnull���     ctxt
�F .Txt:ETemnull���     ctxt
�E .Txt:UppTnull���     ctxt
�D .Txt:CapTnull���     ctxt
�C .Txt:LowTnull���     ctxt
�B .Txt:FTxtnull���     ctxt
�A .Txt:Normnull���     ctxt
�@ .Txt:PadTnull���     ctxt
�? .Txt:SliTnull���     ctxt
�> .Txt:TrmTnull���     ctxt�= .0 _aslinebreakparameter _asLineBreakParameter�< 0 
_splittext 
_splitText�; 0 _splitpattern _splitPattern�: 0 	_jointext 	_joinText
�9 .Txt:SplTnull���     ctxt
�8 .Txt:JoiTnull���     ****
�7 .Txt:SplPnull���     ctxt
�6 .Txt:JoiPnull���     ****� �5��5 �  ��� �4��3
�4 
cobj� ��   �2 
�2 
frmk�3  � �1��0
�1 
cobj� ��   �/
�/ 
osax�0  
�a 
TxtU
�` 
TxtM
�_ 
TxtG� ��   �. D
�. 
scpt� �- N�,�+���*�- 
0 _error  �, �)��) �  �(�'�&�%�$�( 0 handlername handlerName�' 0 etext eText�& 0 enumber eNumber�% 0 efrom eFrom�$ 
0 eto eTo�+  � �#�"�!� ��# 0 handlername handlerName�" 0 etext eText�! 0 enumber eNumber�  0 efrom eFrom� 
0 eto eTo�  ^��� � &0 throwcommanderror throwCommandError�* b  ࠡ����+ � � w������ B0 _asnsregularexpressionparameter _asNSRegularExpressionParameter� ��� �  ��� 0 patterntext patternText� 0 parametername parameterName�  � ��� 0 patterntext patternText� 0 parametername parameterName� ������
� misccura� H0 "nsregularexpressioncaseinsensitive "NSRegularExpressionCaseInsensitive� L0 $nsregularexpressionanchorsmatchlines $NSRegularExpressionAnchorsMatchLines� Z0 +nsregularexpressiondotmatcheslineseparators +NSRegularExpressionDotMatchesLineSeparators� Z0 +nsregularexpressionuseunicodewordboundaries +NSRegularExpressionUseUnicodeWordBoundaries� @0 asnsregularexpressionparameter asNSRegularExpressionParameter�  b  ���,E��,E��,E��,E�m+ � � ������
� (0 _parsetemplatetext _parseTemplateText� �	��	 �  �� 0 templatetext templateText�  � �������� ����������������� 0 templatetext templateText� 0 
asocstring 
asocString� 0 asocpattern asocPattern� &0 asocnonmatchstart asocNonMatchStart� 0 
resultlist 
resultList�  0 asocmatcharray asocMatchArray� 0 
concatnext 
concatNext�  0 i  �� 0 	asocmatch 	asocMatch��  0 asocmatchrange asocMatchRange��  0 asocmatchstart asocMatchStart�� 0 nonmatchtext nonMatchText�� 0 j  ��  0 asocgrouprange asocGroupRange�� "0 asocmatchstring asocMatchString�� 0 itemtext itemText� ����������������������������.�������������������������
�� misccura�� 0 nsstring NSString�� &0 stringwithstring_ stringWithString_�� *0 nsregularexpression NSRegularExpression�� ^0 -nsregularexpressionallowcommentsandwhitespace -NSRegularExpressionAllowCommentsAndWhitespace
�� 
msng�� Z0 +regularexpressionwithpattern_options_error_ +regularExpressionWithPattern_options_error_�� 
0 length  �� @0 matchesinstring_options_range_ matchesInString_options_range_�� 	0 count  ��  0 objectatindex_ objectAtIndex_�� 0 rangeatindex_ rangeAtIndex_�� 0 location  �� *0 substringwithrange_ substringWithRange_�� H0 "stringbyapplyingtransform_reverse_ "stringByApplyingTransform_reverse_
�� 
ctxt
�� 
cobj
�� 
lnfd
�� 
ret 
�� 
tab �� 
�� 
psof
�� 
psin
�� .sysooffslong    ��� null�� *0 substringfromindex_ substringFromIndex_�
d��,�k+ E�O��,b  ��,E�m+ E�OjE�OjvE�O��jj�j+ lvm+ E�OfE�O �j�j+ 	kkh ��k+ 
E�O�jk+ E�O�j+ E�O����lvk+ �fl+ a &E�O� �a i/�%�a i/FOfE�Y ��6FO��j+ E�O �kmkh ��k+ E�O�j+ j a��k+ E�O�a &E�O�k  A�a i/_ _ _ a a va � *a �a a a  U/%�a i/FOeE�Y ��6FOY h[OY��[OY�O��k+ a fl+ a &E�O� �a i/�%�a i/FY ��6FO�� ������������ ,0 _parsesearchtemplate _parseSearchTemplate�� ����� �  ���� 0 templatetext templateText��  � �������������� 0 templatetext templateText�� 0 templateitems templateItems�� 0 i  �� 0 itemtext itemText�� 0 nextitem nextItem�� 0 
asocstring 
asocString� ������M��k����t��������������������� (0 _parsetemplatetext _parseTemplateText
�� 
leng
�� 
cobj
�� 
long
�� 
cha 
�� 
bool�� 0 
asnsstring 
asNSString
�� misccura�� 60 nsregularexpressionsearch NSRegularExpressionSearch�� 
0 length  �� �� �0 >stringbyreplacingoccurrencesofstring_withstring_options_range_ >stringByReplacingOccurrencesOfString_withString_options_range_
�� 
ctxt�� 0 	_jointext 	_joinText�� ��� ��b  	 �*�k+ E�O �k��,Ekh ��/E�O�l#j  9��&%E�O��k/E�O��,j	 
��k/�& 
��%E�Y hO���/FY ,b  �k+ E�O�����,j�j+ lva + a &��/F[OY��O*�a l+ Ec  
O�Ec  	Y hOb  
V� ������������� ,0 _parseformattemplate _parseFormatTemplate�� ����� �  �� 0 templatetext templateText��  � �� 0 templatetext templateText� ����� (0 _parsetemplatetext _parseTemplateText
� 
cobj�� 3�� /�b   *�k+ Ec  O�Ec  Y hOb  �-EV� ������� $0 _matchinforecord _matchInfoRecord� ��� �  ����� 0 
asocstring 
asocString�  0 asocmatchrange asocMatchRange� 0 
textoffset 
textOffset� 0 
recordtype 
recordType�  � ������� 0 
asocstring 
asocString�  0 asocmatchrange asocMatchRange� 0 
textoffset 
textOffset� 0 
recordtype 
recordType� 0 	foundtext 	foundText�  0 nexttextoffset nextTextOffset� ��������� *0 substringwithrange_ substringWithRange_
� 
ctxt
� 
leng
� 
pcls� 0 
startindex 
startIndex� 0 endindex endIndex� 0 	foundtext 	foundText� � $��k+  �&E�O���,E�O���k���lv� �N������ 0 _matchrecords _matchRecords� ��� �  ������� 0 
asocstring 
asocString�  0 asocmatchrange asocMatchRange�  0 asocstartindex asocStartIndex� 0 
textoffset 
textOffset� (0 nonmatchrecordtype nonMatchRecordType� "0 matchrecordtype matchRecordType�  � ������������ 0 
asocstring 
asocString�  0 asocmatchrange asocMatchRange�  0 asocstartindex asocStartIndex� 0 
textoffset 
textOffset� (0 nonmatchrecordtype nonMatchRecordType� "0 matchrecordtype matchRecordType�  0 asocmatchstart asocMatchStart� 0 asocmatchend asocMatchEnd� &0 asocnonmatchrange asocNonMatchRange� 0 nonmatchinfo nonMatchInfo� 0 	matchinfo 	matchInfo� ������ 0 location  � 
0 length  � � $0 _matchinforecord _matchInfoRecord
� 
cobj� W�j+  E�O��j+ E�O�ᦢ�E�O*�����+ E[�k/E�Z[�l/E�ZO*�����+ E[�k/E�Z[�l/E�ZO�����v� �������� &0 _matchedgrouplist _matchedGroupList� ��� �  ����� 0 
asocstring 
asocString� 0 	asocmatch 	asocMatch� 0 
textoffset 
textOffset� &0 includenonmatches includeNonMatches�  � ���~�}�|�{�z�y�x�w�v�u�t� 0 
asocstring 
asocString� 0 	asocmatch 	asocMatch�~ 0 
textoffset 
textOffset�} &0 includenonmatches includeNonMatches�| "0 submatchresults subMatchResults�{ 0 groupindexes groupIndexes�z (0 asocfullmatchrange asocFullMatchRange�y &0 asocnonmatchstart asocNonMatchStart�x $0 asocfullmatchend asocFullMatchEnd�w 0 i  �v 0 nonmatchinfo nonMatchInfo�u 0 	matchinfo 	matchInfo�t &0 asocnonmatchrange asocNonMatchRange� 	�s�r�q�p�o�n�m�l�k�s  0 numberofranges numberOfRanges�r 0 rangeatindex_ rangeAtIndex_�q 0 location  �p 
0 length  �o �n 0 _matchrecords _matchRecords
�m 
cobj�l �k $0 _matchinforecord _matchInfoRecord� �jvE�O�j+  kE�O�j ��jk+ E�O�j+ E�O��j+ E�O Uk�kh 	*���k+ ��b  b  �+ E[�k/E�Z[�l/E�Z[�m/E�Z[��/E�ZO� 	��6FY hO��6F[OY��O� #�㨧�E�O*���b  �+ �k/�6FY hY hO�� �j8�i�h���g�j 0 _findpattern _findPattern�i �f��f �  �e�d�c�b�e 0 thetext theText�d 0 patterntext patternText�c &0 includenonmatches includeNonMatches�b  0 includematches includeMatches�h  � �a�`�_�^�]�\�[�Z�Y�X�W�V�U�T�S�a 0 thetext theText�` 0 patterntext patternText�_ &0 includenonmatches includeNonMatches�^  0 includematches includeMatches�] 0 asocpattern asocPattern�\ 0 
asocstring 
asocString�[ &0 asocnonmatchstart asocNonMatchStart�Z 0 
textoffset 
textOffset�Y 0 
resultlist 
resultList�X  0 asocmatcharray asocMatchArray�W 0 i  �V 0 	asocmatch 	asocMatch�U 0 nonmatchinfo nonMatchInfo�T 0 	matchinfo 	matchInfo�S 0 	foundtext 	foundText� L�RXb�Q�P�O�N�M�L�K�J�I�H�G�F�E�D�C�B�A�@�?�>�=�R (0 asbooleanparameter asBooleanParameter�Q B0 _asnsregularexpressionparameter _asNSRegularExpressionParameter�P ,0 asnormalizednsstring asNormalizedNSString�O 
0 length  �N @0 matchesinstring_options_range_ matchesInString_options_range_�M 	0 count  �L  0 objectatindex_ objectAtIndex_�K 0 rangeatindex_ rangeAtIndex_�J �I 0 _matchrecords _matchRecords
�H 
cobj�G �F 0 foundgroups foundGroups�E 0 
startindex 
startIndex�D &0 _matchedgrouplist _matchedGroupList�C *0 substringfromindex_ substringFromIndex_
�B 
ctxt
�A 
pcls�@ 0 endindex endIndex
�? 
leng�> 0 	foundtext 	foundText�= �g	b  ��l+ E�Ob  ��l+ E�O*��l+ E�Ob  �k+ E�OjE�OkE�OjvE�O��jj�j+ lvm+ E�O }j�j+ kkh 
��k+ 	E�O*��jk+ 
��b  b  �+ E[�k/E�Z[�l/E�Z[�m/E�Z[��/E�ZO� 	��6FY hO� ��*���a ,��+ l%�6FY h[OY��O� 1��k+ a &E�Oa b  a �a �a ,a �a �6FY hO�� �<)�;�:���9�< "0 _replacepattern _replacePattern�; �8��8 �  �7�6�5�7 0 thetext theText�6 0 patterntext patternText�5 0 templatetext templateText�:  � �4�3�2�1�0�/�.�-�,�+�*�)�(�'�&�%�$�#�"�!� ��4 0 thetext theText�3 0 patterntext patternText�2 0 templatetext templateText�1 0 
asocstring 
asocString�0 0 asocpattern asocPattern�/ 0 
resultlist 
resultList�. &0 asocnonmatchstart asocNonMatchStart�-  0 asocmatcharray asocMatchArray�, 0 i  �+ 0 	asocmatch 	asocMatch�*  0 asocmatchrange asocMatchRange�)  0 asocmatchstart asocMatchStart�( &0 asocnonmatchrange asocNonMatchRange�' 0 	foundtext 	foundText�& 0 foundgroups foundGroups�% 0 j  �$ 0 etext eText�# 0 enumber eNumber�" 0 efrom eFrom�! 
0 eto eTo�  0 oldtids oldTIDs� 0 
resulttext 
resultText� "�A�����R�����������������
�	�����6��� ,0 asnormalizednsstring asNormalizedNSString� B0 _asnsregularexpressionparameter _asNSRegularExpressionParameter
� 
kocl
� 
scpt
� .corecnte****       ****� 0 
resultlist 
resultList� ���� ����
� .ascrinit****      � ****� k     �� R����  �  �   � ���� 
0 _list_  � ���� 
0 _list_  �� jv�� 
0 length  � @0 matchesinstring_options_range_ matchesInString_options_range_� 	0 count  �  0 objectatindex_ objectAtIndex_� 0 rangeatindex_ rangeAtIndex_� 0 location  � � *0 substringwithrange_ substringWithRange_
� 
ctxt� 
0 _list_  �  0 numberofranges numberOfRanges�  0 replacepattern replacePattern� 0 etext eText� �����
�� 
errn�� 0 enumber eNumber� �����
�� 
erob�� 0 efrom eFrom� ������
�� 
errt�� 
0 eto eTo��  
� 
errn
�
 
erob
�	 
errt� � *0 substringfromindex_ substringFromIndex_
� 
ascr
� 
txdl� ,0 _parsesearchtemplate _parseSearchTemplate� |0 <stringbyreplacingmatchesinstring_options_range_withtemplate_ <stringByReplacingMatchesInString_options_range_withTemplate_�9ub  �k+  E�O*��l+ E�O�kv��l k 7��K S�OjE�O��jj�j+ 	lvm+ 
E�O �j�j+ kkh ��k+ E�O�jk+ E�O�j+ E�O�髦�E�O��k+ a &�a ,6FO��k+ a &E�OjvE�O &k�j+ kkh ���k+ k+ a &�6F[OY��O ���l+ a &�a ,6FW %X  )a ] a ] a ] a a ] %O��j+ 	E�[OY�DO��k+ a &�a ,6FO_ a ,E^ Oa _ a ,FO�a ,a &E^ O] _ a ,FO] Y ��jj�j+ 	lv*�k+  �+ !a &� ��t���������� 0 	_findtext 	_findText�� ����� �  ���������� 0 thetext theText�� 0 fortext forText�� &0 includenonmatches includeNonMatches��  0 includematches includeMatches��  � 
���������������������� 0 thetext theText�� 0 fortext forText�� &0 includenonmatches includeNonMatches��  0 includematches includeMatches�� 0 
resultlist 
resultList�� 0 oldtids oldTIDs�� 0 
startindex 
startIndex�� 0 endindex endIndex�� 0 	foundtext 	foundText�� 0 i  � ����������������������������*
�� 
ascr
�� 
txdl
�� 
citm
�� 
leng
�� 
ctxt
�� 
pcls�� 0 
startindex 
startIndex�� 0 endindex endIndex�� 0 	foundtext 	foundText�� 
�� .corecnte****       ****�� 0 foundgroups foundGroups�� 
��
jvE�O��,E�O���,FOkE�O��k/�,E�O� 0�� �[�\[Z�\Z�2E�Y �E�O�b  �����6FY hO �l��-j kh 	�kE�O��,�[�\[�/\�i/2�,E�O� 3�� �[�\[Z�\Z�2E�Y �E�O�b  ����jv��6FY hO�kE�O���/�,kE�O� 0�� �[�\[Z�\Z�2E�Y �E�O�b  �����6FY h[OY�aO���,FO�� ��W���������� 0 _replacetext _replaceText�� ����� �  �������� 0 thetext theText�� 0 fortext forText�� 0 newtext newText��  � ����������������������������� 0 thetext theText�� 0 fortext forText�� 0 newtext newText�� 0 oldtids oldTIDs�� 0 
resultlist 
resultList�� 0 
startindex 
startIndex�� 0 endindex endIndex�� 0 i  �� 0 	foundtext 	foundText�� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTo� 0 
resulttext 
resultText� ������������������,�
� 
ascr
� 
txdl
� 
kocl
� 
scpt
� .corecnte****       ****
� 
citm
� 
leng
� 
cobj
� 
ctxt� 0 replacetext replaceText� 0 etext eText� ���
� 
errn� 0 enumber eNumber� ���
� 
erob� 0 efrom eFrom� ���
� 
errt� 
0 eto eTo�  
� 
errn
� 
erob
� 
errt� � "0 astextparameter asTextParameter��(��,E�O���,FO�kv��l j �jvk��k/�,mvE[�k/E�Z[�l/E�Z[�m/E�ZO�� �[�\[Z�\Z�2�6FY hO �l��-j kh �kE�O��,�[�\[�/\�i/2�,E�O�� �[�\[Z�\Z�2E�Y �E�O ��k+ 
�&�6FW X  )����a a �%O�kE�O���/�,kE�O�� �[�\[Z�\Z�2�6FY h[OY�rOa ��,FY b  �a l+ E�O��-E�O���,FO��&E�O���,FO�� �Z�����
� .Txt:Srchnull���     ctxt� 0 thetext theText� ���
� 
For_� 0 fortext forText� ���
� 
Usin� {���� 0 matchformat matchFormat�  
� SerECmpI� ���
� 
Repl� {���� 0 newtext newText�  
� 
msng� ���
� 
Retu� {���� 0 resultformat resultFormat�  
� RetEMatT�  � ������������������ 0 thetext theText� 0 fortext forText� 0 matchformat matchFormat� 0 newtext newText� 0 resultformat resultFormat�� &0 includenonmatches includeNonMatches��  0 includematches includeMatches�� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTo� 0|��������������������������~�}�|�{��z�y			
�x�w	 	!�v�u�t	M	V	[	n	~�s�r	�	�	�	��q�	��p�o�� "0 astextparameter asTextParameter
�� 
leng
�� 
ctxt�� �� .0 throwinvalidparameter throwInvalidParameter
�� 
msng
�� RetEMatT
�� 
pcls�� 0 
startindex 
startIndex�� 0 endindex endIndex� 0 	foundtext 	foundText�~ 
�} 
cobj
�| RetEUmaT
�{ RetEAllT�z >0 throwinvalidconstantparameter throwInvalidConstantParameter
�y SerECmpI�x 0 	_findtext 	_findText
�w SerECmpE
�v SerECmpP�u 0 _findpattern _findPattern
�t SerECmpD�s 0 _replacetext _replaceText�r "0 _replacepattern _replacePattern�q 0 etext eText� �n�m�
�n 
errn�m 0 enumber eNumber� �l�k�
�l 
erob�k 0 efrom eFrom� �j�i�h
�j 
errt�i 
0 eto eTo�h  �p �o 
0 _error  �*b  ��l+ E�Ob  ��l+ E�O��,j  b  �����+ Y hO�� 6��,j  $��  jvY �b  �k�j��a kvY hO��  felvE[a k/E�Z[a l/E�ZY S�a   eflvE[a k/E�Z[a l/E�ZY 1�a   eelvE[a k/E�Z[a l/E�ZY b  �a l+ O�a   a a  *�����+ VY v�a   a a  *�����+ VY W�a   *�����+ Y B�a   -�a    b  �a !�a "�+ Y hO*�����+ Y b  �a #l+ Y ���,j  	a $Y hO�a   a a  *���m+ %VY s�a   a a  *���m+ %VY U�a   *���m+ &Y A�a   ,�a '  b  �a (�a )�+ Y hO*���m+ %Y b  �a *l+ W X + ,*a -����a .+ /� �g
�f�e� �d
�g .Txt:EPatnull���     ctxt�f 0 thetext theText�e  � �c�b�a�`�_�c 0 thetext theText�b 0 etext eText�a 0 enumber eNumber�` 0 efrom eFrom�_ 
0 eto eTo  �^�]
�\�[�Z�Y
#�X�W
�^ misccura�] *0 nsregularexpression NSRegularExpression�\ "0 astextparameter asTextParameter�[ 40 escapedpatternforstring_ escapedPatternForString_
�Z 
ctxt�Y 0 etext eText �V�U
�V 
errn�U 0 enumber eNumber �T�S
�T 
erob�S 0 efrom eFrom �R�Q�P
�R 
errt�Q 
0 eto eTo�P  �X �W 
0 _error  �d + ��,b  ��l+ k+ �&W X  *衢���+ 
� �O
3�N�M�L
�O .Txt:ETemnull���     ctxt�N 0 thetext theText�M   �K�J�I�H�G�K 0 thetext theText�J 0 etext eText�I 0 enumber eNumber�H 0 efrom eFrom�G 
0 eto eTo 
E�F
H�E
K�D�C
W�B�A�F "0 astextparameter asTextParameter�E 0 
_splittext 
_splitText�D 0 	_jointext 	_joinText�C 0 etext eText �@�?
�@ 
errn�? 0 enumber eNumber �>�=
�> 
erob�= 0 efrom eFrom �<�;�:
�< 
errt�; 
0 eto eTo�:  �B �A 
0 _error  �L . **b  ��l+ �l+ �l+ W X  *衢���+ 
� �9
s�8�7	
�6
�9 .Txt:UppTnull���     ctxt�8 0 thetext theText�7 �5�4
�5 
Loca {�3�2�1�3 0 
localecode 
localeCode�2  
�1 
msng�4  	 �0�/�.�-�,�+�*�0 0 thetext theText�/ 0 
localecode 
localeCode�. 0 
asocstring 
asocString�- 0 etext eText�, 0 enumber eNumber�+ 0 efrom eFrom�* 
0 eto eTo
 
��)�(�'�&�%
��$�#�"
��!� �) "0 astextparameter asTextParameter�( 0 
asnsstring 
asNSString
�' 
msng�& "0 uppercasestring uppercaseString
�% 
ctxt�$ *0 asnslocaleparameter asNSLocaleParameter�# 80 uppercasestringwithlocale_ uppercaseStringWithLocale_�" 0 etext eText ��
� 
errn� 0 enumber eNumber ��
� 
erob� 0 efrom eFrom ���
� 
errt� 
0 eto eTo�  �! �  
0 _error  �6 Q @b  b  ��l+ k+ E�O��  �j+ �&Y �b  ��l+ k+ �&W X 	 
*룤���+ � �
����
� .Txt:CapTnull���     ctxt� 0 thetext theText� ��
� 
Loca {���� 0 
localecode 
localeCode�  
� 
msng�   ������
�	� 0 thetext theText� 0 
localecode 
localeCode� 0 
asocstring 
asocString� 0 etext eText� 0 enumber eNumber�
 0 efrom eFrom�	 
0 eto eTo 
������
����� ��� "0 astextparameter asTextParameter� 0 
asnsstring 
asNSString
� 
msng� &0 capitalizedstring capitalizedString
� 
ctxt� *0 asnslocaleparameter asNSLocaleParameter� <0 capitalizedstringwithlocale_ capitalizedStringWithLocale_� 0 etext eText ����
�� 
errn�� 0 enumber eNumber ����
�� 
erob�� 0 efrom eFrom ������
�� 
errt�� 
0 eto eTo��  �  �� 
0 _error  � Q @b  b  ��l+ k+ E�O��  �j+ �&Y �b  ��l+ k+ �&W X 	 
*룤���+ � ��������
�� .Txt:LowTnull���     ctxt�� 0 thetext theText�� ����
�� 
Loca {�������� 0 
localecode 
localeCode��  
�� 
msng��   ���������������� 0 thetext theText�� 0 
localecode 
localeCode�� 0 
asocstring 
asocString�� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTo -����������J������V������ "0 astextparameter asTextParameter�� 0 
asnsstring 
asNSString
�� 
msng�� "0 lowercasestring lowercaseString
�� 
ctxt�� *0 asnslocaleparameter asNSLocaleParameter�� 80 lowercasestringwithlocale_ lowercaseStringWithLocale_�� 0 etext eText ����
�� 
errn�� 0 enumber eNumber ����
�� 
erob�� 0 efrom eFrom ������
�� 
errt�� 
0 eto eTo��  �� �� 
0 _error  �� Q @b  b  ��l+ k+ E�O��  �j+ �&Y �b  ��l+ k+ �&W X 	 
*룤���+ � ��f������
�� .Txt:FTxtnull���     ctxt�� 0 templatetext templateText�� ����
�� 
Usin {�������� 0 	thevalues 	theValues��  ��  ��   ������������������ 0 templatetext templateText�� 0 	thevalues 	theValues�� 0 templateitems templateItems�� 0 i  �� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTo pq������������������������������� "0 astextparameter asTextParameter�� ,0 _parseformattemplate _parseFormatTemplate
�� 
kocl
�� 
scpt
�� .corecnte****       ****
�� 
leng
� 
cobj� 0 getitem getItem
� 
ctxt� "0 aslistparameter asListParameter
� 
long� 0 etext eText ��
� 
errn� 0 enumber eNumber �� 
� 
erob� 0 efrom eFrom  ���
� 
errt� 
0 eto eTo�  
� 
errn
� 
erob
� 
errt� � 0 	_jointext 	_joinText� � 
0 _error  �� � ��� �*b  ��l+ k+ E�OlE�O k�kv��l k  ( "l��,Elh ���/Ek+ 
�&��/F[OY��Y 4b  ��l+ E�O #l��,Elh ���/E�&/E�&��/F[OY��W &X  )a �a �a �a a ��/%a %�%O*�a l+ VW X  *a ����a + � ���!"�
� .Txt:Normnull���     ctxt� 0 thetext theText� �#$
� 
NoFo# {��%� 0 nopts nOpts�  % �&� &  �
� LiBrLiOX$ �'�
� 
Loca' {��(� 0 
localecode 
localeCode�  �  ! ������������ 0 thetext theText� 0 nopts nOpts� 0 
localecode 
localeCode� 0 	linebreak 	lineBreak� 0 
asocstring 
asocString� 0 foldingflags foldingFlags� 0 didnormalize didNormalize� 0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eTo" I8�D��T���������������������~;?�}�|�{�z�y^�x|���w�v�u�t���s'26�r�q�pm�o�n��m�l��k�j(��i�h�g)��f�e� "0 astextparameter asTextParameter� "0 aslistparameter asListParameter
� 
leng
� LiBrLiOX
� 
cpar
� 
lnfd� 0 	_jointext 	_joinText
� 
msng
� LiBrLiCM
� 
errn�f
� 
ret 
� LiBrLiWi� 0 
asnsstring 
asNSString
� NoFoNoCa
� NoFoNoDi� �
� NoFoNoWi� � *0 asnslocaleparameter asNSLocaleParameter� H0 "stringbyfoldingwithoptions_locale_ "stringByFoldingWithOptions_locale_
�~ NoFoNoSp
�} misccura�| 60 nsregularexpressionsearch NSRegularExpressionSearch�{ 
0 length  �z �y �0 >stringbyreplacingoccurrencesofstring_withstring_options_range_ >stringByReplacingOccurrencesOfString_withString_options_range_
�x 
spac
�w NoFoNoSP
�v NoFoNoTP
�u NoFoNoAO
�t 
bool�s H0 "stringbyapplyingtransform_reverse_ "stringByApplyingTransform_reverse_
�r NoFoNo_C�q N0 %precomposedstringwithcanonicalmapping %precomposedStringWithCanonicalMapping
�p NoFoNo_D�o L0 $decomposedstringwithcanonicalmapping $decomposedStringWithCanonicalMapping
�n NoFoNoKC�m V0 )precomposedstringwithcompatibilitymapping )precomposedStringWithCompatibilityMapping
�l NoFoNoKD�k T0 (decomposedstringwithcompatibilitymapping (decomposedStringWithCompatibilityMapping�j 0 etext eText( �d�c�b
�d 
errn�cf�b  
�i 
list�h .0 throwinvalidparameter throwInvalidParameter
�g 
ctxt) �a�`*
�a 
errn�` 0 enumber eNumber* �_�^+
�_ 
erob�^ 0 efrom eFrom+ �]�\�[
�] 
errt�\ 
0 eto eTo�[  �f �e 
0 _error  ��kb  ��l+ E�Ob  ��l+ E�O��,j  �Y hO��kv  *��-�l+ 	Y hO�jv  �Y hO���kv �E�Y �E�O��kv 0�� )��l�Y hO��,k  *��-�l+ 	Y hO�E�Y hO�a kv 6�� )��la Y hO��,k  *��-��%l+ 	Y hO��%E�Y hOb  �k+ E�OjE�O�a kv 
�kE�Y hO�a kv �a E�Y hO�a kv �a E�Y hO�j ��b  �a l+ l+ E�Y hO�a kv ��a a a a ,j�j+  lva !+ "E�O��  #�a #_ $a a ,j�j+  lva !+ "E�Y =�a %�a a ,j�j+  lva !+ "E�O�a &_ $a a ,j�j+  lva !+ "E�Y (�� !�a '�a a ,j�j+  lva !+ "E�Y hO�a (kv 5�a )kv
 �a *kva +& )��la ,Y hO�a -fl+ .E�Y i�a )kv '�a *kv )��la /Y hO�a 0fl+ .E�Y :�a *kv /�a 1fl+ .E�O�a 2a 3a a ,j�j+  lva !+ "E�Y hO�a 4kv �j+ 5E�OeE�Y fE�O�a 6kv !� )��la 7Y hO�j+ 8E�OeE�Y hO�a 9kv !� )��la :Y hO�j+ ;E�OeE�Y hO�a <kv !� )��la =Y hO�j+ >E�OeE�Y hW X ? @b  �a Aa B�a !+ CO�a D&W X ? E*a F����a G+ H� �Z��Y�X,-�W
�Z .Txt:PadTnull���     ctxt�Y 0 thetext theText�X �V�U.
�V 
toPl�U 0 	textwidth 	textWidth. �T/0
�T 
Char/ {�S�R��S 0 padtext padText�R  0 �Q1�P
�Q 
From1 {�O�N�M�O 0 whichend whichEnd�N  
�M LeTrLCha�P  , �L�K�J�I�H�G�F�E�D�C�B�L 0 thetext theText�K 0 	textwidth 	textWidth�J 0 padtext padText�I 0 whichend whichEnd�H 0 
widthtoadd 
widthToAdd�G 0 padsize padSize�F 0 	padoffset 	padOffset�E 0 etext eText�D 0 enumber eNumber�C 0 efrom eFrom�B 
0 eto eTo- ��A�@�?!8�>=�=�<�;�:�9��8�72��6�5�A "0 astextparameter asTextParameter�@ (0 asintegerparameter asIntegerParameter
�? 
leng
�> 
ctxt�= �< .0 throwinvalidparameter throwInvalidParameter
�; LeTrLCha
�: LeTrTCha
�9 LeTrBCha�8 >0 throwinvalidconstantparameter throwInvalidConstantParameter�7 0 etext eText2 �4�33
�4 
errn�3 0 enumber eNumber3 �2�14
�2 
erob�1 0 efrom eFrom4 �0�/�.
�0 
errt�/ 
0 eto eTo�.  �6 �5 
0 _error  �Wb  ��l+ E�Ob  ��l+ E�O���,E�O�j �Y hOb  ��l+ E�O��,E�O��,j  b  �����+ 
Y hO h��,����%E�[OY��O��  �[�\[Zk\Z�2�%Y s��  ��,�#E�O��[�\[Zk�\Z��2%Y P��  ?�k �[�\[Zk\Z�l"2�%E�Y hO��,�#E�O��[�\[Zk�\Z��kl"2%Y b  ��l+ W X  *a ����a + � �-��,�+56�*
�- .Txt:SliTnull���     ctxt�, 0 thetext theText�+ �)78
�) 
FIdx7 {�(�'�&�( 0 
startindex 
startIndex�'  
�& 
msng8 �%9�$
�% 
TIdx9 {�#�"�!�# 0 endindex endIndex�"  
�! 
msng�$  5 � ��������  0 thetext theText� 0 
startindex 
startIndex� 0 endindex endIndex� 0 	thelength 	theLength� 0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eTo6  ������!&*�>�MRg���u�������: ��� "0 astextparameter asTextParameter
� 
leng
� 
long� � .0 throwinvalidparameter throwInvalidParameter
� 
msng� (0 asintegerparameter asIntegerParameter
� 
ctxt
� 
errn��[
� 
bool� 0 etext eText: �
�	;
�
 
errn�	 0 enumber eNumber; ��<
� 
erob� 0 efrom eFrom< ���
� 
errt� 
0 eto eTo�  � � 
0 _error  �*��b  ��l+ E�O��,E�O�j  7�j  b  �����+ Y hO�j  b  �����+ Y hO�Y hO�� ]b  ��l+ E�O�j  b  �����+ Y hO��  -��' �Y �� 	a Y �[a \[Z�\Zi2EY hY ��  )a a la Y hO�� cb  �a l+ E�O�j  b  �a �a �+ Y hO��  -��' 	a Y �� �Y �[a \[Zk\Z�2EY hY hO�j �k�E�Y hO�j �k�E�Y hO��
 �k	 	�ka &a &
 ��	 	��a &a & 	a Y hO�k kE�Y �� �E�Y hO�k kE�Y �� �E�Y hO�[a \[Z�\Z�2EW X  *a ����a + � �0��=>� 
� .Txt:TrmTnull���     ctxt� 0 thetext theText� ��?��
�� 
From? {�������� 0 whichend whichEnd��  
�� LeTrBCha��  = ������������������ 0 thetext theText�� 0 whichend whichEnd�� 0 
startindex 
startIndex�� 0 endindex endIndex�� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTo> E��������\��`alo����������@������� "0 astextparameter asTextParameter
�� LeTrLCha
�� LeTrTCha
�� LeTrBCha�� >0 throwinvalidconstantparameter throwInvalidConstantParameter
�� 
cobj
�� 
cha 
�� 
ctxt�� 0 etext eText@ ����A
�� 
errn�� 0 enumber eNumberA ����B
�� 
erob�� 0 efrom eFromB ������
�� 
errt�� 
0 eto eTo��  �� �� 
0 _error  �  � �b  ��l+ E�O���mv�kv b  ��l+ Y hO�� {��  �Y hOkilvE[�k/E�Z[�l/E�ZO��lv�kv  h��/� �kE�[OY��Y hO��lv�kv  h��/� �kE�[OY��Y hO�[�\[Z�\Z�2EVW X  *a ����a + � �������CD���� .0 _aslinebreakparameter _asLineBreakParameter�� ��E�� E  ������ 0 linebreaktype lineBreakType�� 0 parametername parameterName��  C ������ 0 linebreaktype lineBreakType�� 0 parametername parameterNameD ������������
�� LiBrLiOX
�� 
lnfd
�� LiBrLiCM
�� 
ret 
�� LiBrLiWi�� >0 throwinvalidconstantparameter throwInvalidConstantParameter�� 0��  �EY %��  �Y ��  	��%Y b  ��l+ � ������FG���� 0 
_splittext 
_splitText�� ��H�� H  ������ 0 thetext theText�� 0 theseparator theSeparator��  F �������������� 0 thetext theText�� 0 theseparator theSeparator�� 0 delimiterlist delimiterList�� 0 aref aRef�� 0 oldtids oldTIDs�� 0 
resultlist 
resultListG ������������I:?������� 0 aslist asList
�� 
kocl
�� 
cobj
�� .corecnte****       ****
�� 
pcnt
� 
ctxt�  I ���
� 
errn��\�  � � 60 throwinvalidparametertype throwInvalidParameterType
� 
ascr
� 
txdl
� 
citm�� _b  �k+  E�O 5�[��l kh  ��,�&��,FW X  b  �����+ [OY��O��,E�O���,FO��-E�O���,FO�� �c��JK�� 0 _splitpattern _splitPattern� �L� L  ��� 0 thetext theText� 0 patterntext patternText�  J 
����������� 0 thetext theText� 0 patterntext patternText� 0 asocpattern asocPattern� 0 
asocstring 
asocString� &0 asocnonmatchstart asocNonMatchStart� 0 
resultlist 
resultList�  0 asocmatcharray asocMatchArray� 0 i  �  0 asocmatchrange asocMatchRange�  0 asocmatchstart asocMatchStartK ����}�����������������
� 
kocl
� 
list
� .corecnte****       ****
� 
Sepa
� .Txt:JoiTnull���     ****� B0 _asnsregularexpressionparameter _asNSRegularExpressionParameter� ,0 asnormalizednsstring asNormalizedNSString� 
0 length  � @0 matchesinstring_options_range_ matchesInString_options_range_� 	0 count  �  0 objectatindex_ objectAtIndex_� 0 rangeatindex_ rangeAtIndex_� 0 location  � � *0 substringwithrange_ substringWithRange_
� 
ctxt� *0 substringfromindex_ substringFromIndex_
� 
leng
� 
cobj
� 
bool� Ρkv��l k  ���l E�Y hO*��l+ E�Ob  �k+ E�OjE�OjvE�O��jj�j+ 	lvm+ 
E�O Hj�j+ kkh ��k+ jk+ E�O�j+ E�O��驤�k+ a &�6FO��j+ 	E�[OY��O��k+ a &�6FO�a ,k 	 �a k/a ,j a & jvY hO�� � ��MN�� 0 	_jointext 	_joinText� �O� O  ��� 0 thelist theList� 0 separatortext separatorText�  M ����� 0 thelist theList� 0 separatortext separatorText� 0 oldtids oldTIDs� 0 
resulttext 
resultTextN 
����PM�R��
� 
ascr
� 
txdl
� 
ctxt�  P �~�}�|
�~ 
errn�}�\�|  
� 
list� � .0 throwinvalidparameter throwInvalidParameter� 9��,E�O���,FO 
��&E�W X  ���,FOb  �����+ 	O���,FO�� �{j�z�yQR�x
�{ .Txt:SplTnull���     ctxt�z 0 thetext theText�y �wST
�w 
SepaS {�v�u�t�v 0 theseparator theSeparator�u  
�t 
msngT �sU�r
�s 
UsinU {�q�p�o�q 0 matchformat matchFormat�p  
�o SerECmpI�r  Q �n�m�l�k�j�i�h�n 0 thetext theText�m 0 theseparator theSeparator�l 0 matchformat matchFormat�k 0 etext eText�j 0 enumber eNumber�i 0 efrom eFrom�h 
0 eto eToR ��g�f�e�d��c�b���a�`���_�^��]�\V��[�Z�g "0 astextparameter asTextParameter
�f 
leng
�e 
msng
�d .Txt:TrmTnull���     ctxt�c 0 _splitpattern _splitPattern
�b SerECmpI�a 0 
_splittext 
_splitText
�` SerECmpE
�_ SerECmpP
�^ SerECmpD�] >0 throwinvalidconstantparameter throwInvalidConstantParameter�\ 0 etext eTextV �Y�XW
�Y 
errn�X 0 enumber eNumberW �W�VX
�W 
erob�V 0 efrom eFromX �U�T�S
�U 
errt�T 
0 eto eTo�S  �[ �Z 
0 _error  �x � �b  ��l+ E�O��,j  jvY hO��  *�j �l+ Y _��  �� *��l+ 
VY H��  �� *��l+ 
VY 1��  *��l+ Y  ��  *��l+ 
Y b  �a l+ W X  *a ����a + � �R�Q�PYZ�O
�R .Txt:JoiTnull���     ****�Q 0 thelist theList�P �N[�M
�N 
Sepa[ {�L�K
�L 0 separatortext separatorText�K  �M  Y �J�I�H�G�F�E�J 0 thelist theList�I 0 separatortext separatorText�H 0 etext eText�G 0 enumber eNumber�F 0 efrom eFrom�E 
0 eto eToZ 
�D"�C�B�A\.�@�?�D "0 aslistparameter asListParameter�C "0 astextparameter asTextParameter�B 0 	_jointext 	_joinText�A 0 etext eText\ �>�=]
�> 
errn�= 0 enumber eNumber] �<�;^
�< 
erob�; 0 efrom eFrom^ �:�9�8
�: 
errt�9 
0 eto eTo�8  �@ �? 
0 _error  �O 2 !*b  ��l+ b  ��l+ l+ W X  *碣���+ 	� �7>�6�5_`�4
�7 .Txt:SplPnull���     ctxt�6 0 thetext theText�5  _ �3�2�1�0�/�3 0 thetext theText�2 0 etext eText�1 0 enumber eNumber�0 0 efrom eFrom�/ 
0 eto eTo` L�.�-�,aX�+�*�. "0 astextparameter asTextParameter
�- 
cpar�, 0 etext eTexta �)�(b
�) 
errn�( 0 enumber eNumberb �'�&c
�' 
erob�& 0 efrom eFromc �%�$�#
�% 
errt�$ 
0 eto eTo�#  �+ �* 
0 _error  �4 % b  ��l+ �-EW X  *塢���+ � �"h�!� de�
�" .Txt:JoiPnull���     ****�! 0 thelist theList�  �f�
� 
LiBrf {���� 0 linebreaktype lineBreakType�  
� LiBrLiOX�  d ������� 0 thelist theList� 0 linebreaktype lineBreakType� 0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eToe 
|�����g���� "0 aslistparameter asListParameter� .0 _aslinebreakparameter _asLineBreakParameter� 0 	_jointext 	_joinText� 0 etext eTextg ��h
� 
errn� 0 enumber eNumberh ��
i
� 
erob�
 0 efrom eFromi �	��
�	 
errt� 
0 eto eTo�  � � 
0 _error  � . *b  ��l+ *��l+ l+ W X  *碣���+ 	 ascr  ��ޭ