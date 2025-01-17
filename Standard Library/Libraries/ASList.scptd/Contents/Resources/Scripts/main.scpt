FasdUAS 1.101.10   ��   ��    k             l      ��  ��    � � List -- manipulate AppleScript lists 

Notes:

- To split and join lists of text, use the Text library's `split text` and `join text` commands.

     � 	 	$   L i s t   - -   m a n i p u l a t e   A p p l e S c r i p t   l i s t s   
 
 N o t e s : 
 
 -   T o   s p l i t   a n d   j o i n   l i s t s   o f   t e x t ,   u s e   t h e   T e x t   l i b r a r y ' s   ` s p l i t   t e x t `   a n d   ` j o i n   t e x t `   c o m m a n d s . 
 
   
  
 l     ��������  ��  ��        x     
�� ����    2   ��
�� 
osax��        l     ��������  ��  ��        l     ��  ��    J D--------------------------------------------------------------------     �   � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -      l     ��  ��      support     �      s u p p o r t      l     ��������  ��  ��        l         !  j   
 �� "�� 0 _support   " N   
  # # 4   
 �� $
�� 
scpt $ m     % % � & &  T y p e S u p p o r t   "  used for parameter checking    ! � ' ' 8   u s e d   f o r   p a r a m e t e r   c h e c k i n g   ( ) ( l     ��������  ��  ��   )  * + * i    , - , I      �� .���� 
0 _error   .  / 0 / o      ���� 0 handlername handlerName 0  1 2 1 o      ���� 0 etext eText 2  3 4 3 o      ���� 0 enumber eNumber 4  5 6 5 o      ���� 0 efrom eFrom 6  7�� 7 o      ���� 
0 eto eTo��  ��   - I     �� 8���� 20 _errorwithpartialresult _errorWithPartialResult 8  9 : 9 o    ���� 0 handlername handlerName :  ; < ; o    ���� 0 etext eText <  = > = o    ���� 0 enumber eNumber >  ? @ ? o    ���� 0 efrom eFrom @  A B A o    ���� 
0 eto eTo B  C�� C m    ��
�� 
msng��  ��   +  D E D l     ��������  ��  ��   E  F G F i    H I H I      �� J���� 20 _errorwithpartialresult _errorWithPartialResult J  K L K o      ���� 0 handlername handlerName L  M N M o      ���� 0 etext eText N  O P O o      ���� 0 enumber eNumber P  Q R Q o      ���� 0 efrom eFrom R  S T S o      ���� 
0 eto eTo T  U�� U o      ���� 0 epartial ePartial��  ��   I n     V W V I    �� X���� 0 rethrowerror rethrowError X  Y Z Y m     [ [ � \ \  L i s t Z  ] ^ ] o    ���� 0 handlername handlerName ^  _ ` _ o    ���� 0 etext eText `  a b a o    	���� 0 enumber eNumber b  c d c o   	 
���� 0 efrom eFrom d  e f e o   
 ���� 
0 eto eTo f  g h g m    ��
�� 
msng h  i�� i o    ���� 0 epartial ePartial��  ��   W o     ���� 0 _support   G  j k j l     ��������  ��  ��   k  l m l l     ��������  ��  ��   m  n o n l     �� p q��   p  -----    q � r r 
 - - - - - o  s t s l     ��������  ��  ��   t  u v u i    w x w I      �� y���� "0 _makelistobject _makeListObject y  z { z o      ���� 0 len   {  |�� | o      ���� 0 padvalue padValue��  ��   x l    _ } ~  } k     _ � �  � � � h     �� ��� 0 
listobject 
listObject � j     �� ��� 
0 _list_   � J     ����   �  � � � Z    Y � ����� � ?     � � � o    	���� 0 len   � m   	 
����   � k    U � �  � � � r     � � � J     � �  � � � o    ���� 0 padvalue padValue �  � � � o    ���� 0 padvalue padValue �  � � � o    ���� 0 padvalue padValue �  ��� � o    ���� 0 padvalue padValue��   � n      � � � o    ���� 
0 _list_   � o    ���� 0 
listobject 
listObject �  � � � V    5 � � � r   % 0 � � � b   % , � � � n  % ( � � � o   & (���� 
0 _list_   � o   % &���� 0 
listobject 
listObject � n  ( + � � � o   ) +���� 
0 _list_   � o   ( )���� 0 
listobject 
listObject � n      � � � o   - /���� 
0 _list_   � o   , -���� 0 
listobject 
listObject � A    $ � � � n   " � � � 1     "��
�� 
leng � n     � � � o     ���� 
0 _list_   � o    ���� 0 
listobject 
listObject � o   " #���� 0 len   �  ��� � Z  6 U � ����� � ?   6 = � � � n  6 ; � � � 1   9 ;��
�� 
leng � n  6 9 � � � o   7 9���� 
0 _list_   � o   6 7���� 0 
listobject 
listObject � o   ; <���� 0 len   � r   @ Q � � � n   @ M � � � 7  C M�� � �
�� 
cobj � m   G I����  � o   J L���� 0 len   � n  @ C � � � o   A C���� 
0 _list_   � o   @ A���� 0 
listobject 
listObject � n      � � � o   N P���� 
0 _list_   � o   M N���� 0 
listobject 
listObject��  ��  ��  ��  ��   �  ��� � L   Z _ � � n  Z ^ � � � o   [ ]���� 
0 _list_   � o   Z [���� 0 
listobject 
listObject��   ~ � � make a new list of specified length using the supplied value as padding; caution: padValue will not be copied, so should be an immutable type (e.g. number, string, constant; not date/list/record/script/reference)     � � ��   m a k e   a   n e w   l i s t   o f   s p e c i f i e d   l e n g t h   u s i n g   t h e   s u p p l i e d   v a l u e   a s   p a d d i n g ;   c a u t i o n :   p a d V a l u e   w i l l   n o t   b e   c o p i e d ,   s o   s h o u l d   b e   a n   i m m u t a b l e   t y p e   ( e . g .   n u m b e r ,   s t r i n g ,   c o n s t a n t ;   n o t   d a t e / l i s t / r e c o r d / s c r i p t / r e f e r e n c e ) v  � � � l     ��������  ��  ��   �  � � � l     ��������  ��  ��   �  � � � l     �� � ���   � J D--------------------------------------------------------------------    � � � � � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - �  � � � l     �� � ���   �   basic operations    � � � � "   b a s i c   o p e r a t i o n s �  � � � l     ��������  ��  ��   �  � � � i     � � � I     � � �
� .Lst:Instnull���     **** � o      �~�~ 0 thelist theList � �} � �
�} 
Valu � o      �|�| 0 thevalue theValue � �{ � �
�{ 
Befo � |�z�y ��x ��z  �y   � o      �w�w 0 beforeindex beforeIndex�x   � l      ��v�u � m      �t
�t 
msng�v  �u   � �s � �
�s 
Afte � |�r�q ��p ��r  �q   � o      �o�o 0 
afterindex 
afterIndex�p   � l      ��n�m � m      �l
�l 
msng�n  �m   � �k ��j
�k 
Conc � |�i�h ��g ��i  �h   � o      �f�f 0 isjoin isJoin�g   � l      ��e�d � m      �c
�c boovfals�e  �d  �j   � Q    | � � � � k   f � �  � � � h    
�b ��b 0 
listobject 
listObject � j     �a ��a 
0 _list_   � n     � � � I    �` ��_�` "0 aslistparameter asListParameter �  � � � o    
�^�^ 0 thelist theList �  ��] � m   
  � � � � �  �]  �_   � o     �\�\ 0 _support   �  � � � Z   ) � ��[�Z � G       H     o    �Y�Y 0 isjoin isJoin =     l   �X�W I   �V
�V .corecnte****       **** J     	�U	 o    �T�T 0 thevalue theValue�U   �S
�R
�S 
kocl
 m    �Q
�Q 
list�R  �X  �W   m    �P�P   � r     % J     # �O o     !�N�N 0 thevalue theValue�O   o      �M�M 0 thevalue theValue�[  �Z   �  Z   * >  * - o   * +�L�L 0 
afterindex 
afterIndex m   + ,�K
�K 
msng l  0 � k   0 �  Z  0 @�J�I >  0 3  o   0 1�H�H 0 beforeindex beforeIndex  m   1 2�G
�G 
msng R   6 <�F!"
�F .ascrerr ****      � ****! m   : ;## �$$ � E x p e c t e d    b e f o r e   i t e m    O R    a f t e r   i t e m    p a r a m e t e r ,   b u t   r e c e i v e d   b o t h ." �E%�D
�E 
errn% m   8 9�C�C�Y�D  �J  �I   &'& r   A N()( n  A L*+* I   F L�B,�A�B (0 asintegerparameter asIntegerParameter, -.- o   F G�@�@ 0 
afterindex 
afterIndex. /�?/ m   G H00 �11  a f t e r   i t e m�?  �A  + o   A F�>�> 0 _support  ) o      �=�= 0 
afterindex 
afterIndex' 232 r   O \454 n  O Z676 I   T Z�<8�;�< (0 asbooleanparameter asBooleanParameter8 9:9 o   T U�:�: 0 isjoin isJoin: ;�9; m   U V<< �==  c o n c a t e n a t i o n�9  �;  7 o   O T�8�8 0 _support  5 o      �7�7 0 isjoin isJoin3 >?> Z  ] t@A�6�5@ A   ] `BCB o   ] ^�4�4 0 
afterindex 
afterIndexC m   ^ _�3�3  A r   c pDED [   c nFGF [   c lHIH l  c jJ�2�1J n  c jKLK 1   f j�0
�0 
lengL n  c fMNM o   d f�/�/ 
0 _list_  N o   c d�.�. 0 
listobject 
listObject�2  �1  I o   j k�-�- 0 
afterindex 
afterIndexG m   l m�,�, E o      �+�+ 0 
afterindex 
afterIndex�6  �5  ? O�*O Z   u �PQ�)�(P ?   u ~RSR o   u v�'�' 0 
afterindex 
afterIndexS l  v }T�&�%T n  v }UVU 1   y }�$
�$ 
lengV n  v yWXW o   w y�#�# 
0 _list_  X o   v w�"�" 0 
listobject 
listObject�&  �%  Q n  � �YZY I   � ��![� �! 80 throwinvalidparameterindex throwInvalidParameterIndex[ \]\ N   � �^^ n   � �_`_ 9   � ��
� 
insl` n   � �aba 4   � ��c
� 
cobjc o   � ��� 0 
afterindex 
afterIndexb l  � �d��d e   � �ee n  � �fgf o   � ��� 
0 _list_  g o   � ��� 0 
listobject 
listObject�  �  ] h�h m   � �ii �jj  a f t e r   i t e m�  �   Z o   � ��� 0 _support  �)  �(  �*   #  insert after specified index    �kk :   i n s e r t   a f t e r   s p e c i f i e d   i n d e x lml >  � �non o   � ��� 0 beforeindex beforeIndexo m   � ��
� 
msngm p�p l  �qrsq k   �tt uvu r   � �wxw n  � �yzy I   � ��{�� (0 asintegerparameter asIntegerParameter{ |}| o   � ��� 0 beforeindex beforeIndex} ~�~ m   � � ���  b e f o r e   i t e m�  �  z o   � ��� 0 _support  x o      �� 0 beforeindex beforeIndexv ��� Z   � ������ ?   � ���� o   � ��� 0 beforeindex beforeIndex� m   � ���  � r   � ���� \   � ���� o   � ��� 0 beforeindex beforeIndex� m   � ��
�
 � o      �	�	 0 
afterindex 
afterIndex� ��� A   � ���� o   � ��� 0 beforeindex beforeIndex� m   � ���  � ��� r   � ���� [   � ���� l  � ����� n  � ���� 1   � ��
� 
leng� n  � ���� o   � ��� 
0 _list_  � o   � ��� 0 
listobject 
listObject�  �  � o   � �� �  0 beforeindex beforeIndex� o      ���� 0 
afterindex 
afterIndex�  � l  � ����� r   � ���� n  � ���� 1   � ���
�� 
leng� n  � ���� o   � ����� 
0 _list_  � o   � ����� 0 
listobject 
listObject� o      ���� 0 
afterindex 
afterIndex�   `before item 0`   � ���     ` b e f o r e   i t e m   0 `� ���� Z   �������� G   � ���� ?   � ���� o   � ����� 0 
afterindex 
afterIndex� l  � ������� n  � ���� 1   � ���
�� 
leng� n  � ���� o   � ����� 
0 _list_  � o   � ����� 0 
listobject 
listObject��  ��  � A   � ���� o   � ����� 0 
afterindex 
afterIndex� m   � �����  � n  ���� I   �������� 80 throwinvalidparameterindex throwInvalidParameterIndex� ��� N   ��� n   �
��� 8  
��
�� 
insl� n   ���� 4  ���
�� 
cobj� o  ���� 0 beforeindex beforeIndex� l  ������� e   ��� n  ���� o   � ���� 
0 _list_  � o   � ����� 0 
listobject 
listObject��  ��  � ���� m  �� ���  b e f o r e   i t e m��  ��  � o   � ����� 0 _support  ��  ��  ��  r $  insert before specified index   s ��� <   i n s e r t   b e f o r e   s p e c i f i e d   i n d e x�   l ���� L  �� b  ��� o  ���� 0 thelist theList� o  ���� 0 thevalue theValue� T N if no insertion index is specified, the default behavior is to append to list   � ��� �   i f   n o   i n s e r t i o n   i n d e x   i s   s p e c i f i e d ,   t h e   d e f a u l t   b e h a v i o r   i s   t o   a p p e n d   t o   l i s t ���� Z  f����� =  !��� o  ���� 0 
afterindex 
afterIndex� m   ����  � L  $*�� b  $)��� o  $%���� 0 thevalue theValue� n %(��� o  &(���� 
0 _list_  � o  %&���� 0 
listobject 
listObject� ��� =  -6��� o  -.���� 0 
afterindex 
afterIndex� n .5��� 1  15��
�� 
leng� n .1��� o  /1���� 
0 _list_  � o  ./���� 0 
listobject 
listObject� ���� L  9?�� b  9>��� n 9<��� o  :<���� 
0 _list_  � o  9:���� 0 
listobject 
listObject� o  <=���� 0 thevalue theValue��  � L  Bf�� b  Be��� b  BS��� l BQ������ n  BQ��� 7 EQ����
�� 
cobj� m  KM���� � o  NP���� 0 
afterindex 
afterIndex� n BE��� o  CE���� 
0 _list_  � o  BC���� 0 
listobject 
listObject��  ��  � o  QR���� 0 thevalue theValue� l Sd������ n  Sd��� 7 Vd����
�� 
cobj� l \`������ [  \`��� o  ]^���� 0 
afterindex 
afterIndex� m  ^_���� ��  ��  � m  ac������� n SV��� o  TV���� 
0 _list_  � o  ST���� 0 
listobject 
listObject��  ��  ��   � R      ����
�� .ascrerr ****      � ****� o      ���� 0 etext eText� ��� 
�� 
errn� o      ���� 0 enumber eNumber  ��
�� 
erob o      ���� 0 efrom eFrom ����
�� 
errt o      ���� 
0 eto eTo��   � I  n|������ 
0 _error    m  or �   i n s e r t   i n t o   l i s t 	
	 o  rs���� 0 etext eText
  o  st���� 0 enumber eNumber  o  tu���� 0 efrom eFrom �� o  uv���� 
0 eto eTo��  ��   �  l     ��������  ��  ��    l     ��������  ��  ��    i  ! $ I     ��
�� .Lst:Delenull���     **** o      ���� 0 thelist theList ��
�� 
Indx |��������  ��   o      ���� 0 theindex theIndex��   l     ���� d       m      ���� ��  ��   �� !
�� 
FIdx  |����"��#��  ��  " o      ���� 0 
startindex 
startIndex��  # l     $����$ m      ��
�� 
msng��  ��  ! ��%��
�� 
TIdx% |����&��'��  ��  & o      ���� 0 endindex endIndex��  ' l     (����( m      ��
�� 
msng��  ��  ��   Q    �)*+) k   �,, -.- h    
��/�� 0 
listobject 
listObject/ j     ��0�� 
0 _list_  0 n    121 I    ��3���� "0 aslistparameter asListParameter3 454 o    
���� 0 thelist theList5 6��6 m   
 77 �88  ��  ��  2 o     ���� 0 _support  . 9:9 r    ;<; n   =>= 1    ��
�� 
leng> n   ?@? o    ���� 
0 _list_  @ o    ���� 0 
listobject 
listObject< o      ���� 0 
listlength 
listLength: ABA Z   *CD����C >   EFE o    ���� 0 
startindex 
startIndexF m    ��
�� 
msngD r    &GHG n   $IJI I    $��K���� (0 asintegerparameter asIntegerParameterK LML o    ���� 0 
startindex 
startIndexM N�N m     OO �PP  f r o m   i t e m�  ��  J o    �~�~ 0 _support  H o      �}�} 0 
startindex 
startIndex��  ��  B QRQ Z  + BST�|�{S >  + .UVU o   + ,�z�z 0 endindex endIndexV m   , -�y
�y 
msngT r   1 >WXW n  1 <YZY I   6 <�x[�w�x (0 asintegerparameter asIntegerParameter[ \]\ o   6 7�v�v 0 endindex endIndex] ^�u^ m   7 8__ �``  t o   i t e m�u  �w  Z o   1 6�t�t 0 _support  X o      �s�s 0 endindex endIndex�|  �{  R aba Z   C3cd�rec F   C Nfgf =  C Fhih o   C D�q�q 0 
startindex 
startIndexi m   D E�p
�p 
msngg =  I Ljkj o   I J�o�o 0 endindex endIndexk m   J K�n
�n 
msngd k   Q �ll mnm r   Q ^opo n  Q \qrq I   V \�ms�l�m (0 asintegerparameter asIntegerParameters tut o   V W�k�k 0 theindex theIndexu v�jv m   W Xww �xx  i t e m�j  �l  r o   Q V�i�i 0 _support  p o      �h�h 0 
startindex 
startIndexn yzy Z  _ p{|�g�f{ A   _ b}~} o   _ `�e�e 0 
startindex 
startIndex~ m   ` a�d�d  | r   e l� [   e j��� [   e h��� o   e f�c�c 0 
listlength 
listLength� m   f g�b�b � o   h i�a�a 0 
startindex 
startIndex� o      �`�` 0 
startindex 
startIndex�g  �f  z ��� Z   q ����_�^� G   q |��� =   q t��� o   q r�]�] 0 
startindex 
startIndex� m   r s�\�\  � ?   w z��� o   w x�[�[ 0 
startindex 
startIndex� o   x y�Z�Z 0 
listlength 
listLength� n   ���� I   � ��Y��X�Y 80 throwinvalidparameterindex throwInvalidParameterIndex� ��� N   � ��� n   � ���� 4   � ��W�
�W 
cobj� o   � ��V�V 0 
startindex 
startIndex� l  � ���U�T� e   � ��� n  � ���� o   � ��S�S 
0 _list_  � o   � ��R�R 0 
listobject 
listObject�U  �T  � ��Q� m   � ��� ���  i t e m�Q  �X  � o    ��P�P 0 _support  �_  �^  � ��O� r   � ���� o   � ��N�N 0 
startindex 
startIndex� o      �M�M 0 endindex endIndex�O  �r  e k   �3�� ��� Z   � �����L� =  � ���� o   � ��K�K 0 
startindex 
startIndex� m   � ��J
�J 
msng� r   � ���� m   � ��I�I � o      �H�H 0 
startindex 
startIndex� ��� =  � ���� o   � ��G�G 0 endindex endIndex� m   � ��F
�F 
msng� ��E� r   � ���� o   � ��D�D 0 
listlength 
listLength� o      �C�C 0 endindex endIndex�E  �L  � ��� Z  � ����B�A� A   � ���� o   � ��@�@ 0 
startindex 
startIndex� m   � ��?�?  � r   � ���� [   � ���� [   � ���� o   � ��>�> 0 
listlength 
listLength� m   � ��=�= � o   � ��<�< 0 
startindex 
startIndex� o      �;�; 0 
startindex 
startIndex�B  �A  � ��� Z  � ����:�9� A   � ���� o   � ��8�8 0 endindex endIndex� m   � ��7�7  � r   � ���� [   � ���� [   � ���� o   � ��6�6 0 
listlength 
listLength� m   � ��5�5 � o   � ��4�4 0 endindex endIndex� o      �3�3 0 endindex endIndex�:  �9  � ��� Z   �!����2� G   � ���� =   � ���� o   � ��1�1 0 
startindex 
startIndex� m   � ��0�0  � ?   � ���� o   � ��/�/ 0 
startindex 
startIndex� o   � ��.�. 0 
listlength 
listLength� n  � ���� I   � ��-��,�- 80 throwinvalidparameterindex throwInvalidParameterIndex� ��� N   � ��� n   � ���� 4   � ��+�
�+ 
cobj� o   � ��*�* 0 
startindex 
startIndex� l  � ���)�(� e   � ��� n  � ���� o   � ��'�' 
0 _list_  � o   � ��&�& 0 
listobject 
listObject�)  �(  � ��%� m   � ��� ���  f r o m   i t e m�%  �,  � o   � ��$�$ 0 _support  � ��� G   ���� =   � ��� o   � ��#�# 0 endindex endIndex� m   � ��"�"  � ?  ��� o  �!�! 0 endindex endIndex� o  � �  0 
listlength 
listLength� ��� n ��� I  ���� 80 throwinvalidparameterindex throwInvalidParameterIndex� ��� N  �� n  ��� 4  ��
� 
cobj� o  �� 0 endindex endIndex� l ���� e  �� n ��� o  �� 
0 _list_  � o  �� 0 
listobject 
listObject�  �  � ��� m  �� ���  t o   i t e m�  �  � o  �� 0 _support  �  �2  � ��� Z "3 ��  ?  "% o  "#�� 0 
startindex 
startIndex o  #$�� 0 endindex endIndex L  (/ n (. 2 +-�
� 
cobj n (+ o  )+�� 
0 _list_   o  ()�� 0 
listobject 
listObject�  �  �  b 	
	 Z  4h� =  47 o  45�� 0 
startindex 
startIndex m  56�
�
  k  :T  Z :O�	� G  :E =  := o  :;�� 0 
startindex 
startIndex o  ;<�� 0 
listlength 
listLength =  @C o  @A�� 0 endindex endIndex o  AB�� 0 
listlength 
listLength L  HK J  HJ��  �	  �   � r  PT J  PR��   o      � �  0 	startlist 	startList�  �   r  Wh  n Wf!"! 7 Zf��#$
�� 
cobj# m  ^`���� $ l ae%����% \  ae&'& o  bc���� 0 
startindex 
startIndex' m  cd���� ��  ��  " n WZ()( o  XZ���� 
0 _list_  ) o  WX���� 0 
listobject 
listObject  o      ���� 0 	startlist 	startList
 *+* Z  i�,-��., =  il/0/ o  ij���� 0 endindex endIndex0 o  jk���� 0 
listlength 
listLength- r  os121 J  oq����  2 o      ���� 0 endlist endList��  . r  v�343 n v�565 7 y���78
�� 
cobj7 l }�9����9 [  }�:;: o  ~���� 0 endindex endIndex; m  ����� ��  ��  8 m  ��������6 n vy<=< o  wy���� 
0 _list_  = o  vw���� 0 
listobject 
listObject4 o      ���� 0 endlist endList+ >��> L  ��?? b  ��@A@ o  ������ 0 	startlist 	startListA o  ������ 0 endlist endList��  * R      ��BC
�� .ascrerr ****      � ****B o      ���� 0 etext eTextC ��DE
�� 
errnD o      ���� 0 enumber eNumberE ��FG
�� 
erobF o      ���� 0 efrom eFromG ��H��
�� 
errtH o      ���� 
0 eto eTo��  + I  ����I���� 
0 _error  I JKJ m  ��LL �MM   d e l e t e   f r o m   l i s tK NON o  ������ 0 etext eTextO PQP o  ������ 0 enumber eNumberQ RSR o  ������ 0 efrom eFromS T��T o  ������ 
0 eto eTo��  ��   UVU l     ��������  ��  ��  V WXW l     ��������  ��  ��  X YZY i  % ([\[ I     ��]��
�� .Lst:RDuLnull���     ****] o      ���� 0 thelist theList��  \ Q     �^_`^ k    �aa bcb h    
��d�� 0 
listobject 
listObjectd j     ��e�� 
0 _list_  e n    fgf 2   ��
�� 
cobjg n    hih I    ��j���� "0 aslistparameter asListParameterj klk o    
���� 0 thelist theListl m��m m   
 nn �oo  ��  ��  i o     ���� 0 _support  c pqp l   ��rs��  rjd not the fastest algorithm as it's O(Nn) (the repeat loop is O(N) and each `is in` test is O(n)), but simple and consistent with AS's existing behaviors (for large lists it'd be more efficient to put each item into an NSMutableSet where practical then check for uniqueness against that, but that wouldn't respect AS's current considering/ignoring settings)   s �tt�   n o t   t h e   f a s t e s t   a l g o r i t h m   a s   i t ' s   O ( N n )   ( t h e   r e p e a t   l o o p   i s   O ( N )   a n d   e a c h   ` i s   i n `   t e s t   i s   O ( n ) ) ,   b u t   s i m p l e   a n d   c o n s i s t e n t   w i t h   A S ' s   e x i s t i n g   b e h a v i o r s   ( f o r   l a r g e   l i s t s   i t ' d   b e   m o r e   e f f i c i e n t   t o   p u t   e a c h   i t e m   i n t o   a n   N S M u t a b l e S e t   w h e r e   p r a c t i c a l   t h e n   c h e c k   f o r   u n i q u e n e s s   a g a i n s t   t h a t ,   b u t   t h a t   w o u l d n ' t   r e s p e c t   A S ' s   c u r r e n t   c o n s i d e r i n g / i g n o r i n g   s e t t i n g s )q uvu r    *wxw J    yy z{z m    ���� { |}| m    ���� } ~��~ n   � 1    ��
�� 
leng� n   ��� o    ���� 
0 _list_  � o    ���� 0 
listobject 
listObject��  x J      �� ��� o      ���� 0 i  � ��� o      ���� 0 u  � ���� o      ���� 0 
listlength 
listLength��  v ��� Z  + 8������� =   + .��� o   + ,���� 0 
listlength 
listLength� m   , -����  � L   1 4�� J   1 3����  ��  ��  � ��� W   9 ���� k   A ��� ��� V   A ���� k   \ {�� ��� r   \ a��� [   \ _��� o   \ ]���� 0 i  � m   ] ^���� � o      ���� 0 i  � ���� Z  b {������� ?   b e��� o   b c���� 0 i  � o   c d���� 0 
listlength 
listLength� L   h w�� n  h v��� 7  k u����
�� 
cobj� m   o q���� � o   r t���� 0 u  � n  h k��� o   i k���� 
0 _list_  � o   h i���� 0 
listobject 
listObject��  ��  ��  � E  E [��� n  E R��� 7  H R����
�� 
cobj� m   L N���� � o   O Q���� 0 u  � n  E H��� o   F H���� 
0 _list_  � o   E F���� 0 
listobject 
listObject� J   R Z�� ���� n  R X��� 4   U X���
�� 
cobj� o   V W���� 0 i  � n  R U��� o   S U���� 
0 _list_  � o   R S���� 0 
listobject 
listObject��  � ��� r   � ���� [   � ���� o   � ����� 0 u  � m   � ����� � o      ���� 0 u  � ��� r   � ���� n  � ���� 4   � ����
�� 
cobj� o   � ����� 0 i  � n  � ���� o   � ����� 
0 _list_  � o   � ����� 0 
listobject 
listObject� n     ��� 4   � ����
�� 
cobj� o   � ����� 0 u  � n  � ���� o   � ����� 
0 _list_  � o   � ����� 0 
listobject 
listObject� ���� r   � ���� [   � ���� o   � ����� 0 i  � m   � ����� � o      ���� 0 i  ��  � ?   = @��� o   = >���� 0 i  � o   > ?���� 0 
listlength 
listLength� ���� L   � ��� n  � ���� 7  � �����
�� 
cobj� m   � ����� � o   � ����� 0 u  � n  � ���� o   � ����� 
0 _list_  � o   � ����� 0 
listobject 
listObject��  _ R      ����
�� .ascrerr ****      � ****� o      ���� 0 etext eText� ����
�� 
errn� o      ���� 0 enumber eNumber� ����
�� 
erob� o      ���� 0 efrom eFrom� ����
�� 
errt� o      �~�~ 
0 eto eTo�  ` I   � ��}��|�} 
0 _error  � ��� m   � ��� ��� 6 r e m o v e   d u p l i c a t e s   f r o m   l i s t� ��� o   � ��{�{ 0 etext eText� ��� o   � ��z�z 0 enumber eNumber� ��� o   � ��y�y 0 efrom eFrom� ��x� o   � ��w�w 
0 eto eTo�x  �|  Z ��� l     �v�u�t�v  �u  �t  � ��� l     �s�r�q�s  �r  �q  � ��� i  ) ,��� I     �p��
�p .Lst:SliLnull���     ****� o      �o�o 0 thelist theList� �n��
�n 
FIdx� |�m�l��k��m  �l  � o      �j�j 0 
startindex 
startIndex�k  � l     ��i�h� m      �g
�g 
msng�i  �h  � �f �e
�f 
TIdx  |�d�c�b�d  �c   o      �a�a 0 endindex endIndex�b   l     �`�_ m      �^
�^ 
msng�`  �_  �e  � Q    � k   { 	 r    

 n    I    �]�\�] "0 aslistparameter asListParameter  o    	�[�[ 0 thelist theList �Z m   	 
 �  �Z  �\   o    �Y�Y 0 _support   o      �X�X 0 thelist theList	  r     n    1    �W
�W 
leng o    �V�V 0 thelist theList o      �U�U 0 	thelength 	theLength  Z    ��T >     o    �S�S 0 
startindex 
startIndex  m    �R
�R 
msng k    s!! "#" r    *$%$ n   (&'& I   " (�Q(�P�Q (0 asintegerparameter asIntegerParameter( )*) o   " #�O�O 0 
startindex 
startIndex* +�N+ m   # $,, �--  f r o m   i t e m�N  �P  ' o    "�M�M 0 _support  % o      �L�L 0 
startindex 
startIndex# ./. l  + +�K01�K  0 J D note: index 0 is disallowed as it makes behavior confusing to users   1 �22 �   n o t e :   i n d e x   0   i s   d i s a l l o w e d   a s   i t   m a k e s   b e h a v i o r   c o n f u s i n g   t o   u s e r s/ 343 Z  + @56�J�I5 =   + .787 o   + ,�H�H 0 
startindex 
startIndex8 m   , -�G�G  6 n  1 <9:9 I   6 <�F;�E�F 80 throwinvalidparameterindex throwInvalidParameterIndex; <=< o   6 7�D�D 0 
startindex 
startIndex= >�C> m   7 8?? �@@  f r o m   i t e m�C  �E  : o   1 6�B�B 0 _support  �J  �I  4 A�AA Z   A sBC�@�?B =  A DDED o   A B�>�> 0 endindex endIndexE m   B C�=
�= 
msngC Z   G oFGHIF A   G KJKJ o   G H�<�< 0 
startindex 
startIndexK d   H JLL o   H I�;�; 0 	thelength 	theLengthG L   N SMM n  N RNON 2  O Q�:
�: 
cobjO o   N O�9�9 0 thelist theListH PQP ?   V YRSR o   V W�8�8 0 
startindex 
startIndexS o   W X�7�7 0 	thelength 	theLengthQ T�6T L   \ _UU J   \ ^�5�5  �6  I L   b oVV n  b nWXW 7  c m�4YZ
�4 
cobjY o   g i�3�3 0 
startindex 
startIndexZ m   j l�2�2��X o   b c�1�1 0 thelist theList�@  �?  �A   [\[ =  v y]^] o   v w�0�0 0 endindex endIndex^ m   w x�/
�/ 
msng\ _�._ R   | ��-`a
�- .ascrerr ****      � ****` m   � �bb �cc � E x p e c t e d    f r o m   i t e m    a n d / o r    t o   i t e m    p a r a m e t e r   b u t   r e c e i v e d   n e i t h e r .a �,d�+
�, 
errnd m   ~ �*�*�[�+  �.  �T   efe Z   � �gh�)�(g >  � �iji o   � ��'�' 0 endindex endIndexj m   � ��&
�& 
msngh k   � �kk lml r   � �non n  � �pqp I   � ��%r�$�% (0 asintegerparameter asIntegerParameterr sts o   � ��#�# 0 endindex endIndext u�"u m   � �vv �ww  t o   i t e m�"  �$  q o   � ��!�! 0 _support  o o      � �  0 endindex endIndexm xyx Z  � �z{��z =   � �|}| o   � ��� 0 endindex endIndex} m   � ���  { n  � �~~ I   � ����� 80 throwinvalidparameterindex throwInvalidParameterIndex� ��� o   � ��� 0 endindex endIndex� ��� m   � ��� ���  t o   i t e m�  �   o   � ��� 0 _support  �  �  y ��� Z   � ������ =  � ���� o   � ��� 0 
startindex 
startIndex� m   � ��
� 
msng� Z   � ������ A   � ���� o   � ��� 0 endindex endIndex� d   � ��� o   � ��� 0 	thelength 	theLength� L   � ��� J   � ���  � ��� ?   � ���� o   � ��� 0 endindex endIndex� o   � ��� 0 	thelength 	theLength� ��� L   � ��� n  � ���� 2  � ��
� 
cobj� o   � ��
�
 0 thelist theList�  � L   � ��� n  � ���� 7  � ��	��
�	 
cobj� m   � ��� � o   � ��� 0 endindex endIndex� o   � ��� 0 thelist theList�  �  �  �)  �(  f ��� l  � �����  � + % both start and end indexes are given   � ��� J   b o t h   s t a r t   a n d   e n d   i n d e x e s   a r e   g i v e n� ��� Z  � ������ A   � ���� o   � ��� 0 
startindex 
startIndex� m   � ���  � r   � ���� [   � ���� [   � ���� o   � �� �  0 	thelength 	theLength� m   � ����� � o   � ����� 0 
startindex 
startIndex� o      ���� 0 
startindex 
startIndex�  �  � ��� Z  �������� A   � ���� o   � ����� 0 endindex endIndex� m   � �����  � r   ��� [   ��� [   ��� o   ���� 0 	thelength 	theLength� m  ���� � o  ���� 0 endindex endIndex� o      ���� 0 endindex endIndex��  ��  � ��� Z 9������� G  /��� G  ��� ?  ��� o  ���� 0 
startindex 
startIndex� o  ���� 0 endindex endIndex� F  ��� A  ��� o  ���� 0 
startindex 
startIndex� m  ���� � A  ��� o  ���� 0 endindex endIndex� l 
������ m  ���� ��  ��  � F  "-��� ?  "%��� o  "#���� 0 
startindex 
startIndex� o  #$���� 0 	thelength 	theLength� ?  (+��� o  ()���� 0 endindex endIndex� o  )*���� 0 	thelength 	theLength� L  25�� J  24����  ��  ��  � ��� Z  :S������ A  :=��� o  :;���� 0 
startindex 
startIndex� m  ;<���� � r  @C��� m  @A���� � o      ���� 0 
startindex 
startIndex� ��� ?  FI��� o  FG���� 0 
startindex 
startIndex� o  GH���� 0 	thelength 	theLength� ���� r  LO��� o  LM���� 0 	thelength 	theLength� o      ���� 0 
startindex 
startIndex��  ��  � ��� Z  Tm������ A  TW��� o  TU���� 0 endindex endIndex� m  UV���� � r  Z]��� m  Z[���� � o      ���� 0 endindex endIndex� ��� ?  `c��� o  `a���� 0 endindex endIndex� o  ab���� 0 	thelength 	theLength� ���� r  fi��� o  fg���� 0 	thelength 	theLength� o      ���� 0 endindex endIndex��  ��  � ���� L  n{�� n  nz��� 7 oy����
�� 
cobj� o  su���� 0 
startindex 
startIndex� o  vx���� 0 endindex endIndex� o  no���� 0 thelist theList��   R      ����
�� .ascrerr ****      � ****� o      ���� 0 etext eText� ����
�� 
errn� o      ���� 0 enumber eNumber� ��� 
�� 
erob� o      ���� 0 efrom eFrom  ����
�� 
errt o      ���� 
0 eto eTo��   I  �������� 
0 _error    m  �� �  s l i c e   l i s t  o  ������ 0 etext eText 	
	 o  ������ 0 enumber eNumber
  o  ������ 0 efrom eFrom �� o  ������ 
0 eto eTo��  ��  �  l     ��������  ��  ��    l     ��������  ��  ��    i  - 0 I     ��
�� .Lst:Trannull���     **** o      ���� 0 thelist theList ��
�� 
Whil |��������  ��   o      ���� 0 unevenoption unevenOption��   l     ���� m      ��
�� LTrhLTrR��  ��   ����
�� 
PadI |��������  ��   o      ���� 0 padvalue padValue��   l      ����  m      ��
�� 
msng��  ��  ��   Q    �!"#! k   �$$ %&% Z   '(����' =   )*) o    ���� 0 thelist theList* J    ����  ( L   
 ++ J   
 ����  ��  ��  & ,-, Z    C./����. G    /010 =    232 l   4����4 I   ��56
�� .corecnte****       ****5 J    77 8��8 o    ���� 0 thelist theList��  6 ��9��
�� 
kocl9 m    ��
�� 
list��  ��  ��  3 m    ����  1 >     -:;: l    '<����< I    '��=>
�� .corecnte****       ****= o     !���� 0 thelist theList> ��?��
�� 
kocl? m   " #��
�� 
list��  ��  ��  ; l  ' ,@����@ I  ' ,��A��
�� .corecnte****       ****A o   ' (���� 0 thelist theList��  ��  ��  / n  2 ?BCB I   7 ?��D���� .0 throwinvalidparameter throwInvalidParameterD EFE o   7 8���� 0 thelist theListF GHG m   8 9II �JJ  H KLK m   9 :��
�� 
listL M��M m   : ;NN �OO ( N o t   a   l i s t   o f   l i s t s .��  ��  C o   2 7���� 0 _support  ��  ��  - PQP h   D K��R�� 0 
listobject 
listObjectR k      SS TUT j     ��V�� 
0 _list_  V o     �� 0 thelist theListU W�~W j    
�}X�} 0 _resultlist_ _resultList_X J    	�|�|  �~  Q YZY r   L V[\[ n   L T]^] 1   R T�{
�{ 
leng^ n  L R_`_ 4   O R�za
�z 
cobja m   P Q�y�y ` n  L Obcb o   M O�x�x 
0 _list_  c o   L M�w�w 0 
listobject 
listObject\ o      �v�v $0 resultlistlength resultListLengthZ ded l  W W�ufg�u  f K E find the longest/shortest sublist; this will be length of resultList   g �hh �   f i n d   t h e   l o n g e s t / s h o r t e s t   s u b l i s t ;   t h i s   w i l l   b e   l e n g t h   o f   r e s u l t L i s te iji Z   Wklmnk =  W Zopo o   W X�t�t 0 unevenoption unevenOptionp m   X Y�s
�s LTrhLTrRl X   ] �q�rrq Z  o �st�q�ps >   o tuvu n  o rwxw 1   p r�o
�o 
lengx o   o p�n�n 0 aref aRefv o   r s�m�m $0 resultlistlength resultListLengtht n  w �yzy I   | ��l{�k�l .0 throwinvalidparameter throwInvalidParameter{ |}| o   | }�j�j 0 thelist theList} ~~ m   } ~�� ���   ��� m   ~ �i
�i 
list� ��h� m    ��� ��� B S u b l i s t s   a r e   n o t   a l l   s a m e   l e n g t h .�h  �k  z o   w |�g�g 0 _support  �q  �p  �r 0 aref aRefr n  ` c��� o   a c�f�f 
0 _list_  � o   ` a�e�e 0 
listobject 
listObjectm ��� =  � ���� o   � ��d�d 0 unevenoption unevenOption� m   � ��c
�c LTrhLTrP� ��� X   � ���b�� Z  � ����a�`� ?   � ���� n  � ���� 1   � ��_
�_ 
leng� o   � ��^�^ 0 aref aRef� o   � ��]�] $0 resultlistlength resultListLength� r   � ���� n  � ���� 1   � ��\
�\ 
leng� o   � ��[�[ 0 aref aRef� o      �Z�Z $0 resultlistlength resultListLength�a  �`  �b 0 aref aRef� n  � ���� o   � ��Y�Y 
0 _list_  � o   � ��X�X 0 
listobject 
listObject� ��� =  � ���� o   � ��W�W 0 unevenoption unevenOption� m   � ��V
�V LTrhLTrT� ��U� X   � ���T�� Z  � ����S�R� A   � ���� n  � ���� 1   � ��Q
�Q 
leng� o   � ��P�P 0 aref aRef� o   � ��O�O $0 resultlistlength resultListLength� r   � ���� n  � ���� 1   � ��N
�N 
leng� o   � ��M�M 0 aref aRef� o      �L�L $0 resultlistlength resultListLength�S  �R  �T 0 aref aRef� n  � ���� o   � ��K�K 
0 _list_  � o   � ��J�J 0 
listobject 
listObject�U  n n  ���� I   ��I��H�I >0 throwinvalidconstantparameter throwInvalidConstantParameter� ��� o   � ��G�G 0 unevenoption unevenOption� ��F� m   ��� ���  b y�F  �H  � o   � ��E�E 0 _support  j ��� Z  ����D�C� ?  	��� o  �B�B $0 resultlistlength resultListLength� m  �A�A  � k  ��� ��� l �@���@  � � � build empty matrix (due to inefficiencies of AS's list implementation, when populating large lists, it's probably quicker to create a padded list then set its items rather than start with an empty list and append items)   � ����   b u i l d   e m p t y   m a t r i x   ( d u e   t o   i n e f f i c i e n c i e s   o f   A S ' s   l i s t   i m p l e m e n t a t i o n ,   w h e n   p o p u l a t i n g   l a r g e   l i s t s ,   i t ' s   p r o b a b l y   q u i c k e r   t o   c r e a t e   a   p a d d e d   l i s t   t h e n   s e t   i t s   i t e m s   r a t h e r   t h a n   s t a r t   w i t h   a n   e m p t y   l i s t   a n d   a p p e n d   i t e m s )� ��� r  ��� n  ��� 1  �?
�? 
leng� n ��� o  �>�> 
0 _list_  � o  �=�= 0 
listobject 
listObject� o      �<�< *0 resultsublistlength resultSubListLength� ��� r  ��� I  �;��:�; "0 _makelistobject _makeListObject� ��� o  �9�9 *0 resultsublistlength resultSubListLength� ��8� o  �7�7 0 padvalue padValue�8  �:  � o      �6�6 0 resultsublist resultSubList� ��� r  &��� o  �5�5 0 resultsublist resultSubList� n      ���  ;  $%� n $��� o   $�4�4 0 _resultlist_ _resultList_� o   �3�3 0 
listobject 
listObject� ��� Y  'A��2���1� l 1<���� r  1<��� l 15��0�/� e  15�� n 15��� 2 24�.
�. 
cobj� o  12�-�- 0 resultsublist resultSubList�0  �/  � n      ���  ;  :;� n 5:��� o  6:�,�, 0 _resultlist_ _resultList_� o  56�+�+ 0 
listobject 
listObject�   shallow copy   � ���    s h a l l o w   c o p y�2 0 i  � m  *+�*�* � o  +,�)�) $0 resultlistlength resultListLength�1  � ��� l BB�(���(  �   populate matrix   � ���     p o p u l a t e   m a t r i x� ��'� Z  B����&�� = BG��� o  BC�%�% 0 unevenoption unevenOption� m  CF�$
�$ LTrhLTrP� Y  J���#���"� Y  T���!��� � r  f{   n  fo 4  lo�
� 
cobj o  mn�� 0 j   n  fl 4  il�
� 
cobj o  jk�� 0 i   n fi	 o  gi�� 
0 _list_  	 o  fg�� 0 
listobject 
listObject n      

 4  wz�
� 
cobj o  xy�� 0 i   n  ow 4  tw�
� 
cobj o  uv�� 0 j   n ot o  pt�� 0 _resultlist_ _resultList_ o  op�� 0 
listobject 
listObject�! 0 j  � m  WX�� � n  Xa 1  ^`�
� 
leng n X^ 4  [^�
� 
cobj o  \]�� 0 i   n X[ o  Y[�� 
0 _list_   o  XY�� 0 
listobject 
listObject�   �# 0 i  � m  MN�� � o  NO�� *0 resultsublistlength resultSubListLength�"  �&  � Y  ����
 Y  ���	� r  ��  n  ��!"! 4  ���#
� 
cobj# o  ���� 0 j  " n  ��$%$ 4  ���&
� 
cobj& o  ���� 0 i  % n ��'(' o  ���� 
0 _list_  ( o  ���� 0 
listobject 
listObject  n      )*) 4  ���+
� 
cobj+ o  ��� �  0 i  * n  ��,-, 4  ����.
�� 
cobj. o  ������ 0 j  - n ��/0/ o  ������ 0 _resultlist_ _resultList_0 o  ������ 0 
listobject 
listObject�	 0 j   m  ������  o  ������ $0 resultlistlength resultListLength�  � 0 i   m  ������  o  ������ *0 resultsublistlength resultSubListLength�
  �'  �D  �C  � 1��1 L  ��22 n ��343 o  ������ 0 _resultlist_ _resultList_4 o  ������ 0 
listobject 
listObject��  " R      ��56
�� .ascrerr ****      � ****5 o      ���� 0 etext eText6 ��78
�� 
errn7 o      ���� 0 enumber eNumber8 ��9:
�� 
erob9 o      ���� 0 efrom eFrom: ��;��
�� 
errt; o      ���� 
0 eto eTo��  # I  ����<���� 
0 _error  < =>= m  ��?? �@@  t r a n s p o s e   l i s t> ABA o  ������ 0 etext eTextB CDC o  ������ 0 enumber eNumberD EFE o  ������ 0 efrom eFromF G��G o  ������ 
0 eto eTo��  ��   HIH l     ��������  ��  ��  I JKJ l     ��������  ��  ��  K LML i  1 4NON I     ��P��
�� .Lst:LiUSnull���     ****P o      ���� 0 thelist theList��  O Q     tQRSQ k    bTT UVU h    
��W�� $0 resultlistobject resultListObjectW j     ��X�� 
0 _list_  X n     YZY 2   ��
�� 
cobjZ n    [\[ I    ��]���� "0 aslistparameter asListParameter] ^_^ o    
���� 0 thelist theList_ `��` m   
 aa �bb  ��  ��  \ o     ���� 0 _support  V cdc r    efe n    ghg 1    ��
�� 
lengh n   iji o    ���� 
0 _list_  j o    ���� $0 resultlistobject resultListObjectf o      ���� 0 len  d klk Y    \m��no��m k    Wpp qrq r    -sts I   +u��vu z����
�� .sysorandnmbr    ��� nmbr
�� misccura��  v ��wx
�� 
fromw m   # $���� x ��y��
�� 
to  y o   % &���� 0 len  ��  t o      ���� 0 idx2  r z��z r   . W{|{ J   . >}} ~~ e   . 5�� n  . 5��� 4   1 4���
�� 
cobj� o   2 3���� 0 idx2  � n  . 1��� o   / 1���� 
0 _list_  � o   . /���� $0 resultlistobject resultListObject ���� e   5 <�� n  5 <��� 4   8 ;���
�� 
cobj� o   9 :���� 0 idx1  � n  5 8��� o   6 8���� 
0 _list_  � o   5 6���� $0 resultlistobject resultListObject��  | J      �� ��� n     ��� 4   F I���
�� 
cobj� o   G H���� 0 idx1  � n  C F��� o   D F���� 
0 _list_  � o   C D���� $0 resultlistobject resultListObject� ���� n     ��� 4   R U���
�� 
cobj� o   S T���� 0 idx2  � n  O R��� o   P R���� 
0 _list_  � o   O P���� $0 resultlistobject resultListObject��  ��  �� 0 idx1  n m    ���� o o    ���� 0 len  ��  l ���� L   ] b�� n  ] a��� o   ^ `���� 
0 _list_  � o   ] ^���� $0 resultlistobject resultListObject��  R R      ����
�� .ascrerr ****      � ****� o      ���� 0 etext eText� ����
�� 
errn� o      ���� 0 enumber eNumber� ����
�� 
erob� o      ���� 0 efrom eFrom� �����
�� 
errt� o      ���� 
0 eto eTo��  S I   j t������� 
0 _error  � ��� m   k l�� ���  u n s o r t   l i s t� ��� o   l m���� 0 etext eText� ��� o   m n���� 0 enumber eNumber� ��� o   n o���� 0 efrom eFrom� ���� o   o p���� 
0 eto eTo��  ��  M ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� l     ������  � J D--------------------------------------------------------------------   � ��� � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -� ��� l     ������  �   search   � ���    s e a r c h� ��� l     ��������  ��  ��  � ��� i  5 8��� I     ����
�� .Lst:Findnull���     ****� o      ���� 0 thelist theList� ����
�� 
Valu� |����������  ��  � o      ���� 0 theitem theItem��  � l     ������ m      ��
�� 
msng��  ��  � ����
�� 
Usin� |����������  ��  � o      ���� 0 filterobject filterObject��  � l     ������ m      ��
�� 
msng��  ��  � ���~
� 
Retu� |�}�|��{��}  �|  � o      �z�z (0 findingoccurrences findingOccurrences�{  � l     ��y�x� m      �w
�w LFWhLFWA�y  �x  �~  � Q    ����� k   ��� ��� h    
�v��v 0 
listobject 
listObject� k      �� ��� j     �u��u 
0 _list_  � n    ��� I    �t��s�t "0 aslistparameter asListParameter� ��� o    
�r�r 0 thelist theList� ��q� m   
 �� ���  �q  �s  � o     �p�p 0 _support  � ��o� j    �n��n 0 _result_  � J    �m�m  �o  � ��� Z   ����� =   ��� o    �l�l (0 findingoccurrences findingOccurrences� m    �k
�k LFWhLFWA� Z    }���j�� =   ��� o    �i�i 0 filterobject filterObject� m    �h
�h 
msng� Y    @��g���f� Z   & ;���e�d� =  & .��� n   & ,� � 4   ) ,�c
�c 
cobj o   * +�b�b 0 i    n  & ) o   ' )�a�a 
0 _list_   o   & '�`�` 0 
listobject 
listObject� o   , -�_�_ 0 theitem theItem� r   1 7 o   1 2�^�^ 0 i   n        ;   5 6 n  2 5	 o   3 5�]�] 0 _result_  	 o   2 3�\�\ 0 
listobject 
listObject�e  �d  �g 0 i  � m    �[�[ � n    !

 1     �Z
�Z 
leng n    o    �Y�Y 
0 _list_   o    �X�X 0 
listobject 
listObject�f  �j  � k   C }  r   C P n  C N I   H N�W�V�W &0 asscriptparameter asScriptParameter  o   H I�U�U 0 filterobject filterObject �T m   I J � 
 u s i n g�T  �V   o   C H�S�S 0 _support   o      �R�R 0 filterobject filterObject �Q Y   Q }�P�O Z   ` x �N�M n  ` k!"! I   a k�L#�K�L 0 
filteritem 
filterItem# $�J$ n   a g%&% 4   d g�I'
�I 
cobj' o   e f�H�H 0 i  & n  a d()( o   b d�G�G 
0 _list_  ) o   a b�F�F 0 
listobject 
listObject�J  �K  " o   ` a�E�E 0 filterobject filterObject  r   n t*+* o   n o�D�D 0 i  + n      ,-,  ;   r s- n  o r./. o   p r�C�C 0 _result_  / o   o p�B�B 0 
listobject 
listObject�N  �M  �P 0 i   m   T U�A�A  n   U [010 1   X Z�@
�@ 
leng1 n  U X232 o   V X�?�? 
0 _list_  3 o   U V�>�> 0 
listobject 
listObject�O  �Q  � 454 =  � �676 o   � ��=�= (0 findingoccurrences findingOccurrences7 m   � ��<
�< LFWhLFWF5 898 Z   � �:;�;<: =  � �=>= o   � ��:�: 0 filterobject filterObject> m   � ��9
�9 
msng; Y   � �?�8@A�7? Z   � �BC�6�5B =  � �DED n   � �FGF 4   � ��4H
�4 
cobjH o   � ��3�3 0 i  G n  � �IJI o   � ��2�2 
0 _list_  J o   � ��1�1 0 
listobject 
listObjectE o   � ��0�0 0 theitem theItemC k   � �KK LML r   � �NON o   � ��/�/ 0 i  O n      PQP  ;   � �Q n  � �RSR o   � ��.�. 0 _result_  S o   � ��-�- 0 
listobject 
listObjectM T�,T  S   � ��,  �6  �5  �8 0 i  @ m   � ��+�+ A n   � �UVU 1   � ��*
�* 
lengV n  � �WXW o   � ��)�) 
0 _list_  X o   � ��(�( 0 
listobject 
listObject�7  �;  < k   � �YY Z[Z r   � �\]\ n  � �^_^ I   � ��'`�&�' &0 asscriptparameter asScriptParameter` aba o   � ��%�% 0 filterobject filterObjectb c�$c m   � �dd �ee 
 u s i n g�$  �&  _ o   � ��#�# 0 _support  ] o      �"�" 0 filterobject filterObject[ f�!f Y   � �g� hi�g Z   � �jk��j n  � �lml I   � ��n�� 0 
filteritem 
filterItemn o�o n   � �pqp 4   � ��r
� 
cobjr o   � ��� 0 i  q n  � �sts o   � ��� 
0 _list_  t o   � ��� 0 
listobject 
listObject�  �  m o   � ��� 0 filterobject filterObjectk k   � �uu vwv r   � �xyx o   � ��� 0 i  y n      z{z  ;   � �{ n  � �|}| o   � ��� 0 _result_  } o   � ��� 0 
listobject 
listObjectw ~�~  S   � ��  �  �  �  0 i  h m   � ��� i n   � �� 1   � ��
� 
leng� n  � ���� o   � ��� 
0 _list_  � o   � ��� 0 
listobject 
listObject�  �!  9 ��� =  � ���� o   � ��� (0 findingoccurrences findingOccurrences� m   � ��
� LFWhLFWL� ��
� Z   �o���	�� =  ���� o   � �� 0 filterobject filterObject� m   �
� 
msng� Y  0������ Z  +����� = ��� n  ��� 4  ��
� 
cobj� o  �� 0 i  � n ��� o  �� 
0 _list_  � o  � �  0 
listobject 
listObject� o  ���� 0 theitem theItem� k  '�� ��� r  %��� o   ���� 0 i  � n      ���  ;  #$� n  #��� o  !#���� 0 _result_  � o   !���� 0 
listobject 
listObject� ����  S  &'��  �  �  � 0 i  � n  ��� 1  ��
�� 
leng� n ��� o  	���� 
0 _list_  � o  	���� 0 
listobject 
listObject� m  ���� � m  �������	  � k  3o�� ��� r  3@��� n 3>��� I  8>������� &0 asscriptparameter asScriptParameter� ��� o  89���� 0 filterobject filterObject� ���� m  9:�� ��� 
 u s i n g��  ��  � o  38���� 0 _support  � o      ���� 0 filterobject filterObject� ���� Y  Ao������� Z  Pj������� n P[��� I  Q[������� 0 
filteritem 
filterItem� ���� n  QW��� 4  TW���
�� 
cobj� o  UV���� 0 i  � n QT��� o  RT���� 
0 _list_  � o  QR���� 0 
listobject 
listObject��  ��  � o  PQ���� 0 filterobject filterObject� k  ^f�� ��� r  ^d��� o  ^_���� 0 i  � n      ���  ;  bc� n _b��� o  `b���� 0 _result_  � o  _`���� 0 
listobject 
listObject� ����  S  ef��  ��  ��  �� 0 i  � n  DJ��� 1  GI��
�� 
leng� n DG��� o  EG���� 
0 _list_  � o  DE���� 0 
listobject 
listObject� m  JK���� � m  KL��������  �
  � n r��� I  w������� >0 throwinvalidconstantparameter throwInvalidConstantParameter� ��� o  wx���� (0 findingoccurrences findingOccurrences� ���� m  x{�� ���  r e t u r n i n g��  ��  � o  rw���� 0 _support  � ���� L  ���� n ����� o  ������ 0 _result_  � o  ������ 0 
listobject 
listObject��  � R      ����
�� .ascrerr ****      � ****� o      ���� 0 etext eText� ����
�� 
errn� o      ���� 0 enumber eNumber� ����
�� 
erob� o      ���� 0 efrom eFrom� �����
�� 
errt� o      ���� 
0 eto eTo��  � I  ��������� 
0 _error  � ��� m  ���� ���  f i n d   i n   l i s t� ��� o  ������ 0 etext eText� ��� o  ������ 0 enumber eNumber� ��� o  ������ 0 efrom eFrom� ���� o  ������ 
0 eto eTo��  ��  � ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� l     ������  � J D--------------------------------------------------------------------   � ��� � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -� ��� l     ������  �ZT map, filter, reduce (these operations are relatively trivial to perform in AS without the need for callbacks; however, these handlers are more flexible when the convert/check/combine operations are parameterized and also provide more advanced users with idiomatic examples of how to parameterize a general-purpose handler's exact behavior)   � ����   m a p ,   f i l t e r ,   r e d u c e   ( t h e s e   o p e r a t i o n s   a r e   r e l a t i v e l y   t r i v i a l   t o   p e r f o r m   i n   A S   w i t h o u t   t h e   n e e d   f o r   c a l l b a c k s ;   h o w e v e r ,   t h e s e   h a n d l e r s   a r e   m o r e   f l e x i b l e   w h e n   t h e   c o n v e r t / c h e c k / c o m b i n e   o p e r a t i o n s   a r e   p a r a m e t e r i z e d   a n d   a l s o   p r o v i d e   m o r e   a d v a n c e d   u s e r s   w i t h   i d i o m a t i c   e x a m p l e s   o f   h o w   t o   p a r a m e t e r i z e   a   g e n e r a l - p u r p o s e   h a n d l e r ' s   e x a c t   b e h a v i o r )�    l     ��������  ��  ��    l     ����   � � note: while these handlers prevent the script object from modifying the input list directly, it cannot stop them modifying mutable (date/list/record/script/reference) items within the input list (doing so would be very bad practice, however)    ��   n o t e :   w h i l e   t h e s e   h a n d l e r s   p r e v e n t   t h e   s c r i p t   o b j e c t   f r o m   m o d i f y i n g   t h e   i n p u t   l i s t   d i r e c t l y ,   i t   c a n n o t   s t o p   t h e m   m o d i f y i n g   m u t a b l e   ( d a t e / l i s t / r e c o r d / s c r i p t / r e f e r e n c e )   i t e m s   w i t h i n   t h e   i n p u t   l i s t   ( d o i n g   s o   w o u l d   b e   v e r y   b a d   p r a c t i c e ,   h o w e v e r )  l     ��������  ��  ��   	
	 i  9 < I     ��
�� .Lst:Map_null���     **** o      ���� 0 thelist theList ����
�� 
Usin o      ���� 0 	mapobject 	mapObject��   Q     � k    �  h    
���� $0 resultlistobject resultListObject j     ���� 
0 _list_   n      2   ��
�� 
cobj n     I    ������ "0 aslistparameter asListParameter  o    
���� 0 thelist theList �� m   
    �!!  ��  ��   o     ���� 0 _support   "#" r    $%$ n   &'& I    ��(���� &0 asscriptparameter asScriptParameter( )*) o    ���� 0 	mapobject 	mapObject* +��+ m    ,, �-- 
 u s i n g��  ��  ' o    ���� 0 _support  % o      ���� 0 	mapobject 	mapObject# ./. Q    �0120 Y    B3��45��3 l  + =6786 r   + =9:9 n  + 6;<; I   , 6��=���� 0 mapitem mapItem= >��> n   , 2?@? 4   / 2��A
�� 
cobjA o   0 1���� 0 i  @ n  , /BCB o   - /���� 
0 _list_  C o   , -���� $0 resultlistobject resultListObject��  ��  < o   + ,���� 0 	mapobject 	mapObject: n      DED 4   9 <��F
�� 
cobjF o   : ;���� 0 i  E n  6 9GHG o   7 9���� 
0 _list_  H o   6 7���� $0 resultlistobject resultListObject7 � ~ use counting loop rather than `repeat with aRef in theList` as the item's index is also used when constructing error messages   8 �II �   u s e   c o u n t i n g   l o o p   r a t h e r   t h a n   ` r e p e a t   w i t h   a R e f   i n   t h e L i s t `   a s   t h e   i t e m ' s   i n d e x   i s   a l s o   u s e d   w h e n   c o n s t r u c t i n g   e r r o r   m e s s a g e s�� 0 i  4 m     ���� 5 n     &JKJ 1   # %��
�� 
lengK n    #LML o   ! #���� 
0 _list_  M o     !���� $0 resultlistobject resultListObject��  1 R      ��NO
�� .ascrerr ****      � ****N o      ���� 0 etext eTextO ��PQ
�� 
errnP o      ���� 0 enumber eNumberQ ��R��
�� 
errtR o      ���� 
0 eto eTo��  2 k   J �SS TUT Z   J hVW��XV ?   J MYZY o   J K���� 0 i  Z m   K L���� W r   P a[\[ n   P _]^] 7  S _��_`
�� 
cobj_ m   W Y���� ` l  Z ^a����a \   Z ^bcb o   [ \���� 0 i  c m   \ ]�� ��  ��  ^ n  P Sded o   Q S�~�~ 
0 _list_  e o   P Q�}�} $0 resultlistobject resultListObject\ o      �|�| 0 epartial ePartial��  X r   d hfgf J   d f�{�{  g o      �z�z 0 epartial ePartialU h�yh R   i ��xij
�x .ascrerr ****      � ****i b   � �klk b   � �mnm b   � �opo m   � �qq �rr $ C o u l d n  t   m a p   i t e m  p o   � ��w�w 0 i  n m   � �ss �tt  :  l o   � ��v�v 0 etext eTextj �uuv
�u 
errnu l 
 k lw�t�sw o   k l�r�r 0 enumber eNumber�t  �s  v �qxy
�q 
erobx l  m |z�p�oz N   m |{{ n   m {|}| 4   x {�n~
�n 
cobj~ o   y z�m�m 0 i  } n  m x� I   r x�l��k�l "0 aslistparameter asListParameter� ��� o   r s�j�j 0 thelist theList� ��i� m   s t�� ���  �i  �k  � o   m r�h�h 0 _support  �p  �o  y �g��
�g 
errt� o   } ~�f�f 
0 eto eTo� �e��d
�e 
ptlr� o   � ��c�c 0 epartial ePartial�d  �y  / ��b� L   � ��� n  � ���� o   � ��a�a 
0 _list_  � o   � ��`�` $0 resultlistobject resultListObject�b   R      �_��
�_ .ascrerr ****      � ****� o      �^�^ 0 etext eText� �]��
�] 
errn� o      �\�\ 0 enumber eNumber� �[��
�[ 
erob� o      �Z�Z 0 efrom eFrom� �Y��
�Y 
errt� o      �X�X 
0 eto eTo� �W��V
�W 
ptlr� o      �U�U 0 epartial ePartial�V   I   � ��T��S�T 20 _errorwithpartialresult _errorWithPartialResult� ��� m   � ��� ���  m a p   l i s t� ��� o   � ��R�R 0 etext eText� ��� o   � ��Q�Q 0 enumber eNumber� ��� o   � ��P�P 0 efrom eFrom� ��� o   � ��O�O 
0 eto eTo� ��N� o   � ��M�M 0 epartial ePartial�N  �S  
 ��� l     �L�K�J�L  �K  �J  � ��� l     �I�H�G�I  �H  �G  � ��� i  = @��� I     �F��
�F .Lst:Filtnull���     ****� o      �E�E 0 thelist theList� �D��C
�D 
Usin� o      �B�B 0 filterobject filterObject�C  � Q     ����� k    ��� ��� h    
�A��A $0 resultlistobject resultListObject� j     �@��@ 
0 _list_  � n     ��� 2   �?
�? 
cobj� n    ��� I    �>��=�> "0 aslistparameter asListParameter� ��� o    
�<�< 0 thelist theList� ��;� m   
 �� ���  �;  �=  � o     �:�: 0 _support  � ��� r    ��� n   ��� I    �9��8�9 &0 asscriptparameter asScriptParameter� ��� o    �7�7 0 filterobject filterObject� ��6� m    �� ��� 
 u s i n g�6  �8  � o    �5�5 0 _support  � o      �4�4 0 filterobject filterObject� ��� r    ��� m    �3�3  � o      �2�2 0 	lastindex 	lastIndex� ��� Q    ����� Y     X��1���0� k   / S�� ��� r   / 7��� n   / 5��� 4   2 5�/�
�/ 
cobj� o   3 4�.�. 0 i  � n  / 2��� o   0 2�-�- 
0 _list_  � o   / 0�,�, $0 resultlistobject resultListObject� o      �+�+ 0 theitem theItem� ��*� Z   8 S���)�(� n  8 >��� I   9 >�'��&�' 0 
filteritem 
filterItem� ��%� o   9 :�$�$ 0 theitem theItem�%  �&  � o   8 9�#�# 0 filterobject filterObject� k   A O�� ��� r   A F��� [   A D��� o   A B�"�" 0 	lastindex 	lastIndex� m   B C�!�! � o      � �  0 	lastindex 	lastIndex� ��� r   G O��� o   G H�� 0 theitem theItem� n      ��� 4   K N��
� 
cobj� o   L M�� 0 	lastindex 	lastIndex� n  H K��� o   I K�� 
0 _list_  � o   H I�� $0 resultlistobject resultListObject�  �)  �(  �*  �1 0 i  � m   # $�� � n   $ *��� 1   ' )�
� 
leng� n  $ '��� o   % '�� 
0 _list_  � o   $ %�� $0 resultlistobject resultListObject�0  � R      ���
� .ascrerr ****      � ****� o      �� 0 etext eText� �	 	
� 
errn	  o      �� 0 enumber eNumber	 �	�
� 
errt	 o      �� 
0 eto eTo�  � k   ` �		 			 Z   ` ~		�		 ?   ` c			
		 o   ` a�� 0 	lastindex 	lastIndex	
 m   a b�� 	 r   f w			 n   f u			 7  i u�		
� 
cobj	 m   m o�
�
 	 l  p t	�	�	 \   p t			 o   q r�� 0 	lastindex 	lastIndex	 m   r s�� �	  �  	 n  f i			 o   g i�� 
0 _list_  	 o   f g�� $0 resultlistobject resultListObject	 o      �� 0 epartial ePartial�  	 r   z ~			 J   z |��  	 o      �� 0 epartial ePartial	 	� 	 R    ���		
�� .ascrerr ****      � ****	 b   � �			 b   � �			 b   � �		 	 m   � �	!	! �	"	" * C o u l d n  t   f i l t e r   i t e m  	  o   � ����� 0 i  	 m   � �	#	# �	$	$  :  	 o   � ����� 0 etext eText	 ��	%	&
�� 
errn	% l 
 � �	'����	' o   � ����� 0 enumber eNumber��  ��  	& ��	(	)
�� 
erob	( l  � �	*����	* N   � �	+	+ n   � �	,	-	, 4   � ���	.
�� 
cobj	. o   � ����� 0 i  	- n  � �	/	0	/ I   � ���	1���� "0 aslistparameter asListParameter	1 	2	3	2 o   � ����� 0 thelist theList	3 	4��	4 m   � �	5	5 �	6	6  ��  ��  	0 o   � ����� 0 _support  ��  ��  	) ��	7	8
�� 
errt	7 o   � ����� 
0 eto eTo	8 ��	9��
�� 
ptlr	9 o   � ����� 0 epartial ePartial��  �   � 	:	;	: Z  � �	<	=����	< =   � �	>	?	> o   � ����� 0 	lastindex 	lastIndex	? m   � �����  	= L   � �	@	@ J   � �����  ��  ��  	; 	A��	A L   � �	B	B n  � �	C	D	C 7  � ���	E	F
�� 
cobj	E m   � ����� 	F o   � ����� 0 	lastindex 	lastIndex	D n  � �	G	H	G o   � ����� 
0 _list_  	H o   � ����� $0 resultlistobject resultListObject��  � R      ��	I	J
�� .ascrerr ****      � ****	I o      ���� 0 etext eText	J ��	K	L
�� 
errn	K o      ���� 0 enumber eNumber	L ��	M	N
�� 
erob	M o      ���� 0 efrom eFrom	N ��	O	P
�� 
errt	O o      ���� 
0 eto eTo	P ��	Q��
�� 
ptlr	Q o      ���� 0 epartial ePartial��  � I   � ���	R���� 20 _errorwithpartialresult _errorWithPartialResult	R 	S	T	S m   � �	U	U �	V	V  f i l t e r   l i s t	T 	W	X	W o   � ����� 0 etext eText	X 	Y	Z	Y o   � ����� 0 enumber eNumber	Z 	[	\	[ o   � ����� 0 efrom eFrom	\ 	]	^	] o   � ����� 
0 eto eTo	^ 	_��	_ o   � ����� 0 epartial ePartial��  ��  � 	`	a	` l     ��������  ��  ��  	a 	b	c	b l     ��������  ��  ��  	c 	d	e	d i  A D	f	g	f I     ��	h	i
�� .Lst:Redunull���     ****	h o      ���� 0 thelist theList	i ��	j��
�� 
Usin	j o      ���� 0 reduceobject reduceObject��  	g k     �	k	k 	l	m	l r     	n	o	n m     ��
�� 
msng	o o      ���� 0 	theresult 	theResult	m 	p��	p Q    �	q	r	s	q k    �	t	t 	u	v	u h    ��	w�� 0 
listobject 
listObject	w j     ��	x�� 
0 _list_  	x n    	y	z	y I    ��	{���� "0 aslistparameter asListParameter	{ 	|	}	| o    
���� 0 thelist theList	} 	~��	~ m   
 		 �	�	�  ��  ��  	z o     ���� 0 _support  	v 	�	�	� Z   *	�	�����	� =    	�	�	� n    	�	�	� 1    ��
�� 
leng	� n   	�	�	� o    ���� 
0 _list_  	� o    ���� 0 
listobject 
listObject	� m    ����  	� n   &	�	�	� I    &��	����� .0 throwinvalidparameter throwInvalidParameter	� 	�	�	� o    ���� 0 thelist theList	� 	�	�	� m     	�	� �	�	�  	� 	�	�	� m     !��
�� 
list	� 	���	� m   ! "	�	� �	�	� ( L i s t   c a n  t   b e   e m p t y .��  ��  	� o    ���� 0 _support  ��  ��  	� 	�	�	� r   + 8	�	�	� n  + 6	�	�	� I   0 6��	����� &0 asscriptparameter asScriptParameter	� 	�	�	� o   0 1���� 0 reduceobject reduceObject	� 	���	� m   1 2	�	� �	�	� 
 u s i n g��  ��  	� o   + 0���� 0 _support  	� o      ���� 0 reduceobject reduceObject	� 	�	�	� r   9 A	�	�	� n   9 ?	�	�	� 4   < ?��	�
�� 
cobj	� m   = >���� 	� n  9 <	�	�	� o   : <���� 
0 _list_  	� o   9 :���� 0 
listobject 
listObject	� o      ���� 0 	theresult 	theResult	� 	�	�	� Q   B �	�	�	�	� Y   E g	���	�	���	� r   T b	�	�	� n  T `	�	�	� I   U `��	����� 0 
reduceitem 
reduceItem	� 	�	�	� o   U V���� 0 	theresult 	theResult	� 	���	� n   V \	�	�	� 4   Y \��	�
�� 
cobj	� o   Z [���� 0 i  	� n  V Y	�	�	� o   W Y���� 
0 _list_  	� o   V W���� 0 
listobject 
listObject��  ��  	� o   T U���� 0 reduceobject reduceObject	� o      ���� 0 	theresult 	theResult�� 0 i  	� m   H I���� 	� n   I O	�	�	� 1   L N��
�� 
leng	� n  I L	�	�	� o   J L���� 
0 _list_  	� o   I J���� 0 
listobject 
listObject��  	� R      ��	�	�
�� .ascrerr ****      � ****	� o      ���� 0 etext eText	� ��	�	�
�� 
errn	� o      ���� 0 enumber eNumber	� ��	���
�� 
errt	� o      ���� 
0 eto eTo��  	� R   o ���	�	�
�� .ascrerr ****      � ****	� b   � �	�	�	� b   � �	�	�	� b   � �	�	�	� m   � �	�	� �	�	� * C o u l d n  t   r e d u c e   i t e m  	� o   � ����� 0 i  	� m   � �	�	� �	�	�  :  	� o   � ����� 0 etext eText	� ��	�	�
�� 
errn	� l 
 s t	�����	� o   s t���� 0 enumber eNumber��  ��  	� ��	�	�
�� 
erob	� l  w �	����	� N   w �	�	� n   w �	�	�	� 4   � ��~	�
�~ 
cobj	� o   � ��}�} 0 i  	� n  w �	�	�	� I   | ��|	��{�| "0 aslistparameter asListParameter	� 	�	�	� o   | }�z�z 0 thelist theList	� 	��y	� m   } �	�	� �	�	�  �y  �{  	� o   w |�x�x 0 _support  ��  �  	� �w	��v
�w 
errt	� o   � ��u�u 
0 eto eTo�v  	� 	��t	� L   � �	�	� o   � ��s�s 0 	theresult 	theResult�t  	r R      �r	�	�
�r .ascrerr ****      � ****	� o      �q�q 0 etext eText	� �p	�	�
�p 
errn	� o      �o�o 0 enumber eNumber	� �n	�	�
�n 
erob	� o      �m�m 0 efrom eFrom	� �l	��k
�l 
errt	� o      �j�j 
0 eto eTo�k  	s I   � ��i	��h�i 20 _errorwithpartialresult _errorWithPartialResult	� 	�	�	� m   � �	�	� �	�	�  r e d u c e   l i s t	� 	�	�	� o   � ��g�g 0 etext eText	� 	�	�	� o   � ��f�f 0 enumber eNumber	� 	�	�	� o   � ��e�e 0 efrom eFrom	� 	�
 	� o   � ��d�d 
0 eto eTo
  
�c
 o   � ��b�b 0 	theresult 	theResult�c  �h  ��  	e 


 l     �a�`�_�a  �`  �_  
 


 l     �^�]�\�^  �]  �\  
 


 l     �[

	�[  
 J D--------------------------------------------------------------------   
	 �



 � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
 


 l     �Z

�Z  
   sort   
 �

 
   s o r t
 


 l     �Y�X�W�Y  �X  �W  
 


 l      �V

�V  
�� Notes: 

- Quicksort provides between [best case] O(n * log n) and [worst case] O(n * n) efficiency, typically leaning towards the former in all but the most pathological cases.

- One limitation of quicksort is that it isn't stable, i.e. items that compare as equal can appear in any order in the resulting list; their original order isn't preserved. An alternate algorithm such as Heapsort would avoid this, but would likely be significantly slower on average (while heapsort is guaranteed to be O(n * log n), it has much higher constant overhead than quicksort which tends to be fast in all but the most degenerate cases).

- This implementation trades some speed for greater robustness and flexibility, sorting a 10,000-number list in ~1sec, whereas a bare-bones quicksort might be 2x faster. OTOH, if you want fast code then AppleScript's the absolute last language you want to be using anyway, (e.g. Python's `sorted` function is 100x faster). For sorting simple lists of number/text/date values it's probably much quicker to send the AS list across the ASOC bridge and use -[NSArray sortedArray...], but that doesn't generalize to other use cases so isn't used here.

   
 �

	0   N o t e s :   
 
 -   Q u i c k s o r t   p r o v i d e s   b e t w e e n   [ b e s t   c a s e ]   O ( n   *   l o g   n )   a n d   [ w o r s t   c a s e ]   O ( n   *   n )   e f f i c i e n c y ,   t y p i c a l l y   l e a n i n g   t o w a r d s   t h e   f o r m e r   i n   a l l   b u t   t h e   m o s t   p a t h o l o g i c a l   c a s e s . 
 
 -   O n e   l i m i t a t i o n   o f   q u i c k s o r t   i s   t h a t   i t   i s n ' t   s t a b l e ,   i . e .   i t e m s   t h a t   c o m p a r e   a s   e q u a l   c a n   a p p e a r   i n   a n y   o r d e r   i n   t h e   r e s u l t i n g   l i s t ;   t h e i r   o r i g i n a l   o r d e r   i s n ' t   p r e s e r v e d .   A n   a l t e r n a t e   a l g o r i t h m   s u c h   a s   H e a p s o r t   w o u l d   a v o i d   t h i s ,   b u t   w o u l d   l i k e l y   b e   s i g n i f i c a n t l y   s l o w e r   o n   a v e r a g e   ( w h i l e   h e a p s o r t   i s   g u a r a n t e e d   t o   b e   O ( n   *   l o g   n ) ,   i t   h a s   m u c h   h i g h e r   c o n s t a n t   o v e r h e a d   t h a n   q u i c k s o r t   w h i c h   t e n d s   t o   b e   f a s t   i n   a l l   b u t   t h e   m o s t   d e g e n e r a t e   c a s e s ) . 
 
 -   T h i s   i m p l e m e n t a t i o n   t r a d e s   s o m e   s p e e d   f o r   g r e a t e r   r o b u s t n e s s   a n d   f l e x i b i l i t y ,   s o r t i n g   a   1 0 , 0 0 0 - n u m b e r   l i s t   i n   ~ 1 s e c ,   w h e r e a s   a   b a r e - b o n e s   q u i c k s o r t   m i g h t   b e   2 x   f a s t e r .   O T O H ,   i f   y o u   w a n t   f a s t   c o d e   t h e n   A p p l e S c r i p t ' s   t h e   a b s o l u t e   l a s t   l a n g u a g e   y o u   w a n t   t o   b e   u s i n g   a n y w a y ,   ( e . g .   P y t h o n ' s   ` s o r t e d `   f u n c t i o n   i s   1 0 0 x   f a s t e r ) .   F o r   s o r t i n g   s i m p l e   l i s t s   o f   n u m b e r / t e x t / d a t e   v a l u e s   i t ' s   p r o b a b l y   m u c h   q u i c k e r   t o   s e n d   t h e   A S   l i s t   a c r o s s   t h e   A S O C   b r i d g e   a n d   u s e   - [ N S A r r a y   s o r t e d A r r a y . . . ] ,   b u t   t h a t   d o e s n ' t   g e n e r a l i z e   t o   o t h e r   u s e   c a s e s   s o   i s n ' t   u s e d   h e r e . 
 

 


 l     �U�T�S�U  �T  �S  
 


 l     �R�Q�P�R  �Q  �P  
 


 l     



 j   E I�O
 �O *0 _quicksortthreshold _quicksortThreshold
  m   E H�N�N 
 T N shorter ranges are sorted using insertion sort; longer ranges using quicksort   
 �
!
! �   s h o r t e r   r a n g e s   a r e   s o r t e d   u s i n g   i n s e r t i o n   s o r t ;   l o n g e r   r a n g e s   u s i n g   q u i c k s o r t
 
"
#
" l     �M�L�K�M  �L  �K  
# 
$
%
$ i  J M
&
'
& I      �J
(�I�J 	0 _sort  
( 
)
*
) o      �H�H $0 resultlistobject resultListObject
* 
+
,
+ o      �G�G 0 
startindex 
startIndex
, 
-
.
- o      �F�F 0 endindex endIndex
. 
/
0
/ o      �E�E  0 sortcomparator sortComparator
0 
1�D
1 o      �C�C 0 usequicksort useQuickSort�D  �I  
' l   
2
3
4
2 k    
5
5 
6
7
6 Z    t
8
9�B�A
8 o     �@�@ 0 usequicksort useQuickSort
9 l  p
:
;
<
: k   p
=
= 
>
?
> Z   
@
A�?�>
@ A    	
B
C
B \    
D
E
D o    �=�= 0 endindex endIndex
E o    �<�< 0 
startindex 
startIndex
C m    �;�; 
A L    �:�:  �?  �>  
? 
F
G
F r    &
H
I
H J    
J
J 
K
L
K o    �9�9 0 
startindex 
startIndex
L 
M�8
M o    �7�7 0 endindex endIndex�8  
I J      
N
N 
O
P
O o      �6�6 0 	leftindex 	leftIndex
P 
Q�5
Q o      �4�4 0 
rightindex 
rightIndex�5  
G 
R
S
R r   ' 8
T
U
T n   ' 6
V
W
V 3   4 6�3
�3 
cobj
W n   ' 4
X
Y
X 7  * 4�2
Z
[
�2 
cobj
Z o   . 0�1�1 0 
startindex 
startIndex
[ o   1 3�0�0 0 endindex endIndex
Y n  ' *
\
]
\ o   ( *�/�/ 
0 _keys_  
] o   ' (�.�. $0 resultlistobject resultListObject
U o      �-�- 0 
pivotvalue 
pivotValue
S 
^
_
^ V   9;
`
a
` k   A6
b
b 
c
d
c Q   A �
e
f
g
e V   D d
h
i
h l  Z _
j
k
l
j r   Z _
m
n
m [   Z ]
o
p
o o   Z [�,�, 0 	leftindex 	leftIndex
p m   [ \�+�+ 
n o      �*�* 0 	leftindex 	leftIndex
k � z while cmp returns -1; note that if compareKeys() returns a non-numeric value/no result, this will throw -1700/-2763 error   
l �
q
q �   w h i l e   c m p   r e t u r n s   - 1 ;   n o t e   t h a t   i f   c o m p a r e K e y s ( )   r e t u r n s   a   n o n - n u m e r i c   v a l u e / n o   r e s u l t ,   t h i s   w i l l   t h r o w   - 1 7 0 0 / - 2 7 6 3   e r r o r
i A   H Y
r
s
r c   H W
t
u
t n  H U
v
w
v I   I U�)
x�(�) 0 comparekeys compareKeys
x 
y
z
y e   I P
{
{ n   I P
|
}
| 4   L O�'
~
�' 
cobj
~ o   M N�&�& 0 	leftindex 	leftIndex
} n  I L

�
 o   J L�%�% 
0 _keys_  
� o   I J�$�$ $0 resultlistobject resultListObject
z 
��#
� o   P Q�"�" 0 
pivotvalue 
pivotValue�#  �(  
w o   H I�!�!  0 sortcomparator sortComparator
u m   U V� 
�  
nmbr
s m   W X��  
f R      �
�
�
� .ascrerr ****      � ****
� o      �� 0 etext eText
� �
�
�
� 
errn
� o      �� 0 enum eNum
� �
�
�
� 
erob
� o      �� 0 efrom eFrom
� �
��
� 
errt
� o      �� 
0 eto eTo�  
g R   l ��
�
�
� .ascrerr ****      � ****
� b   | 
�
�
� m   | }
�
� �
�
� < C o u l d n  t   c o m p a r e   o b j e c t   k e y s :  
� o   } ~�� 0 etext eText
� �
�
�
� 
errn
� o   n o�� 0 enum eNum
� �
�
�
� 
erob
� J   p y
�
� 
�
�
� n   p v
�
�
� 4   s v�
�
� 
cobj
� o   t u�� 0 	leftindex 	leftIndex
� n  p s
�
�
� o   q s�� 
0 _keys_  
� o   p q�� $0 resultlistobject resultListObject
� 
��
� o   v w�� 0 
pivotvalue 
pivotValue�  
� �

��	
�
 
errt
� o   z {�� 
0 eto eTo�	  
d 
�
�
� Q   � �
�
�
�
� V   � �
�
�
� l  � �
�
�
�
� r   � �
�
�
� \   � �
�
�
� o   � ��� 0 
rightindex 
rightIndex
� m   � ��� 
� o      �� 0 
rightindex 
rightIndex
�   while cmp returns 1;    
� �
�
� ,   w h i l e   c m p   r e t u r n s   1 ;  
� ?   � �
�
�
� c   � �
�
�
� n  � �
�
�
� I   � ��
��� 0 comparekeys compareKeys
� 
�
�
� n   � �
�
�
� 4   � ��
�
� 
cobj
� o   � ��� 0 
rightindex 
rightIndex
� n  � �
�
�
� o   � �� �  
0 _keys_  
� o   � ����� $0 resultlistobject resultListObject
� 
���
� o   � ����� 0 
pivotvalue 
pivotValue��  �  
� o   � �����  0 sortcomparator sortComparator
� m   � ���
�� 
nmbr
� m   � �����  
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
� o      ���� 0 enum eNum
� ��
�
�
�� 
erob
� o      ���� 0 efrom eFrom
� ��
���
�� 
errt
� o      ���� 
0 eto eTo��  
� R   � ���
�
�
�� .ascrerr ****      � ****
� b   � �
�
�
� m   � �
�
� �
�
� < C o u l d n  t   c o m p a r e   o b j e c t   k e y s :  
� o   � ����� 0 etext eText
� ��
�
�
�� 
errn
� o   � ����� 0 enum eNum
� ��
�
�
�� 
erob
� J   � �
�
� 
�
�
� n   � �
�
�
� 4   � ���
�
�� 
cobj
� o   � ����� 0 
rightindex 
rightIndex
� n  � �
�
�
� o   � ����� 
0 _keys_  
� o   � ����� $0 resultlistobject resultListObject
� 
���
� o   � ����� 0 
pivotvalue 
pivotValue��  
� ��
���
�� 
errt
� o   � ����� 
0 eto eTo��  
� 
���
� Z   �6
�
�����
� l  � �
�����
� H   � �
�
� ?   � �
�
�
� o   � ����� 0 	leftindex 	leftIndex
� o   � ����� 0 
rightindex 
rightIndex��  ��  
� k   �2
�
� 
�
�
� r   � �
�
�
� J   � �
�
� 
�
�
� e   � �
�
� n   � �
�
�
� 4   � ���
�
�� 
cobj
� o   � ����� 0 
rightindex 
rightIndex
� n  � �
�
�
� o   � ����� 
0 _keys_  
� o   � ����� $0 resultlistobject resultListObject
� 
���
� e   � �
�
� n   � �
�
�
� 4   � ���
�
�� 
cobj
� o   � ����� 0 	leftindex 	leftIndex
� n  � �
�
�
� o   � ����� 
0 _keys_  
� o   � ����� $0 resultlistobject resultListObject��  
� J      
�
� 
�
�
� n      
�
�
� 4   � ���
�
�� 
cobj
� o   � ����� 0 	leftindex 	leftIndex
� n  � �
�
�
� o   � ����� 
0 _keys_  
� o   � ����� $0 resultlistobject resultListObject
� 
���
� n      
�
�
� 4   � ���
�
�� 
cobj
� o   � ����� 0 
rightindex 
rightIndex
� n  � �
�
�
� o   � ����� 
0 _keys_  
� o   � ����� $0 resultlistobject resultListObject��  
�    r   � J   �  e   � � n   � �	 4   � ���

�� 
cobj
 o   � ����� 0 
rightindex 
rightIndex	 n  � � o   � ����� 
0 _list_   o   � ����� $0 resultlistobject resultListObject �� e   � � n   � � 4   � ���
�� 
cobj o   � ����� 0 	leftindex 	leftIndex n  � � o   � ����� 
0 _list_   o   � ����� $0 resultlistobject resultListObject��   J        n       4  	��
�� 
cobj o  
���� 0 	leftindex 	leftIndex n 	 o  	���� 
0 _list_   o  ���� $0 resultlistobject resultListObject �� n       4  ��
�� 
cobj o  ���� 0 
rightindex 
rightIndex n  !  o  ���� 
0 _list_  ! o  ���� $0 resultlistobject resultListObject��   "��" r  2#$# J  #%% &'& [  ()( o  ���� 0 	leftindex 	leftIndex) m  ���� ' *��* \  !+,+ o  ���� 0 
rightindex 
rightIndex, m   ���� ��  $ J      -- ./. o      ���� 0 	leftindex 	leftIndex/ 0��0 o      ���� 0 
rightindex 
rightIndex��  ��  ��  ��  ��  
a B   = @121 o   = >���� 0 	leftindex 	leftIndex2 o   > ?���� 0 
rightindex 
rightIndex
_ 3��3 Q  <p4564 k  ?g77 898 I  ?Q��:���� 	0 _sort  : ;<; o  @A���� $0 resultlistobject resultListObject< =>= o  AB���� 0 
startindex 
startIndex> ?@? o  BC���� 0 
rightindex 
rightIndex@ ABA o  CD����  0 sortcomparator sortComparatorB C��C ?  DMDED \  DGFGF o  DE���� 0 
rightindex 
rightIndexG o  EF���� 0 
startindex 
startIndexE o  GL���� *0 _quicksortthreshold _quicksortThreshold��  ��  9 HIH I  Rd��J���� 	0 _sort  J KLK o  ST���� $0 resultlistobject resultListObjectL MNM o  TU���� 0 	leftindex 	leftIndexN OPO o  UV���� 0 endindex endIndexP QRQ o  VW����  0 sortcomparator sortComparatorR S��S ?  W`TUT \  WZVWV o  WX���� 0 endindex endIndexW o  XY���� 0 	leftindex 	leftIndexU o  Z_���� *0 _quicksortthreshold _quicksortThreshold��  ��  I X��X L  eg����  ��  5 R      ����Y
�� .ascrerr ****      � ****��  Y ��Z��
�� 
errnZ d      [[ m      ����
���  6 l oo��\]��  \ r l stack overflow, so fall-through to use non-recursive insertion sort (this should rarely happen in practice)   ] �^^ �   s t a c k   o v e r f l o w ,   s o   f a l l - t h r o u g h   t o   u s e   n o n - r e c u r s i v e   i n s e r t i o n   s o r t   ( t h i s   s h o u l d   r a r e l y   h a p p e n   i n   p r a c t i c e )��  
; � � sort mostly uses quicksort, but falls through to insertionsort when sorting small number of items (<8), or when sorting a mostly-sorted list, or when quicksort recursion exceeds AS's stack depth   
< �__�   s o r t   m o s t l y   u s e s   q u i c k s o r t ,   b u t   f a l l s   t h r o u g h   t o   i n s e r t i o n s o r t   w h e n   s o r t i n g   s m a l l   n u m b e r   o f   i t e m s   ( < 8 ) ,   o r   w h e n   s o r t i n g   a   m o s t l y - s o r t e d   l i s t ,   o r   w h e n   q u i c k s o r t   r e c u r s i o n   e x c e e d s   A S ' s   s t a c k   d e p t h�B  �A  
7 `a` l uu��bc��  b � � fall-through to use loop-based insertion sort when sorting a small number of items (for which it is faster than quicksort), or when quicksort recursion overflows AppleScript's call stack   c �ddv   f a l l - t h r o u g h   t o   u s e   l o o p - b a s e d   i n s e r t i o n   s o r t   w h e n   s o r t i n g   a   s m a l l   n u m b e r   o f   i t e m s   ( f o r   w h i c h   i t   i s   f a s t e r   t h a n   q u i c k s o r t ) ,   o r   w h e n   q u i c k s o r t   r e c u r s i o n   o v e r f l o w s   A p p l e S c r i p t ' s   c a l l   s t a c ka efe r  uzghg [  uxiji o  uv���� 0 
startindex 
startIndexj m  vw���� h o      ���� 0 
startindex 
startIndexf k��k Y  {l��mn��l Y  �o��pqro k  �ss tut r  ��vwv J  ��xx yzy e  ��{{ n  ��|}| 4  ����~
�� 
cobj~ l ������ \  ����� o  ������ 0 j  � m  ������ ��  ��  } n ����� o  ������ 
0 _keys_  � o  ������ $0 resultlistobject resultListObjectz ���� e  ���� n  ����� 4  ����
� 
cobj� o  ���~�~ 0 j  � n ����� o  ���}�} 
0 _keys_  � o  ���|�| $0 resultlistobject resultListObject��  w J      �� ��� o      �{�{ 0 leftkey leftKey� ��z� o      �y�y 0 rightkey rightKey�z  u ��� l ������ Z �����x�w� B  ����� n ����� I  ���v��u�v 0 comparekeys compareKeys� ��� o  ���t�t 0 leftkey leftKey� ��s� o  ���r�r 0 rightkey rightKey�s  �u  � o  ���q�q  0 sortcomparator sortComparator� m  ���p�p  �  S  ���x  �w  � !  stop when leftKey�rightKey   � ��� 6   s t o p   w h e n   l e f t K e y"d r i g h t K e y� ��� r  ����� J  ���� ��� o  ���o�o 0 rightkey rightKey� ��n� o  ���m�m 0 leftkey leftKey�n  � J      �� ��� n      ��� 4  ���l�
�l 
cobj� l ����k�j� \  ����� o  ���i�i 0 j  � m  ���h�h �k  �j  � n ����� o  ���g�g 
0 _keys_  � o  ���f�f $0 resultlistobject resultListObject� ��e� n      ��� 4  ���d�
�d 
cobj� o  ���c�c 0 j  � n ����� o  ���b�b 
0 _keys_  � o  ���a�a $0 resultlistobject resultListObject�e  � ��`� r  ���� J  ���� ��� e  ���� n  ����� 4  ���_�
�_ 
cobj� o  ���^�^ 0 j  � n ����� o  ���]�] 
0 _list_  � o  ���\�\ $0 resultlistobject resultListObject� ��[� e  ���� n  ����� 4  ���Z�
�Z 
cobj� l ����Y�X� \  ����� o  ���W�W 0 j  � m  ���V�V �Y  �X  � n ����� o  ���U�U 
0 _list_  � o  ���T�T $0 resultlistobject resultListObject�[  � J      �� ��� n      ��� 4  ��S�
�S 
cobj� l ���R�Q� \  ���� o  ���P�P 0 j  � m  � �O�O �R  �Q  � n ����� o  ���N�N 
0 _list_  � o  ���M�M $0 resultlistobject resultListObject� ��L� n      ��� 4  �K�
�K 
cobj� o  �J�J 0 j  � n ��� o  	�I�I 
0 _list_  � o  	�H�H $0 resultlistobject resultListObject�L  �`  �� 0 j  p o  ���G�G 0 i  q o  ���F�F 0 
startindex 
startIndexr m  ���E�E���� 0 i  m o  ~�D�D 0 
startindex 
startIndexn o  ��C�C 0 endindex endIndex��  ��  
3 1 + performs in-place quicksort/insertionsort	   
4 ��� V   p e r f o r m s   i n - p l a c e   q u i c k s o r t / i n s e r t i o n s o r t 	
% ��� l     �B�A�@�B  �A  �@  � ��� l     �?���?  �  -----   � ��� 
 - - - - -� ��� l     �>�=�<�>  �=  �<  � ��� i  N Q��� I     �;��
�; .Lst:Sortnull���     ****� o      �:�: 0 thelist theList� �9��8
�9 
Comp� |�7�6��5��7  �6  � o      �4�4  0 sortcomparator sortComparator�5  � l     ��3�2� m      �1
�1 
msng�3  �2  �8  � k    u�� ��� l     �0���0  �.( note that `sort list` currently doesn't implement a `reversed order` parameter as its quicksort algorithm isn't stable (i.e. items that compare as equal will appear in any order, not the order in which they were supplied), so such an option would be useless in practice and rather misleading too. (To get a list in descending order, just get the returned list's `reverse` property or else pass a comparator containing a suitable compareKeys handler.) This parameter can always be added in future if/when a stable sorting algorithm is ever implemented.   � ���P   n o t e   t h a t   ` s o r t   l i s t `   c u r r e n t l y   d o e s n ' t   i m p l e m e n t   a   ` r e v e r s e d   o r d e r `   p a r a m e t e r   a s   i t s   q u i c k s o r t   a l g o r i t h m   i s n ' t   s t a b l e   ( i . e .   i t e m s   t h a t   c o m p a r e   a s   e q u a l   w i l l   a p p e a r   i n   a n y   o r d e r ,   n o t   t h e   o r d e r   i n   w h i c h   t h e y   w e r e   s u p p l i e d ) ,   s o   s u c h   a n   o p t i o n   w o u l d   b e   u s e l e s s   i n   p r a c t i c e   a n d   r a t h e r   m i s l e a d i n g   t o o .   ( T o   g e t   a   l i s t   i n   d e s c e n d i n g   o r d e r ,   j u s t   g e t   t h e   r e t u r n e d   l i s t ' s   ` r e v e r s e `   p r o p e r t y   o r   e l s e   p a s s   a   c o m p a r a t o r   c o n t a i n i n g   a   s u i t a b l e   c o m p a r e K e y s   h a n d l e r . )   T h i s   p a r a m e t e r   c a n   a l w a y s   b e   a d d e d   i n   f u t u r e   i f / w h e n   a   s t a b l e   s o r t i n g   a l g o r i t h m   i s   e v e r   i m p l e m e n t e d .� ��/� Q    u���� k   _�� ��� r       n    I    �.�-�. "0 aslistparameter asListParameter  o    	�,�, 0 thelist theList �+ m   	 
 �		  �+  �-   o    �*�* 0 _support   o      �)�) 0 thelist theList� 

 h    �(�( $0 resultlistobject resultListObject k        l      j     	�'�' 
0 _keys_   n      2   �&
�& 
cobj o     �%�% 0 thelist theList ~ x (replacing items in an existing list of the correct length is a little faster than appending items to a new empty list)    � �   ( r e p l a c i n g   i t e m s   i n   a n   e x i s t i n g   l i s t   o f   t h e   c o r r e c t   l e n g t h   i s   a   l i t t l e   f a s t e r   t h a n   a p p e n d i n g   i t e m s   t o   a   n e w   e m p t y   l i s t ) �$ j   
 �#�# 
0 _list_   n   
  2   �"
�" 
cobj o   
 �!�! 0 thelist theList�$    Z   ,� � A       n   !"! 1    �
� 
leng" n   #$# o    �� 
0 _list_  $ o    �� $0 resultlistobject resultListObject  m    ��  L   # (%% n  # '&'& o   $ &�� 
0 _list_  ' o   # $�� $0 resultlistobject resultListObject�   �   ()( Z   - J*+�,* =  - 0-.- o   - .��  0 sortcomparator sortComparator. m   . /�
� 
msng+ r   3 :/0/ I  3 8���
� .Lst:DeSonull��� ��� null�  �  0 o      ��  0 sortcomparator sortComparator�  , r   = J121 n  = H343 I   B H�5�� &0 asscriptparameter asScriptParameter5 676 o   B C��  0 sortcomparator sortComparator7 8�8 m   C D99 �:: 
 u s i n g�  �  4 o   = B�� 0 _support  2 o      ��  0 sortcomparator sortComparator) ;<; l  K K�=>�  = M G call comparator's makeKey method to generate each sortable key in turn   > �?? �   c a l l   c o m p a r a t o r ' s   m a k e K e y   m e t h o d   t o   g e n e r a t e   e a c h   s o r t a b l e   k e y   i n   t u r n< @A@ l  K NBCDB r   K NEFE m   K L�
�
  F o      �	�	 "0 disorderedcount disorderedCountC z t while generating keys also check if list is already almost/fully sorted and if it is use insertionsort/return as-is   D �GG �   w h i l e   g e n e r a t i n g   k e y s   a l s o   c h e c k   i f   l i s t   i s   a l r e a d y   a l m o s t / f u l l y   s o r t e d   a n d   i f   i t   i s   u s e   i n s e r t i o n s o r t / r e t u r n   a s - i sA HIH Q   OJKLJ k   RMM NON Q   R �PQRP r   U cSTS n  U aUVU I   V a�W�� 0 makekey makeKeyW X�X e   V ]YY n   V ]Z[Z 4   Y \�\
� 
cobj\ m   Z [�� [ n  V Y]^] o   W Y�� 
0 _keys_  ^ o   V W�� $0 resultlistobject resultListObject�  �  V o   U V��  0 sortcomparator sortComparatorT o      � �  0 previouskey previousKeyQ R      ��_`
�� .ascrerr ****      � ****_ o      ���� 0 etext eText` ��ab
�� 
errna o      ���� 0 enum eNumb ��c��
�� 
errtc o      ���� 
0 eto eTo��  R R   k ���de
�� .ascrerr ****      � ****d b   � �fgf m   � �hh �ii : C o u l d n  t   m a k e K e y   f o r   i t e m   1 :  g o   � ����� 0 etext eTexte ��jk
�� 
errnj o   o p���� 0 enum eNumk ��lm
�� 
erobl l  s {n����n N   s {oo n   s zpqp 4   w z��r
�� 
cobjr m   x y���� q l  s ws����s e   s wtt n  s wuvu o   t v���� 
0 _list_  v o   s t���� $0 resultlistobject resultListObject��  ��  ��  ��  m ��w��
�� 
errtw o   ~ ���� 
0 eto eTo��  O xyx r   � �z{z o   � ����� 0 previouskey previousKey{ n      |}| 4   � ���~
�� 
cobj~ m   � ����� } n  � �� o   � ����� 
0 _keys_  � o   � ����� $0 resultlistobject resultListObjecty ���� Y   ��������� k   � ��� ��� Q   � ����� r   � ���� n  � ���� I   � �������� 0 makekey makeKey� ���� n   � ���� 4   � ����
�� 
cobj� o   � ����� 0 i  � n  � ���� o   � ����� 
0 _keys_  � o   � ����� $0 resultlistobject resultListObject��  ��  � o   � �����  0 sortcomparator sortComparator� o      ���� 0 
currentkey 
currentKey� R      ����
�� .ascrerr ****      � ****� o      ���� 0 etext eText� ����
�� 
errn� o      ���� 0 enum eNum� �����
�� 
errt� o      ���� 
0 eto eTo��  � R   � �����
�� .ascrerr ****      � ****� b   � ���� b   � ���� b   � ���� m   � ��� ��� 4 C o u l d n  t   m a k e K e y   f o r   i t e m  � o   � ����� 0 i  � m   � ��� ���  :  � o   � ����� 0 etext eText� ����
�� 
errn� o   � ����� 0 enum eNum� ����
�� 
erob� l  � ������� N   � ��� n   � ���� 4   � ����
�� 
cobj� o   � ����� 0 i  � l  � ������� e   � ��� n  � ���� o   � ����� 
0 _list_  � o   � ����� $0 resultlistobject resultListObject��  ��  ��  ��  � �����
�� 
errt� o   � ����� 
0 eto eTo��  � ��� r   � ���� o   � ����� 0 
currentkey 
currentKey� n      ��� 4   � ����
�� 
cobj� o   � ����� 0 i  � n  � ���� o   � ����� 
0 _keys_  � o   � ����� $0 resultlistobject resultListObject� ��� Z  � �������� ?   � ���� n  � ���� I   � �������� 0 comparekeys compareKeys� ��� o   � ����� 0 previouskey previousKey� ���� o   � ����� 0 
currentkey 
currentKey��  ��  � o   � �����  0 sortcomparator sortComparator� m   � �����  � r   � ���� [   � ���� o   � ����� "0 disorderedcount disorderedCount� m   � ����� � o      ���� "0 disorderedcount disorderedCount��  ��  � ���� r   � ���� o   � ����� 0 
currentkey 
currentKey� o      ���� 0 previouskey previousKey��  �� 0 i  � m   � ����� � n  � ���� 1   � ���
�� 
leng� n  � ���� o   � ����� 
0 _keys_  � o   � ����� $0 resultlistobject resultListObject��  ��  K R      ����
�� .ascrerr ****      � ****� o      ���� 0 etext eText� ����
�� 
errn� o      ���� 0 enum eNum� ����
�� 
erob� o      ���� 0 efrom eFrom� �����
�� 
errt� o      ���� 
0 eto eTo��  L R  ����
�� .ascrerr ****      � ****� o  ���� 0 etext eText� ����
�� 
errn� o  ���� 0 enum eNum� ����
�� 
erob� o  ���� 0 efrom eFrom� �����
�� 
errt� o  ���� 
0 eto eTo��  I ��� Z  Y������� ?  "��� o   ���� "0 disorderedcount disorderedCount� m   !����  � l %U���� k  %U�� ��� l %D���� r  %D��� F  %B��� l %0������ ?  %0��� n %*��� 1  (*��
�� 
leng� n %(��� o  &(���� 
0 _list_  � o  %&���� $0 resultlistobject resultListObject� o  */���� *0 _quicksortthreshold _quicksortThreshold��  ��  � ?  3>��� l 3:������ ^  3:   o  34���� "0 disorderedcount disorderedCount l 49���� n 49 1  79��
�� 
leng n 47 o  57���� 
0 _list_   o  45���� $0 resultlistobject resultListObject��  ��  ��  ��  � m  := ?�z�G�{� o      ���� 0 usequicksort useQuickSort� \ V if list is small or already 99% in-order then insertion sort is faster than quicksort   � � �   i f   l i s t   i s   s m a l l   o r   a l r e a d y   9 9 %   i n - o r d e r   t h e n   i n s e r t i o n   s o r t   i s   f a s t e r   t h a n   q u i c k s o r t� 	��	 I  EU��
���� 	0 _sort  
  o  FG�� $0 resultlistobject resultListObject  m  GH�~�~   n HM 1  KM�}
�} 
leng n HK o  IK�|�| 
0 _list_   o  HI�{�{ $0 resultlistobject resultListObject  o  MN�z�z  0 sortcomparator sortComparator �y o  NO�x�x 0 usequicksort useQuickSort�y  ��  ��  �   some sorting required   � � ,   s o m e   s o r t i n g   r e q u i r e d��  ��  � �w L  Z_ n Z^ o  []�v�v 
0 _list_   o  Z[�u�u $0 resultlistobject resultListObject�w  � R      �t
�t .ascrerr ****      � **** o      �s�s 0 etext eText �r 
�r 
errn o      �q�q 0 enumber eNumber  �p!"
�p 
erob! o      �o�o 0 efrom eFrom" �n#�m
�n 
errt# o      �l�l 
0 eto eTo�m  � I  gu�k$�j�k 
0 _error  $ %&% m  hk'' �((  s o r t   l i s t& )*) o  kl�i�i 0 etext eText* +,+ o  lm�h�h 0 enumber eNumber, -.- o  mn�g�g 0 efrom eFrom. /�f/ o  no�e�e 
0 eto eTo�f  �j  �/  � 010 l     �d�c�b�d  �c  �b  1 232 l     �a�`�_�a  �`  �_  3 454 l     �^67�^  6  -----   7 �88 
 - - - - -5 9:9 l     �];<�]  ; U O sort comparator constructors; used to customize how `sort list` compares items   < �== �   s o r t   c o m p a r a t o r   c o n s t r u c t o r s ;   u s e d   t o   c u s t o m i z e   h o w   ` s o r t   l i s t `   c o m p a r e s   i t e m s: >?> l     �\�[�Z�\  �[  �Z  ? @A@ i  R UBCB I     �Y�X�W
�Y .Lst:DeSonull��� ��� null�X  �W  C h     �VD�V &0 defaultcomparator DefaultComparatorD k      EE FGF j     �UH�U "0 _supportedtypes _supportedTypesH J     II JKJ m     �T
�T 
nmbrK LML m    �S
�S 
ctxtM N�RN m    �Q
�Q 
ldt �R  G OPO j    	�PQ�P 	0 _type  Q m    �O
�O 
msngP RSR i   
 TUT I      �NV�M�N 0 makekey makeKeyV W�LW o      �K�K 0 anobject anObject�L  �M  U k     }XX YZY Z     z[\]�J[ =    ^_^ o     �I�I 	0 _type  _ m    �H
�H 
msng\ k   
 K`` aba X   
 Bc�Gdc Z    =ef�F�Ee ?    *ghg l   (i�D�Ci I   (�Bjk
�B .corecnte****       ****j J    ll m�Am o    �@�@ 0 anobject anObject�A  k �?n�>
�? 
kocln l    $o�=�<o e     $pp n    $qrq 1   ! #�;
�; 
pcntr o     !�:�: 0 aref aRef�=  �<  �>  �D  �C  h m   ( )�9�9  f k   - 9ss tut r   - 6vwv n  - 0xyx 1   . 0�8
�8 
pcnty o   - .�7�7 0 aref aRefw o      �6�6 	0 _type  u z�5z L   7 9{{ o   7 8�4�4 0 anobject anObject�5  �F  �E  �G 0 aref aRefd n   |}| o    �3�3 "0 _supportedtypes _supportedTypes}  f    b ~�2~ R   C K�1�
�1 .ascrerr ****      � **** m   I J�� ��� � I n v a l i d   i t e m   t y p e   ( d e f a u l t   c o m p a r a t o r   c a n   o n l y   c o m p a r e   i n t e g e r / r e a l ,   t e x t ,   o r   d a t e   t y p e s ) .� �0��
�0 
errn� m   E F�/�/�\� �.��-
�. 
erob� o   G H�,�, 0 anobject anObject�-  �2  ] ��� =   N ]��� l  N [��+�*� I  N [�)��
�) .corecnte****       ****� J   N Q�� ��(� o   N O�'�' 0 anobject anObject�(  � �&��%
�& 
kocl� o   R W�$�$ 	0 _type  �%  �+  �*  � m   [ \�#�#  � ��"� R   ` v�!��
�! .ascrerr ****      � ****� b   f u��� b   f s��� b   f o��� b   f m��� m   f g�� ��� ^ I n v a l i d   i t e m   t y p e   ( d e f a u l t   c o m p a r a t o r   e x p e c t e d  � o   g l� �  	0 _type  � m   m n�� ���    b u t   r e c e i v e d  � l  o r���� n   o r��� m   p r�
� 
pcls� o   o p�� 0 anobject anObject�  �  � m   s t�� ���  ) .� ���
� 
errn� m   b c���\� ���
� 
erob� o   d e�� 0 anobject anObject�  �"  �J  Z ��� L   { }�� o   { |�� 0 anobject anObject�  S ��� i   ��� I      ���� 0 comparekeys compareKeys� ��� o      �� 0 
leftobject 
leftObject� ��� o      �� 0 rightobject rightObject�  �  � Z     ����� A     ��� o     �� 0 
leftobject 
leftObject� o    �� 0 rightobject rightObject� L    �� m    ����� ��� ?    ��� o    �� 0 
leftobject 
leftObject� o    �
�
 0 rightobject rightObject� ��	� L    �� m    �� �	  � L    �� m    ��  �  A ��� l     ����  �  �  � ��� l     ����  �  �  � ��� i  V Y��� I     � ����
�  .Lst:NuSonull��� ��� null��  ��  � h     ����� &0 numericcomparator NumericComparator� k      �� ��� i    ��� I      ������� 0 makekey makeKey� ���� o      ���� 0 anobject anObject��  ��  � L     �� c     ��� o     ���� 0 anobject anObject� m    ��
�� 
nmbr� ���� i   ��� I      ������� 0 comparekeys compareKeys� ��� o      ���� 0 
leftobject 
leftObject� ���� o      ���� 0 rightobject rightObject��  ��  � l    ���� L     �� \     ��� o     ���� 0 
leftobject 
leftObject� o    ���� 0 rightobject rightObject� note: since compareKeys' return value can be any -ve/0/+ve number, a single subtraction operation is sufficient for numbers and dates. (Caveat: this doesn't take into account minor differences due to real imprecision. Currently this doesn't matter as quicksort isn't stable anyway so makes no guarantees about the order of effectively-if-not-exactly-equal real numbers; however, if quicksort ever gets replaced with a stable sorting algorithm then this method will need revised to use Number library's `cmp` instead.)   � ���   n o t e :   s i n c e   c o m p a r e K e y s '   r e t u r n   v a l u e   c a n   b e   a n y   - v e / 0 / + v e   n u m b e r ,   a   s i n g l e   s u b t r a c t i o n   o p e r a t i o n   i s   s u f f i c i e n t   f o r   n u m b e r s   a n d   d a t e s .   ( C a v e a t :   t h i s   d o e s n ' t   t a k e   i n t o   a c c o u n t   m i n o r   d i f f e r e n c e s   d u e   t o   r e a l   i m p r e c i s i o n .   C u r r e n t l y   t h i s   d o e s n ' t   m a t t e r   a s   q u i c k s o r t   i s n ' t   s t a b l e   a n y w a y   s o   m a k e s   n o   g u a r a n t e e s   a b o u t   t h e   o r d e r   o f   e f f e c t i v e l y - i f - n o t - e x a c t l y - e q u a l   r e a l   n u m b e r s ;   h o w e v e r ,   i f   q u i c k s o r t   e v e r   g e t s   r e p l a c e d   w i t h   a   s t a b l e   s o r t i n g   a l g o r i t h m   t h e n   t h i s   m e t h o d   w i l l   n e e d   r e v i s e d   t o   u s e   N u m b e r   l i b r a r y ' s   ` c m p `   i n s t e a d . )��  � ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� i  Z ]��� I     ������
�� .Lst:DaSonull��� ��� null��  ��  � h     �����  0 datecomparator DateComparator� k      �� ��� i    ��� I      ������� 0 makekey makeKey� ���� o      ���� 0 anobject anObject��  ��  � L     �� c     ��� o     ���� 0 anobject anObject� m    ��
�� 
ldt � ���� i   ��� I      ������� 0 comparekeys compareKeys� ��� o      ���� 0 
leftobject 
leftObject� ���� o      ���� 0 rightobject rightObject��  ��  � l    ���� L     �� \     ��� o     ���� 0 
leftobject 
leftObject� o    ���� 0 rightobject rightObject� Y S as in NumericComparator, a simple subtraction operation produces a suitable result   � ��� �   a s   i n   N u m e r i c C o m p a r a t o r ,   a   s i m p l e   s u b t r a c t i o n   o p e r a t i o n   p r o d u c e s   a   s u i t a b l e   r e s u l t��  �    l     ��������  ��  ��    l     ��������  ��  ��    i  ^ a I     ����
�� .Lst:TeSonull��� ��� null��   ��	��
�� 
Cons	 |����
����  ��  
 o      ����  0 orderingoption orderingOption��   l     ���� m      ��
�� SrtESrtI��  ��  ��   Q     ] k    G  h    
���� B0 currentconsiderationscomparator CurrentConsiderationsComparator k        i     I      ������ 0 makekey makeKey �� o      ���� 0 anobject anObject��  ��   l     L      c       o     ���� 0 anobject anObject  m    ��
�� 
ctxt � � caution: some AS types - e.g. reals, lists - are subject to localization/TIDs issues when coercing to text, but there's a practical limit to how much AS insanity a library can protect user from without completely bogging down itself    �!!�   c a u t i o n :   s o m e   A S   t y p e s   -   e . g .   r e a l s ,   l i s t s   -   a r e   s u b j e c t   t o   l o c a l i z a t i o n / T I D s   i s s u e s   w h e n   c o e r c i n g   t o   t e x t ,   b u t   t h e r e ' s   a   p r a c t i c a l   l i m i t   t o   h o w   m u c h   A S   i n s a n i t y   a   l i b r a r y   c a n   p r o t e c t   u s e r   f r o m   w i t h o u t   c o m p l e t e l y   b o g g i n g   d o w n   i t s e l f "��" i   #$# I      ��%���� 0 comparekeys compareKeys% &'& o      ���� 0 
leftobject 
leftObject' (��( o      ���� 0 rightobject rightObject��  ��  $ Z     )*+,) A     -.- o     ���� 0 
leftobject 
leftObject. o    ���� 0 rightobject rightObject* L    // m    ������+ 010 ?    232 o    ���� 0 
leftobject 
leftObject3 o    ���� 0 rightobject rightObject1 4��4 L    55 m    ���� ��  , L    66 m    ����  ��   7��7 Z    G89:;8 =   <=< o    ����  0 orderingoption orderingOption= m    ��
�� SrtESrtI9 k    >> ?@? h    ��A�� >0 caseinsensitivetextcomparator CaseInsensitiveTextComparatorA k      BB CDC j     ��E
�� 
pareE o     ���� B0 currentconsiderationscomparator CurrentConsiderationsComparatorD F��F i  	 GHG I      ��I���� 0 comparekeys compareKeysI JKJ o      ���� 0 
leftobject 
leftObjectK L��L o      ���� 0 rightobject rightObject��  ��  H P     MNOM L    PP M    QQ I      ��R���� 0 comparekeys compareKeysR STS o    ���� 0 
leftobject 
leftObjectT U��U o    ���� 0 rightobject rightObject��  ��  N ��V
�� consdiacV ��W
�� conshyphW ��X
�� conspuncX ����
�� conswhit��  O ��Y
�� conscaseY ����
�� consnume��  ��  @ Z��Z L    [[ o    ���� >0 caseinsensitivetextcomparator CaseInsensitiveTextComparator��  : \]\ =   !^_^ o    ����  0 orderingoption orderingOption_ m     ��
�� SrtESrtM] `a` k   $ .bb cdc h   $ +��e�� 40 exactmatchtextcomparator ExactMatchTextComparatore k      ff ghg j     ��i
�� 
parei o     ���� B0 currentconsiderationscomparator CurrentConsiderationsComparatorh j��j i  	 klk I      ��m���� 0 comparekeys compareKeysm non o      ���� 0 
leftobject 
leftObjecto p��p o      ���� 0 rightobject rightObject��  ��  l P     qrsq L    tt M    uu I      ��v���� 0 comparekeys compareKeysv wxw o    ���� 0 
leftobject 
leftObjectx y��y o    ���� 0 rightobject rightObject��  ��  r ��z
�� conscasez ��{
�� consdiac{ ��|
�� conshyph| ��}
�� conspunc} ����
�� conswhit��  s ��~
� consnume�~  ��  d ~�}~ L   , . o   , -�|�| 40 exactmatchtextcomparator ExactMatchTextComparator�}  a ��� =  1 4��� o   1 2�{�{  0 orderingoption orderingOption� m   2 3�z
�z SrtESrtD� ��y� L   7 9�� o   7 8�x�x B0 currentconsiderationscomparator CurrentConsiderationsComparator�y  ; n  < G��� I   A G�w��v�w >0 throwinvalidconstantparameter throwInvalidConstantParameter� ��� o   A B�u�u  0 orderingoption orderingOption� ��t� m   B C�� ���  f o r�t  �v  � o   < A�s�s 0 _support  ��   R      �r��
�r .ascrerr ****      � ****� o      �q�q 0 etext eText� �p��
�p 
errn� o      �o�o 0 enumber eNumber� �n��
�n 
erob� o      �m�m 0 efrom eFrom� �l��k
�l 
errt� o      �j�j 
0 eto eTo�k   I   O ]�i��h�i 
0 _error  � ��� m   P S�� ���  t e x t   c o m p a r a t o r� ��� o   S T�g�g 0 etext eText� ��� o   T U�f�f 0 enumber eNumber� ��� o   U V�e�e 0 efrom eFrom� ��d� o   V W�c�c 
0 eto eTo�d  �h   ��� l     �b�a�`�b  �a  �`  � ��� l     �_�^�]�_  �^  �]  � ��� i  b e��� I     �\�[�
�\ .Lst:LiSonull��� ��� null�[  � �Z��Y
�Z 
Comp� |�X�W��V��X  �W  � o      �U�U "0 itemcomparators itemComparators�V  � l     ��T�S� m      �R
�R 
msng�T  �S  �Y  � Q    :���� k   $�� ��� Z   ���Q�P� =   ��� o    �O�O "0 itemcomparators itemComparators� m    �N
�N 
msng� r   	 ��� I  	 �M�L�K
�M .Lst:DeSonull��� ��� null�L  �K  � o      �J�J $0 comparatorobject comparatorObject�Q  �P  � ��I� Z   $���H�� =     ��� l   ��G�F� I   �E��
�E .corecnte****       ****� J    �� ��D� o    �C�C "0 itemcomparators itemComparators�D  � �B��A
�B 
kocl� m    �@
�@ 
scpt�A  �G  �F  � m    �?�? � l  # ;���� k   # ;�� ��� r   # 0��� n  # .��� I   ( .�>��=�> &0 asscriptparameter asScriptParameter� ��� o   ( )�<�< "0 itemcomparators itemComparators� ��;� m   ) *�� ���  f o r�;  �=  � o   # (�:�: 0 _support  � o      �9�9 $0 comparatorobject comparatorObject� ��� h   1 8�8��8 .0 uniformlistcomparator UniformListComparator� l     ���� k      �� ��� i    ��� I      �7��6�7 0 makekey makeKey� ��5� o      �4�4 0 sublist  �5  �6  � h     �3��3 0 	keyobject 	KeyObject� k      �� ��� j     �2��2 
0 _list_  � o     �1�1 0 sublist  � ��� l     ���� j    
�0��0 
0 _keys_  � J    	�/�/  �   cached keys   � ���    c a c h e d   k e y s� ��� l     �.�-�,�.  �-  �,  � ��+� i   ��� I      �*��)�* 0 getkey getKey� ��(� o      �'�' 0 	itemindex 	itemIndex�(  �)  � k     0�� ��� V     '��� r    "��� n   ��� I    �&��%�& 0 makekey makeKey�  �$  n     4    �#
�# 
cobj o    �"�" 0 	itemindex 	itemIndex n    o    �!�! 
0 _list_    f    �$  �%  � o    � �  $0 comparatorobject comparatorObject� n        ;     ! o     �� 
0 _keys_  � ?    	 o    �� 0 	itemindex 	itemIndex	 n    


 1    
�
� 
leng n    o    �� 
0 _keys_    f    � � L   ( 0 n   ( / 4   + .�
� 
cobj o   , -�� 0 	itemindex 	itemIndex n  ( + o   ) +�� 
0 _keys_    f   ( )�  �+  �  l     ����  �  �   � i    I      ��� 0 comparekeys compareKeys  o      �� 0 leftkeyobject leftKeyObject � o      ��  0 rightkeyobject rightKeyObject�  �   k     z   r     !"! J     ## $%$ n    &'& 1    �
� 
leng' n    ()( o    �� 
0 _list_  ) o     �� 0 leftkeyobject leftKeyObject% *�* n   
+,+ 1    
�

�
 
leng, n   -.- o    �	�	 
0 _list_  . o    ��  0 rightkeyobject rightKeyObject�  " J      // 010 o      �� 0 
leftlength 
leftLength1 2�2 o      �� 0 rightlength rightLength�    343 r    565 o    �� 0 
leftlength 
leftLength6 o      �� 0 commonlength commonLength4 787 Z    -9:��9 A     #;<; o     !� �  0 rightlength rightLength< o   ! "���� 0 commonlength commonLength: r   & )=>= o   & '���� 0 rightlength rightLength> o      ���� 0 commonlength commonLength�  �  8 ?@? Y   . aA��BC��A l  8 \DEFD k   8 \GG HIH r   8 OJKJ n  8 MLML I   = M��N���� 0 comparekeys compareKeysN OPO n  = CQRQ I   > C��S���� 0 getkey getKeyS T��T o   > ?���� 0 i  ��  ��  R o   = >���� 0 leftkeyobject leftKeyObjectP U��U n  C IVWV I   D I��X���� 0 getkey getKeyX Y��Y o   D E���� 0 i  ��  ��  W o   C D����  0 rightkeyobject rightKeyObject��  ��  M o   8 =���� $0 comparatorobject comparatorObjectK o      ���� $0 comparisonresult comparisonResultI Z��Z Z  P \[\����[ >   P S]^] o   P Q���� $0 comparisonresult comparisonResult^ m   Q R����  \ L   V X__ o   V W���� $0 comparisonresult comparisonResult��  ��  ��  E E ? iterate over item indexes common to both lists, comparing keys   F �`` ~   i t e r a t e   o v e r   i t e m   i n d e x e s   c o m m o n   t o   b o t h   l i s t s ,   c o m p a r i n g   k e y s�� 0 i  B m   1 2���� C o   2 3���� 0 commonlength commonLength��  @ a��a Z   b zbcdeb A   b efgf o   b c���� 0 
leftlength 
leftLengthg o   c d���� 0 rightlength rightLengthc l  h jhijh L   h jkk m   h i������i A ; left sublist is shorter than right sublist, so comes first   j �ll v   l e f t   s u b l i s t   i s   s h o r t e r   t h a n   r i g h t   s u b l i s t ,   s o   c o m e s   f i r s td mnm ?   m popo o   m n���� 0 
leftlength 
leftLengthp o   n o���� 0 rightlength rightLengthn q��q l  s urstr L   s uuu m   s t���� s A ; right sublist is shorter than left sublist, so comes first   t �vv v   r i g h t   s u b l i s t   i s   s h o r t e r   t h a n   l e f t   s u b l i s t ,   s o   c o m e s   f i r s t��  e l  x zwxyw L   x zzz m   x y����  x   both lists are identical   y �{{ 2   b o t h   l i s t s   a r e   i d e n t i c a l��  �  � 9 3 compares sublists of same type and variable length   � �|| f   c o m p a r e s   s u b l i s t s   o f   s a m e   t y p e   a n d   v a r i a b l e   l e n g t h� }��} L   9 ;~~ o   9 :���� .0 uniformlistcomparator UniformListComparator��  � 6 0 compare all sublist items using same comparator   � � `   c o m p a r e   a l l   s u b l i s t   i t e m s   u s i n g   s a m e   c o m p a r a t o r�H  � k   >$�� ��� Z  > U������� =   > I��� l  > G������ I  > G����
�� .corecnte****       ****� J   > A�� ���� o   > ?���� "0 itemcomparators itemComparators��  � �����
�� 
kocl� m   B C��
�� 
reco��  ��  ��  � m   G H���� � r   L Q��� J   L O�� ���� o   L M���� "0 itemcomparators itemComparators��  � o      ���� "0 itemcomparators itemComparators��  ��  � ��� Z   V����� =   V a��� l  V ]������ I  V ]����
�� .corecnte****       ****� o   V W���� "0 itemcomparators itemComparators� �����
�� 
kocl� m   X Y��
�� 
reco��  ��  ��  � n  ] `��� 1   ^ `��
�� 
leng� o   ] ^���� "0 itemcomparators itemComparators� l  d ����� X   d ������ l  t ����� Q   t ����� k   w ��� ��� c   w |��� l  w z������ n   w z��� o   x z���� 0 	itemindex 	itemIndex� o   w x���� 0 aref aRef��  ��  � m   z {��
�� 
long� ���� c   } ���� l  } ������� n   } ���� o   ~ �����  0 itemcomparator itemComparator� o   } ~���� 0 aref aRef��  ��  � m   � ���
�� 
scpt��  � R      ����
�� .ascrerr ****      � ****� o      ���� 0 emsg eMsg� �����
�� 
errn� o      ���� 0 enum eNum��  � k   � ��� ��� Z  � �������� H   � ��� E  � ���� J   � ��� ��� m   � ������\� ���� m   � ������@��  � J   � ��� ���� o   � ����� 0 enum eNum��  � R   � �����
�� .ascrerr ****      � ****� o   � ����� 0 emsg eMsg� �����
�� 
errn� o   � ����� 0 enum eNum��  ��  ��  � ���� n  � ���� I   � �������� .0 throwinvalidparameter throwInvalidParameter� ��� o   � ����� 0 aref aRef� ��� m   � ��� ���  f o r� ��� m   � ���
�� 
list� ���� m   � ��� ��� F N o t   a   v a l i d   i t e m   c o m p a r a t o r   r e c o r d .��  ��  � o   � ����� 0 _support  ��  � 2 , check list contains item comparator records   � ��� X   c h e c k   l i s t   c o n t a i n s   i t e m   c o m p a r a t o r   r e c o r d s�� 0 aref aRef� o   g h���� "0 itemcomparators itemComparators�   list of records   � ���     l i s t   o f   r e c o r d s� ��� =   � ���� l  � ������� I  � �����
�� .corecnte****       ****� o   � ����� "0 itemcomparators itemComparators� �����
�� 
kocl� m   � ���
�� 
scpt��  ��  ��  � n  � ���� 1   � ���
�� 
leng� o   � ����� "0 itemcomparators itemComparators� ���� l  � ����� k   � ��� ��� l  � ����� r   � ���� n  � ���� 2  � ���
�� 
cobj� o   � ����� "0 itemcomparators itemComparators� o      ���� "0 itemcomparators itemComparators� ) # duplicate list before modifying it   � ��� F   d u p l i c a t e   l i s t   b e f o r e   m o d i f y i n g   i t� ���� Y   � ��������� r   � ���� K   � ��� ������ 0 	itemindex 	itemIndex� o   � ����� 0 idx  � �������  0 itemcomparator itemComparator� n   � �   4   � ���
�� 
cobj o   � ����� 0 idx   o   � ����� "0 itemcomparators itemComparators��  � n       4   � ���
�� 
cobj o   � ����� 0 idx   o   � ����� "0 itemcomparators itemComparators�� 0 idx  � m   � ����� � n   � � 1   � ���
�� 
leng o   � ����� "0 itemcomparators itemComparators��  ��  �   list of script objects   � � .   l i s t   o f   s c r i p t   o b j e c t s��  � n  �	
	 I  ��~� .0 throwinvalidparameter throwInvalidParameter  o  �}�} "0 itemcomparators itemComparators  m   �  f o r  J    m  �|
�| 
scpt �{ m  
�z
�z 
list�{   �y m   � � N o t   a   c o m p a r a t o r   s c r i p t   o b j e c t ,   l i s t   o f   c o m p a r a t o r   s c r i p t   o b j e c t s ,   o r   l i s t   o f   i t e m   c o m p a r a t o r   r e c o r d s .�y  �~  
 o   ��x�x 0 _support  �  h  !�w�w *0 mixedlistcomparator MixedListComparator l       k      !! "#" i    $%$ I      �v&�u�v 0 makekey makeKey& '�t' o      �s�s 0 sublist  �t  �u  % h     �r(�r 0 	keyobject 	KeyObject( l     )*+) k      ,, -.- j     �q/�q 
0 _list_  / o     �p�p 0 sublist  . 010 j    
�o2�o 
0 _keys_  2 J    	�n�n  1 343 l     �m�l�k�m  �l  �k  4 5�j5 i   676 I      �i8�h�i 0 getkey getKey8 9�g9 o      �f�f "0 comparatorindex comparatorIndex�g  �h  7 k     �:: ;<; V     �=>= k    {?? @A@ r    )BCB n    DED 4    �eF
�e 
cobjF o    �d�d "0 comparatorindex comparatorIndexE o    �c�c "0 itemcomparators itemComparatorsC K      GG �bHI�b 0 	itemindex 	itemIndexH o      �a�a 0 idx  I �`J�_�`  0 itemcomparator itemComparatorJ o      �^�^ $0 comparatorobject comparatorObject�_  A KLK Q   * iMNOM r   - 9PQP n   - 7RSR 4   0 7�]T
�] 
cobjT o   1 6�\�\ 0 idx  S n  - 0UVU o   . 0�[�[ 
0 _list_  V  f   - .Q o      �Z�Z 0 subitem subItemN R      �Y�XW
�Y .ascrerr ****      � ****�X  W �WX�V
�W 
errnX d      YY m      �U�U��V  O R   A i�TZ[
�T .ascrerr ****      � ****Z b   S h\]\ b   S f^_^ b   S ^`a` b   S \bcb m   S Tdd �ee & C a n  t   c o m p a r e   i t e m  c l  T [f�S�Rf c   T [ghg o   T Y�Q�Q 0 idx  h m   Y Z�P
�P 
long�S  �R  a m   \ ]ii �jj 8   o f   s u b - l i s t   a s   i t   o n l y   h a s  _ n  ^ eklk 1   c e�O
�O 
lengl o   ^ c�N�N 0 sublist  ] m   f gmm �nn    i t e m s .[ �Mop
�M 
errno m   C D�L�L�@p �Kq�J
�K 
erobq l  E Rr�I�Hr N   E Rss n   E Qtut 4   J Q�Gv
�G 
cobjv o   K P�F�F 0 idx  u o   E J�E�E 0 sublist  �I  �H  �J  L w�Dw r   j {xyx n  j tz{z I   o t�C|�B�C 0 makekey makeKey| }�A} o   o p�@�@ 0 subitem subItem�A  �B  { o   j o�?�? $0 comparatorobject comparatorObjecty n      ~~  ;   y z o   t y�>�> 
0 _keys_  �D  > ?    ��� o    �=�= "0 comparatorindex comparatorIndex� n    
��� 1    
�<
�< 
leng� n   ��� o    �;�; 
0 _keys_  �  f    < ��:� L   � ��� n   � ���� 4   � ��9�
�9 
cobj� o   � ��8�8 "0 comparatorindex comparatorIndex� n  � ���� o   � ��7�7 
0 _keys_  �  f   � ��:  �j  * g a lazily converts a single sublist's items into comparable keys, caching them for subsequent reuse   + ��� �   l a z i l y   c o n v e r t s   a   s i n g l e   s u b l i s t ' s   i t e m s   i n t o   c o m p a r a b l e   k e y s ,   c a c h i n g   t h e m   f o r   s u b s e q u e n t   r e u s e# ��� l     �6�5�4�6  �5  �4  � ��3� i   ��� I      �2��1�2 0 comparekeys compareKeys� ��� o      �0�0 0 leftkeyobject leftKeyObject� ��/� o      �.�.  0 rightkeyobject rightKeyObject�/  �1  � k     B�� ��� Y     ?��-���,� k    :�� ��� r    -��� n   +��� I    +�+��*�+ 0 comparekeys compareKeys� ��� n   !��� I    !�)��(�) 0 getkey getKey� ��'� o    �&�& 0 i  �'  �(  � o    �%�% 0 leftkeyobject leftKeyObject� ��$� n  ! '��� I   " '�#��"�# 0 getkey getKey� ��!� o   " #� �  0 i  �!  �"  � o   ! "��  0 rightkeyobject rightKeyObject�$  �*  � l   ���� n   ��� o    ��  0 itemcomparator itemComparator� n   ��� 4    ��
� 
cobj� o    �� 0 i  � o    �� "0 itemcomparators itemComparators�  �  � o      �� $0 comparisonresult comparisonResult� ��� Z  . :����� >   . 1��� o   . /�� $0 comparisonresult comparisonResult� m   / 0��  � L   4 6�� o   4 5�� $0 comparisonresult comparisonResult�  �  �  �- 0 i  � m    �� � n   ��� 1   	 �
� 
leng� o    	�� "0 itemcomparators itemComparators�,  � ��� l  @ B���� L   @ B�� m   @ A��  �   both lists are identical   � ��� 2   b o t h   l i s t s   a r e   i d e n t i c a l�  �3   9 3 compares sublists of same length and variable type     ��� f   c o m p a r e s   s u b l i s t s   o f   s a m e   l e n g t h   a n d   v a r i a b l e   t y p e ��� L  "$�� o  "#�� *0 mixedlistcomparator MixedListComparator�  �I  � R      �
��
�
 .ascrerr ****      � ****� o      �	�	 0 etext eText� ���
� 
errn� o      �� 0 enumber eNumber� ���
� 
erob� o      �� 0 efrom eFrom� ���
� 
errt� o      �� 
0 eto eTo�  � I  ,:��� � 
0 _error  � ��� m  -0�� ���  l i s t   c o m p a r a t o r� ��� o  01���� 0 etext eText� ��� o  12���� 0 enumber eNumber� ��� o  23���� 0 efrom eFrom� ���� o  34���� 
0 eto eTo��  �   � ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� i  f i��� I     �����
�� .Lst:ReSonull��� ��� null��  � �����
�� 
Comp� |����������  ��  � o      ���� $0 comparatorobject comparatorObject��  � l     ������ m      ��
�� 
msng��  ��  ��  � Q     :���� k    (�� ��� Z     ������ =   ��� o    ���� $0 comparatorobject comparatorObject� m    ��
�� 
msng� r   	 ��� I  	 ������
�� .Lst:DeSonull��� ��� null��  ��  � o      ���� $0 comparatorobject comparatorObject��  � r     ��� n   ��� I    ������� &0 asscriptparameter asScriptParameter� ��� o    ���� $0 comparatorobject comparatorObject� ���� m    �� ���  f o r��  ��  � o    ���� 0 _support  � o      ���� $0 comparatorobject comparatorObject� ���� h   ! (����� &0 reversecomparator ReverseComparator� k          j     ��
�� 
pare o     ���� $0 comparatorobject comparatorObject �� i  	  I      ������ 0 comparekeys compareKeys 	 o      ���� 0 leftkey leftKey	 
��
 o      ���� 0 rightkey rightKey��  ��   l     L      d     
 l    	���� M     	 I      ������ 0 comparekeys compareKeys  o    ���� 0 leftkey leftKey �� o    ���� 0 rightkey rightKey��  ��  ��  ��   4 . flip negative flag to positive and vice-versa    � \   f l i p   n e g a t i v e   f l a g   t o   p o s i t i v e   a n d   v i c e - v e r s a��  ��  � R      ��
�� .ascrerr ****      � **** o      ���� 0 etext eText ��
�� 
errn o      ���� 0 enumber eNumber ��
�� 
erob o      ���� 0 efrom eFrom ����
�� 
errt o      ���� 
0 eto eTo��  � I   0 :������ 
0 _error     m   1 2!! �"" $ r e v e r s e   c o m p a r a t o r  #$# o   2 3���� 0 etext eText$ %&% o   3 4���� 0 enumber eNumber& '(' o   4 5���� 0 efrom eFrom( )��) o   5 6���� 
0 eto eTo��  ��  � *+* l     ��������  ��  ��  + ,-, l     ��������  ��  ��  - .��. l     ��������  ��  ��  ��       ��/0123456789:;<=>��?@ABCDEF��  / ������������������������������������������������
�� 
pimr�� 0 _support  �� 
0 _error  �� 20 _errorwithpartialresult _errorWithPartialResult�� "0 _makelistobject _makeListObject
�� .Lst:Instnull���     ****
�� .Lst:Delenull���     ****
�� .Lst:RDuLnull���     ****
�� .Lst:SliLnull���     ****
�� .Lst:Trannull���     ****
�� .Lst:LiUSnull���     ****
�� .Lst:Findnull���     ****
�� .Lst:Map_null���     ****
�� .Lst:Filtnull���     ****
�� .Lst:Redunull���     ****�� *0 _quicksortthreshold _quicksortThreshold�� 	0 _sort  
�� .Lst:Sortnull���     ****
�� .Lst:DeSonull��� ��� null
�� .Lst:NuSonull��� ��� null
�� .Lst:DaSonull��� ��� null
�� .Lst:TeSonull��� ��� null
�� .Lst:LiSonull��� ��� null
�� .Lst:ReSonull��� ��� null0 ��G�� G  HH ��I��
�� 
cobjI JJ   ��
�� 
osax��  1 KK   �� %
�� 
scpt2 �� -����LM��� 
0 _error  �� �N� N  ������ 0 handlername handlerName� 0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eTo��  L ������ 0 handlername handlerName� 0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eToM ���
� 
msng� � 20 _errorwithpartialresult _errorWithPartialResult� *�������+ 3 � I��~OP�}� 20 _errorwithpartialresult _errorWithPartialResult� �|Q�| Q  �{�z�y�x�w�v�{ 0 handlername handlerName�z 0 etext eText�y 0 enumber eNumber�x 0 efrom eFrom�w 
0 eto eTo�v 0 epartial ePartial�~  O �u�t�s�r�q�p�u 0 handlername handlerName�t 0 etext eText�s 0 enumber eNumber�r 0 efrom eFrom�q 
0 eto eTo�p 0 epartial ePartialP  [�o�n�m
�o 
msng�n �m 0 rethrowerror rethrowError�} b  ࠡ�����+ 4 �l x�k�jRS�i�l "0 _makelistobject _makeListObject�k �hT�h T  �g�f�g 0 len  �f 0 padvalue padValue�j  R �e�d�c�e 0 len  �d 0 padvalue padValue�c 0 
listobject 
listObjectS �b �U�a�`�_�^�b 0 
listobject 
listObjectU �]V�\�[WX�Z
�] .ascrinit****      � ****V k     YY  ��Y�Y  �\  �[  W �X�X 
0 _list_  X �W�W 
0 _list_  �Z jv��a �` 
0 _list_  
�_ 
leng
�^ 
cobj�i `��K S�O�j L�����v��,FO h��,�,���,��,%��,F[OY��O��,�,� ��,[�\[Zk\Z�2��,FY hY hO��,E5 �V ��U�TZ[�S
�V .Lst:Instnull���     ****�U 0 thelist theList�T �R�Q\
�R 
Valu�Q 0 thevalue theValue\ �P]^
�P 
Befo] {�O�N�M�O 0 beforeindex beforeIndex�N  
�M 
msng^ �L_`
�L 
Afte_ {�K�J�I�K 0 
afterindex 
afterIndex�J  
�I 
msng` �Ha�G
�H 
Conca {�F�E�D�F 0 isjoin isJoin�E  
�D boovfals�G  Z 
�C�B�A�@�?�>�=�<�;�:�C 0 thelist theList�B 0 thevalue theValue�A 0 beforeindex beforeIndex�@ 0 
afterindex 
afterIndex�? 0 isjoin isJoin�> 0 
listobject 
listObject�= 0 etext eText�< 0 enumber eNumber�; 0 efrom eFrom�: 
0 eto eTo[ �9 �b�8�7�6�5�4�3�2#0�1<�0�/�.�-�,i�+��*c�)�(�9 0 
listobject 
listObjectb �'d�&�%ef�$
�' .ascrinit****      � ****d k     gg  ��#�#  �&  �%  e �"�" 
0 _list_  f  ��!� �! "0 aslistparameter asListParameter�  
0 _list_  �$ b  b   �l+ �
�8 
kocl
�7 
list
�6 .corecnte****       ****
�5 
bool
�4 
msng
�3 
errn�2�Y�1 (0 asintegerparameter asIntegerParameter�0 (0 asbooleanparameter asBooleanParameter�/ 
0 _list_  
�. 
leng
�- 
cobj
�, 
insl�+ 80 throwinvalidparameterindex throwInvalidParameterIndex�* 0 etext eTextc ��h
� 
errn� 0 enumber eNumberh ��i
� 
erob� 0 efrom eFromi ���
� 
errt� 
0 eto eTo�  �) �( 
0 _error  �S}h��K S�O�
 �kv��l j �& 
�kvE�Y hO�� t�� )��l�Y hOb  ��l+ E�Ob  ��l+ E�O�j ��,a ,�kE�Y hO���,a , b  ��,Ea �/a 4a l+ Y hY }�� sb  �a l+ E�O�j 
�kE�Y �j ��,a ,�E�Y ��,a ,E�O���,a ,
 �j�& b  ��,Ea �/a 3a l+ Y hY ��%O�j  ���,%Y ;���,a ,  ��,�%Y &��,[a \[Zk\Z�2�%��,[a \[Z�k\Zi2%W X  *a ����a + 6 ���jk�
� .Lst:Delenull���     ****� 0 thelist theList� �lm
� 
Indxl {���� 0 theindex theIndex�  ���m �no
� 
FIdxn {���� 0 
startindex 
startIndex�  
� 
msngo �p�
� 
TIdxp {�
�	��
 0 endindex endIndex�	  
� 
msng�  j �������� ��������� 0 thelist theList� 0 theindex theIndex� 0 
startindex 
startIndex� 0 endindex endIndex� 0 
listobject 
listObject� 0 
listlength 
listLength� 0 	startlist 	startList�  0 endlist endList�� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eTok ��/q������O��_��w���������rL������ 0 
listobject 
listObjectq ��s����tu��
�� .ascrinit****      � ****s k     vv /����  ��  ��  t ���� 
0 _list_  u 7������ "0 aslistparameter asListParameter�� 
0 _list_  �� b  b   �l+ ��� 
0 _list_  
�� 
leng
�� 
msng�� (0 asintegerparameter asIntegerParameter
�� 
bool
�� 
cobj�� 80 throwinvalidparameterindex throwInvalidParameterIndex�� 0 etext eTextr ����w
�� 
errn�� 0 enumber eNumberw ����x
�� 
erob�� 0 efrom eFromx ������
�� 
errt�� 
0 eto eTo��  �� �� 
0 _error  �����K S�O��,�,E�O�� b  ��l+ E�Y hO�� b  ��l+ E�Y hO�� 	 �� �& Mb  ��l+ E�O�j �k�E�Y hO�j 
 ���& b  ��,E�/�l+ Y hO�E�Y ���  kE�Y ��  �E�Y hO�j �k�E�Y hO�j �k�E�Y hO�j 
 ���& b  ��,E�/�l+ Y &�j 
 ���& b  ��,E�/�l+ Y hO�� ��,�-EY hO�k  �� 
 �� �& jvY hOjvE�Y ��,[�\[Zk\Z�k2E�O��  	jvE�Y ��,[�\[Z�k\Zi2E�O��%W X  *a ����a + 7 ��\����yz��
�� .Lst:RDuLnull���     ****�� 0 thelist theList��  y 	�������������������� 0 thelist theList�� 0 
listobject 
listObject�� 0 i  �� 0 u  �� 0 
listlength 
listLength�� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eToz ��d{��������|������� 0 
listobject 
listObject{ ��}����~��
�� .ascrinit****      � ****} k     �� d����  ��  ��  ~ ���� 
0 _list_   n�������� "0 aslistparameter asListParameter
�� 
cobj�� 
0 _list_  �� b  b   �l+ �-E��� 
0 _list_  
�� 
leng
�� 
cobj�� 0 etext eText| �����
�� 
errn�� 0 enumber eNumber� �����
�� 
erob�� 0 efrom eFrom� ����
�� 
errt� 
0 eto eTo�  �� �� 
0 _error  �� � ���K S�Olk��,�,mvE[�k/E�Z[�l/E�Z[�m/E�ZO�j  jvY hO eh�� >h��,[�\[Zk\Z�2��,�/kv�kE�O�� ��,[�\[Zk\Z�2EY h[OY��O�kE�O��,�/��,�/FO�kE�[OY��O��,[�\[Zk\Z�2EW X  *襦���+ 
8 �������
� .Lst:SliLnull���     ****� 0 thelist theList� ���
� 
FIdx� {���� 0 
startindex 
startIndex�  
� 
msng� ���
� 
TIdx� {���� 0 endindex endIndex�  
� 
msng�  � ��������� 0 thelist theList� 0 
startindex 
startIndex� 0 endindex endIndex� 0 	thelength 	theLength� 0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eTo� ���,�?����bv������� "0 aslistparameter asListParameter
� 
leng
� 
msng� (0 asintegerparameter asIntegerParameter� 80 throwinvalidparameterindex throwInvalidParameterIndex
� 
cobj
� 
errn��[
� 
bool� 0 etext eText� ���
� 
errn� 0 enumber eNumber� ���
� 
erob� 0 efrom eFrom� ���
� 
errt� 
0 eto eTo�  � � 
0 _error  ��}b  ��l+ E�O��,E�O�� [b  ��l+ E�O�j  b  ��l+ Y hO��  -��' 
��-EY �� jvY �[�\[Z�\Zi2EY hY ��  )��l�Y hO�� [b  ��l+ E�O�j  b  ��l+ Y hO��  -��' jvY �� 
��-EY �[�\[Zk\Z�2EY hY hO�j �k�E�Y hO�j �k�E�Y hO��
 �k	 �k�&�&
 ��	 ���&�& jvY hO�k kE�Y �� �E�Y hO�k kE�Y �� �E�Y hO�[�\[Z�\Z�2EW X  *a ����a + 9 ������
� .Lst:Trannull���     ****� 0 thelist theList� ���
� 
Whil� {���� 0 unevenoption unevenOption�  
� LTrhLTrR� ���
� 
PadI� {���� 0 padvalue padValue�  
� 
msng�  � �����������~�}�|�{� 0 thelist theList� 0 unevenoption unevenOption� 0 padvalue padValue� 0 
listobject 
listObject� $0 resultlistlength resultListLength� 0 aref aRef� *0 resultsublistlength resultSubListLength� 0 resultsublist resultSubList� 0 i  � 0 j  �~ 0 etext eText�} 0 enumber eNumber�| 0 efrom eFrom�{ 
0 eto eTo� �z�y�x�wIN�v�u�tR��s�r�q�p���o�n��m�l�k�j�?�i�h
�z 
kocl
�y 
list
�x .corecnte****       ****
�w 
bool�v �u .0 throwinvalidparameter throwInvalidParameter�t 0 
listobject 
listObject� �g��f�e���d
�g .ascrinit****      � ****� k     
�� T�� W�c�c  �f  �e  � �b�a�b 
0 _list_  �a 0 _resultlist_ _resultList_� �`�_�` 
0 _list_  �_ 0 _resultlist_ _resultList_�d b   �Ojv��s 
0 _list_  
�r 
cobj
�q 
leng
�p LTrhLTrR
�o LTrhLTrP
�n LTrhLTrT�m >0 throwinvalidconstantparameter throwInvalidConstantParameter�l "0 _makelistobject _makeListObject�k 0 _resultlist_ _resultList_�j 0 etext eText� �^�]�
�^ 
errn�] 0 enumber eNumber� �\�[�
�\ 
erob�[ 0 efrom eFrom� �Z�Y�X
�Z 
errt�Y 
0 eto eTo�X  �i �h 
0 _error  ��ɠjv  jvY hO�kv��l j 
 ���l �j �& b  �����+ Y hO��K 
S�O��,�k/�,E�O��  7 1��,[��l kh ��,� b  ���a �+ Y h[OY��Y u�a   - '��,[��l kh ��,� 
��,E�Y h[OY��Y B�a   - '��,[��l kh ��,� 
��,E�Y h[OY��Y b  �a l+ O�j ���,�,E�O*��l+ E�O��a ,6FO l�kh ��-E�a ,6F[OY��O�a   @ :k�kh  +k��,�/�,Ekh 	��,�/�/�a ,�/�/F[OY��[OY��Y 5 2k�kh  #k�kh 	��,�/�/�a ,�/�/F[OY��[OY��Y hO�a ,EW X  *a ����a + : �WO�V�U���T
�W .Lst:LiUSnull���     ****�V 0 thelist theList�U  � 	�S�R�Q�P�O�N�M�L�K�S 0 thelist theList�R $0 resultlistobject resultListObject�Q 0 len  �P 0 idx1  �O 0 idx2  �N 0 etext eText�M 0 enumber eNumber�L 0 efrom eFrom�K 
0 eto eTo� �JW��I�H�G�F�E�D�C�B�A���@�?�J $0 resultlistobject resultListObject� �>��=�<���;
�> .ascrinit****      � ****� k     �� W�:�:  �=  �<  � �9�9 
0 _list_  � a�8�7�6�8 "0 aslistparameter asListParameter
�7 
cobj�6 
0 _list_  �; b  b   �l+ �-E��I 
0 _list_  
�H 
leng
�G misccura
�F 
from
�E 
to  �D 
�C .sysorandnmbr    ��� nmbr
�B 
cobj�A 0 etext eText� �5�4�
�5 
errn�4 0 enumber eNumber� �3�2�
�3 
erob�2 0 efrom eFrom� �1�0�/
�1 
errt�0 
0 eto eTo�/  �@ �? 
0 _error  �T u d��K S�O��,�,E�O Hk�kh � *�k�� 	UE�O��,�/E��,�/ElvE[�k/��,�/FZ[�l/��,�/FZ[OY��O��,EW X  *������+ ; �.��-�,���+
�. .Lst:Findnull���     ****�- 0 thelist theList�, �*��
�* 
Valu� {�)�(�'�) 0 theitem theItem�(  
�' 
msng� �&��
�& 
Usin� {�%�$�#�% 0 filterobject filterObject�$  
�# 
msng� �"��!
�" 
Retu� {� ���  (0 findingoccurrences findingOccurrences�  
� LFWhLFWA�!  � 
����������� 0 thelist theList� 0 theitem theItem� 0 filterobject filterObject� (0 findingoccurrences findingOccurrences� 0 
listobject 
listObject� 0 i  � 0 etext eText� 0 enumber eNumber� 0 efrom eFrom� 
0 eto eTo� ������������
d�	��������� 0 
listobject 
listObject� �������
� .ascrinit****      � ****� k     �� ��� �� �   �  �  � ������ 
0 _list_  �� 0 _result_  � ��������� "0 aslistparameter asListParameter�� 
0 _list_  �� 0 _result_  � b  b   �l+ �Ojv�
� LFWhLFWA
� 
msng� 
0 _list_  
� 
leng
� 
cobj� 0 _result_  � &0 asscriptparameter asScriptParameter� 0 
filteritem 
filterItem
�
 LFWhLFWF
�	 LFWhLFWL� >0 throwinvalidconstantparameter throwInvalidConstantParameter� 0 etext eText� �����
�� 
errn�� 0 enumber eNumber� �����
�� 
erob�� 0 efrom eFrom� ������
�� 
errt�� 
0 eto eTo��  � � 
0 _error  �+����K S�O��  q��  . (k��,�,Ekh ��,�/�  ���,6FY h[OY��Y <b  ��l+ 
E�O +k��,�,Ekh ���,�/k+  ���,6FY h[OY��Y��  u��  0 *k��,�,Ekh ��,�/�  ���,6FOY h[OY��Y >b  ��l+ 
E�O -k��,�,Ekh ���,�/k+  ���,6FOY h[OY��Y ���  u��  0 *��,�,Ekih ��,�/�  ���,6FOY h[OY��Y >b  ��l+ 
E�O -��,�,Ekih ���,�/k+  ���,6FOY h[OY��Y b  �a l+ O��,EW X  *a ����a + < ����������
�� .Lst:Map_null���     ****�� 0 thelist theList�� ������
�� 
Usin�� 0 	mapobject 	mapObject��  � 	�������������������� 0 thelist theList�� 0 	mapobject 	mapObject�� $0 resultlistobject resultListObject�� 0 i  �� 0 etext eText�� 0 enumber eNumber�� 
0 eto eTo�� 0 epartial ePartial�� 0 efrom eFrom� ���,��������������������������qs�������� $0 resultlistobject resultListObject� �����������
�� .ascrinit****      � ****� k     �� ����  ��  ��  � ���� 
0 _list_  �  �������� "0 aslistparameter asListParameter
�� 
cobj�� 
0 _list_  �� b  b   �l+ �-E��� &0 asscriptparameter asScriptParameter�� 
0 _list_  
�� 
leng
�� 
cobj�� 0 mapitem mapItem�� 0 etext eText� �����
�� 
errn�� 0 enumber eNumber� ������
�� 
errt�� 
0 eto eTo��  
�� 
errn
�� 
erob�� "0 aslistparameter asListParameter
�� 
errt
�� 
ptlr�� � �����
�� 
errn�� 0 enumber eNumber� �����
�� 
erob�� 0 efrom eFrom� �����
�� 
errt�� 
0 eto eTo� ����
�� 
ptlr� 0 epartial ePartial�  �� �� 20 _errorwithpartialresult _errorWithPartialResult�� � ���K S�Ob  ��l+ E�O + %k��,�,Ekh ���,�/k+ ��,�/F[OY��W NX 	 
�k ��,[�\[Zk\Z�k2E�Y jvE�O)��b  ��l+ �/�a �a a �%a %�%O��,EW X 	 *a �����a + = �������
� .Lst:Filtnull���     ****� 0 thelist theList� ���
� 
Usin� 0 filterobject filterObject�  � ������������ 0 thelist theList� 0 filterobject filterObject� $0 resultlistobject resultListObject� 0 	lastindex 	lastIndex� 0 i  � 0 theitem theItem� 0 etext eText� 0 enumber eNumber� 
0 eto eTo� 0 epartial ePartial� 0 efrom eFrom� �������������	5����	!	#�	U��� $0 resultlistobject resultListObject� �������
� .ascrinit****      � ****� k     �� ���  �  �  � �� 
0 _list_  � ����� "0 aslistparameter asListParameter
� 
cobj� 
0 _list_  � b  b   �l+ �-E�� &0 asscriptparameter asScriptParameter� 
0 _list_  
� 
leng
� 
cobj� 0 
filteritem 
filterItem� 0 etext eText� ���
� 
errn� 0 enumber eNumber� ���
� 
errt� 
0 eto eTo�  
� 
errn
� 
erob� "0 aslistparameter asListParameter
� 
errt
� 
ptlr� � ���
� 
errn� 0 enumber eNumber� ���
� 
erob� 0 efrom eFrom� ���
� 
errt� 
0 eto eTo� ���
� 
ptlr� 0 epartial ePartial�  � � 20 _errorwithpartialresult _errorWithPartialResult� � ���K S�Ob  ��l+ E�OjE�O = 7k��,�,Ekh ��,�/E�O��k+  �kE�O���,�/FY h[OY��W NX 	 
�k ��,[�\[Zk\Z�k2E�Y jvE�O)��b  ��l+ �/�a �a a �%a %�%O�j  jvY hO��,[�\[Zk\Z�2EW X 	 *a �����a + > �	g�����
� .Lst:Redunull���     ****� 0 thelist theList� ���
� 
Usin� 0 reduceobject reduceObject�  � 	�~�}�|�{�z�y�x�w�v�~ 0 thelist theList�} 0 reduceobject reduceObject�| 0 	theresult 	theResult�{ 0 
listobject 
listObject�z 0 i  �y 0 etext eText�x 0 enumber eNumber�w 
0 eto eTo�v 0 efrom eFrom� �u�t	w��s�r	��q	��p�o	��n�m�l�k��j�i	��h�g�f	�	��	��e
�u 
msng�t 0 
listobject 
listObject� �d��c�b���a
�d .ascrinit****      � ****� k     �� 	w�`�`  �c  �b  � �_�_ 
0 _list_  � 	�^�]�^ "0 aslistparameter asListParameter�] 
0 _list_  �a b  b   �l+ ��s 
0 _list_  
�r 
leng
�q 
list�p �o .0 throwinvalidparameter throwInvalidParameter�n &0 asscriptparameter asScriptParameter
�m 
cobj�l 0 
reduceitem 
reduceItem�k 0 etext eText� �\�[�
�\ 
errn�[ 0 enumber eNumber� �Z�Y�X
�Z 
errt�Y 
0 eto eTo�X  
�j 
errn
�i 
erob�h "0 aslistparameter asListParameter
�g 
errt�f � �W�V�
�W 
errn�V 0 enumber eNumber� �U�T�
�U 
erob�T 0 efrom eFrom� �S�R�Q
�S 
errt�R 
0 eto eTo�Q  �e 20 _errorwithpartialresult _errorWithPartialResult� ��E�O ���K S�O��,�,j  b  �����+ 
Y hOb  ��l+ E�O��,�k/E�O ' !l��,�,Ekh ����,��/l+ E�[OY��W 3X  )a �a b  �a l+ ��/a �a a �%a %�%O�W X  *a �����a + �� ? �P
'�O�N���M�P 	0 _sort  �O �L��L �  �K�J�I�H�G�K $0 resultlistobject resultListObject�J 0 
startindex 
startIndex�I 0 endindex endIndex�H  0 sortcomparator sortComparator�G 0 usequicksort useQuickSort�N  � �F�E�D�C�B�A�@�?�>�=�<�;�:�9�8�7�F $0 resultlistobject resultListObject�E 0 
startindex 
startIndex�D 0 endindex endIndex�C  0 sortcomparator sortComparator�B 0 usequicksort useQuickSort�A 0 	leftindex 	leftIndex�@ 0 
rightindex 
rightIndex�? 0 
pivotvalue 
pivotValue�> 0 etext eText�= 0 enum eNum�< 0 efrom eFrom�; 
0 eto eTo�: 0 i  �9 0 j  �8 0 leftkey leftKey�7 0 rightkey rightKey� �6�5�4�3�2��1�0�/�.
�
��-�,�+�*�
�6 
cobj�5 
0 _keys_  �4 0 comparekeys compareKeys
�3 
nmbr�2 0 etext eText� �)�(�
�) 
errn�( 0 enum eNum� �'�&�
�' 
erob�& 0 efrom eFrom� �%�$�#
�% 
errt�$ 
0 eto eTo�#  
�1 
errn
�0 
erob
�/ 
errt�. �- 
0 _list_  �, �+ 	0 _sort  �*  � �"�!� 
�" 
errn�!�n�   �M�q��k hY hO��lvE[�k/E�Z[�l/E�ZO��,[�\[Z�\Z�2�.E�Oh�� % h���,�/E�l+ �&j�kE�[OY��W X  )���,�/�lv���%O $ h���,�/�l+ �&j�kE�[OY��W X  )���,�/�lv���%O�� p��,�/E��,�/ElvE[�k/��,�/FZ[�l/��,�/FZO��,�/E��,�/ElvE[�k/��,�/FZ[�l/��,�/FZO�k�klvE[�k/E�Z[�l/E�ZY h[OY�O -*������b  �+ O*������b  �+ OhW X  hY hO�kE�O ���kh  ���ih ��,�k/E��,�/ElvE[�k/E�Z[�l/E�ZO���l+ j Y hO��lvE[�k/��,�k/FZ[�l/��,�/FZO��,�/E��,�k/ElvE[�k/��,�k/FZ[�l/��,�/FZ[OY�y[OY�j@ �������
� .Lst:Sortnull���     ****� 0 thelist theList� ���
� 
Comp� {����  0 sortcomparator sortComparator�  
� 
msng�  � �������������
� 0 thelist theList�  0 sortcomparator sortComparator� $0 resultlistobject resultListObject� "0 disorderedcount disorderedCount� 0 previouskey previousKey� 0 etext eText� 0 enum eNum� 
0 eto eTo� 0 i  � 0 
currentkey 
currentKey� 0 efrom eFrom� 0 usequicksort useQuickSort�
 0 enumber eNumber�  �	������9���� �����������h������������'���	 "0 aslistparameter asListParameter� $0 resultlistobject resultListObject� �����������
�� .ascrinit****      � ****� k     �� �� ����  ��  ��  � ������ 
0 _keys_  �� 
0 _list_  � ������
�� 
cobj�� 
0 _keys_  �� 
0 _list_  �� b   �-E�Ob   �-E�� 
0 _list_  
� 
leng
� 
msng
� .Lst:DeSonull��� ��� null� &0 asscriptparameter asScriptParameter� 
0 _keys_  
� 
cobj�  0 makekey makeKey�� 0 etext eText� �����
�� 
errn�� 0 enum eNum� ������
�� 
errt�� 
0 eto eTo��  
�� 
errn
�� 
erob
�� 
errt�� �� 0 comparekeys compareKeys� �����
�� 
errn�� 0 enum eNum� �����
�� 
erob�� 0 efrom eFrom� ������
�� 
errt�� 
0 eto eTo��  
�� 
bool�� �� 	0 _sort  � �����
�� 
errn�� 0 enumber eNumber� �����
�� 
erob�� 0 efrom eFrom� ������
�� 
errt�� 
0 eto eTo��  �� 
0 _error  �vab  ��l+ E�O��K S�O��,�,l 
��,EY hO��  *j E�Y b  ��l+ 
E�OjE�O � ���,�k/Ek+ E�W $X  )a �a ��,E�k/a �a a �%O���,�k/FO ql��,�,Ekh  ���,�/k+ E�W *X  )a �a ��,E�/a �a a �%a %�%O���,�/FO���l+ j 
�kE�Y hO�E�[OY��W X  )a �a �a �a �O�j 5��,�,b  	 ���,�,!a a &E�O*�k��,�,��a + Y hO��,EW X  *a ����a + A ��C��������
�� .Lst:DeSonull��� ��� null��  ��  � ���� &0 defaultcomparator DefaultComparator� ��D��� &0 defaultcomparator DefaultComparator� �����������
�� .ascrinit****      � ****� k     �� F�� O�� R�� �����  ��  ��  � ���������� "0 _supportedtypes _supportedTypes�� 	0 _type  �� 0 makekey makeKey�� 0 comparekeys compareKeys� ��������������
�� 
nmbr
�� 
ctxt
�� 
ldt �� "0 _supportedtypes _supportedTypes
�� 
msng�� 	0 _type  � ��U���������� 0 makekey makeKey�� ��� �  �� 0 anobject anObject��  � ��� 0 anobject anObject� 0 aref aRef� ���������������
� 
msng� "0 _supportedtypes _supportedTypes
� 
kocl
� 
cobj
� .corecnte****       ****
� 
pcnt
� 
errn��\
� 
erob� 
� 
pcls�� ~b  �  F 7)�,[��l kh �kv��,El j ��,Ec  O�Y h[OY��O)�����Y .�kv�b  l j  )�����b  %�%��,%�%Y hO�� ���� �� 0 comparekeys compareKeys� ��   ��� 0 
leftobject 
leftObject� 0 rightobject rightObject�    ��� 0 
leftobject 
leftObject� 0 rightobject rightObject  � �� iY �� kY j�� ���mv�O�OL OL �� ��K S�B �����
� .Lst:NuSonull��� ��� null�  �   �� &0 numericcomparator NumericComparator ��� &0 numericcomparator NumericComparator ����
� .ascrinit****      � **** k     		 �

 ���  �  �   ��� 0 makekey makeKey� 0 comparekeys compareKeys  ������ 0 makekey makeKey� ��   �� 0 anobject anObject�   �� 0 anobject anObject �
� 
nmbr� ��& ������ 0 comparekeys compareKeys� ��   ��� 0 
leftobject 
leftObject� 0 rightobject rightObject�   ��� 0 
leftobject 
leftObject� 0 rightobject rightObject  � ��� L  OL � ��K S�C �����
� .Lst:DaSonull��� ��� null�  �   ��  0 datecomparator DateComparator ���  0 datecomparator DateComparator ����
� .ascrinit****      � **** k      � ���  �  �   �~�}�~ 0 makekey makeKey�} 0 comparekeys compareKeys  �|��{�z�y�| 0 makekey makeKey�{ �x�x   �w�w 0 anobject anObject�z   �v�v 0 anobject anObject �u
�u 
ldt �y ��& �t��s�r !�q�t 0 comparekeys compareKeys�s �p"�p "  �o�n�o 0 
leftobject 
leftObject�n 0 rightobject rightObject�r    �m�l�m 0 
leftobject 
leftObject�l 0 rightobject rightObject!  �q ��� L  OL � ��K S�D �k�j�i#$�h
�k .Lst:TeSonull��� ��� null�j  �i �g%�f
�g 
Cons% {�e�d�c�e  0 orderingoption orderingOption�d  
�c SrtESrtI�f  # �b�a�`�_�^�]�\�[�b  0 orderingoption orderingOption�a B0 currentconsiderationscomparator CurrentConsiderationsComparator�` >0 caseinsensitivetextcomparator CaseInsensitiveTextComparator�_ 40 exactmatchtextcomparator ExactMatchTextComparator�^ 0 etext eText�] 0 enumber eNumber�\ 0 efrom eFrom�[ 
0 eto eTo$ �Z&�Y�XA'�W�Ve(�U��T�S)��R�Q�Z B0 currentconsiderationscomparator CurrentConsiderationsComparator& �P*�O�N+,�M
�P .ascrinit****      � ***** k     -- .. "�L�L  �O  �N  + �K�J�K 0 makekey makeKey�J 0 comparekeys compareKeys, /0/ �I�H�G12�F�I 0 makekey makeKey�H �E3�E 3  �D�D 0 anobject anObject�G  1 �C�C 0 anobject anObject2 �B
�B 
ctxt�F ��&0 �A$�@�?45�>�A 0 comparekeys compareKeys�@ �=6�= 6  �<�;�< 0 
leftobject 
leftObject�; 0 rightobject rightObject�?  4 �:�9�: 0 
leftobject 
leftObject�9 0 rightobject rightObject5  �> �� iY �� kY j�M L  OL 
�Y SrtESrtI�X >0 caseinsensitivetextcomparator CaseInsensitiveTextComparator' �87�7�689�5
�8 .ascrinit****      � ****7 k     :: C;; F�4�4  �7  �6  8 �3�2
�3 
pare�2 0 comparekeys compareKeys9 �1<
�1 
pare< �0H�/�.=>�-�0 0 comparekeys compareKeys�/ �,?�, ?  �+�*�+ 0 
leftobject 
leftObject�* 0 rightobject rightObject�.  = �)�(�) 0 
leftobject 
leftObject�( 0 rightobject rightObject> NO�'�' 0 comparekeys compareKeys�- �� )��ld*J V�5 b  N  OL 
�W SrtESrtM�V 40 exactmatchtextcomparator ExactMatchTextComparator( �&@�%�$AB�#
�& .ascrinit****      � ****@ k     CC gDD j�"�"  �%  �$  A �!� 
�! 
pare�  0 comparekeys compareKeysB �E
� 
pareE �l��FG�� 0 comparekeys compareKeys� �H� H  ��� 0 
leftobject 
leftObject� 0 rightobject rightObject�  F ��� 0 
leftobject 
leftObject� 0 rightobject rightObjectG rs�� 0 comparekeys compareKeys� �� )��ld*J V�# b  N  OL 
�U SrtESrtD�T >0 throwinvalidconstantparameter throwInvalidConstantParameter�S 0 etext eText) ��I
� 
errn� 0 enumber eNumberI ��J
� 
erob� 0 efrom eFromJ ���
� 
errt� 
0 eto eTo�  �R �Q 
0 _error  �h ^ I��K S�O��  ��K S�O�Y +��  ��K 
S�O�Y ��  �Y b  ��l+ W X  *a ����a + E ����KL�

� .Lst:LiSonull��� ��� null�  � �	M�
�	 
CompM {���� "0 itemcomparators itemComparators�  
� 
msng�  K ����� ��������������� "0 itemcomparators itemComparators� $0 comparatorobject comparatorObject� .0 uniformlistcomparator UniformListComparator� 0 aref aRef�  0 emsg eMsg�� 0 enum eNum�� 0 idx  �� *0 mixedlistcomparator MixedListComparator�� 0 etext eText�� 0 enumber eNumber�� 0 efrom eFrom�� 
0 eto eToL $����������������N��������������O����������������P��Q�����
�� 
msng
�� .Lst:DeSonull��� ��� null
�� 
kocl
�� 
scpt
�� .corecnte****       ****�� &0 asscriptparameter asScriptParameter�� .0 uniformlistcomparator UniformListComparatorN ��R����ST��
�� .ascrinit****      � ****R k     UU �VV ����  ��  ��  S ������ 0 makekey makeKey�� 0 comparekeys compareKeysT WXW �������YZ���� 0 makekey makeKey�� ��[�� [  ���� 0 sublist  ��  Y ������ 0 sublist  �� 0 	keyobject 	KeyObjectZ ���\�� 0 	keyobject 	KeyObject\ ��]����^_��
�� .ascrinit****      � ****] k     `` �aa �bb �����  ��  ��  ^ �������� 
0 _list_  �� 
0 _keys_  �� 0 getkey getKey_ ����c�� 
0 _list_  �� 
0 _keys_  c �������de���� 0 getkey getKey�� ��f�� f  ���� 0 	itemindex 	itemIndex��  d ���� 0 	itemindex 	itemIndexe ������ 
0 _keys_  
� 
leng� 
0 _list_  
� 
cobj� 0 makekey makeKey�� 1 &h�)�,�,b  )�,�/k+ b  6F[OY��O)�,�/E�� b   �Ojv�OL �� ��K S�X ���gh�� 0 comparekeys compareKeys� �i� i  ��� 0 leftkeyobject leftKeyObject�  0 rightkeyobject rightKeyObject�  g �������� 0 leftkeyobject leftKeyObject�  0 rightkeyobject rightKeyObject� 0 
leftlength 
leftLength� 0 rightlength rightLength� 0 commonlength commonLength� 0 i  � $0 comparisonresult comparisonResulth ������ 
0 _list_  
� 
leng
� 
cobj� 0 getkey getKey� 0 comparekeys compareKeys� {��,�,��,�,lvE[�k/E�Z[�l/E�ZO�E�O�� �E�Y hO 2k�kh b  ��k+ ��k+ l+ E�O�j �Y h[OY��O�� iY �� kY j�� L  OL 
�� 
reco
�� 
leng
�� 
cobj�� 0 	itemindex 	itemIndex
�� 
long��  0 itemcomparator itemComparator�� 0 emsg eMsgO ���
� 
errn� 0 enum eNum�  ���\���@
�� 
errn
�� 
list�� �� .0 throwinvalidparameter throwInvalidParameter�� *0 mixedlistcomparator MixedListComparatorP �j��kl�
� .ascrinit****      � ****j k     mm "nn ���  �  �  k ��� 0 makekey makeKey� 0 comparekeys compareKeysl opo �%��qr�� 0 makekey makeKey� �s� s  �� 0 sublist  �  q ��� 0 sublist  � 0 	keyobject 	KeyObjectr �(t� 0 	keyobject 	KeyObjectt �u��vw�
� .ascrinit****      � ****u k     xx -yy 0zz 5��  �  �  v �������� 
0 _list_  �� 
0 _keys_  �� 0 getkey getKeyw ����{�� 
0 _list_  �� 
0 _keys_  { ��7����|}���� 0 getkey getKey�� ��~�� ~  ���� "0 comparatorindex comparatorIndex��  | ������ "0 comparatorindex comparatorIndex�� 0 subitem subItem} ��������~�}�|�{�z�y�xd�wim�v�� 
0 _keys_  
�� 
leng
�� 
cobj� 0 	itemindex 	itemIndex�~  0 itemcomparator itemComparator�} 
0 _list_  �|   �u�t�s
�u 
errn�t�@�s  
�{ 
errn�z�@
�y 
erob�x 
�w 
long�v 0 makekey makeKey�� � h�)�,�,b   �/E[�,Ec  Z[�,Ec  ZO )�,�b  /E�W /X  )���b   �b  /��b  �&%�%b   �,%�%Ob  �k+ b  6F[OY��O)�,�/E� b   �Ojv�OL � ��K S�p �r��q�p���o�r 0 comparekeys compareKeys�q �n��n �  �m�l�m 0 leftkeyobject leftKeyObject�l  0 rightkeyobject rightKeyObject�p  � �k�j�i�h�k 0 leftkeyobject leftKeyObject�j  0 rightkeyobject rightKeyObject�i 0 i  �h $0 comparisonresult comparisonResult� �g�f�e�d�c
�g 
leng
�f 
cobj�e  0 itemcomparator itemComparator�d 0 getkey getKey�c 0 comparekeys compareKeys�o C >kb   �,Ekh b   �/�,��k+ ��k+ l+ E�O�j �Y h[OY��Oj� L  OL �� 0 etext eTextQ �b�a�
�b 
errn�a 0 enumber eNumber� �`�_�
�` 
erob�_ 0 efrom eFrom� �^�]�\
�^ 
errt�] 
0 eto eTo�\  �� �� 
0 _error  �
;&��  *j E�Y hO�kv��l k  b  ��l+ E�O��K 	S�O�Y �kv��l k  
�kvE�Y hO���l ��,  b \�[��l kh  ��,�&O��,�&W 9X  a a lv�kv )a �l�Y hOb  �a a a a + [OY��Y S���l ��,  -��-E�O !k��,Ekh ����/a ��/F[OY��Y b  �a �a lva a + Oa a K S�O�W X   *a !����a "+ #F �[��Z�Y���X
�[ .Lst:ReSonull��� ��� null�Z  �Y �W��V
�W 
Comp� {�U�T�S�U $0 comparatorobject comparatorObject�T  
�S 
msng�V  � �R�Q�P�O�N�M�R $0 comparatorobject comparatorObject�Q &0 reversecomparator ReverseComparator�P 0 etext eText�O 0 enumber eNumber�N 0 efrom eFrom�M 
0 eto eTo� �L�K��J�I���H�!�G�F
�L 
msng
�K .Lst:DeSonull��� ��� null�J &0 asscriptparameter asScriptParameter�I &0 reversecomparator ReverseComparator� �E��D�C���B
�E .ascrinit****      � ****� k     �� �� �A�A  �D  �C  � �@�?
�@ 
pare�? 0 comparekeys compareKeys� �>�
�> 
pare� �=�<�;���:�= 0 comparekeys compareKeys�< �9��9 �  �8�7�8 0 leftkey leftKey�7 0 rightkey rightKey�;  � �6�5�6 0 leftkey leftKey�5 0 rightkey rightKey� �4�4 0 comparekeys compareKeys�: )��ld*J  '�B b   N  OL �H 0 etext eText� �3�2�
�3 
errn�2 0 enumber eNumber� �1�0�
�1 
erob�0 0 efrom eFrom� �/�.�-
�/ 
errt�. 
0 eto eTo�-  �G �F 
0 _error  �X ; *��  *j E�Y b  ��l+ E�O��K S�W X  *颣���+ ascr  ��ޭ