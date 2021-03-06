FasdUAS 1.101.10   ��   ��    k             l      ��  ��   
�
�
This script runs "forever" (must be saved as "Stay Open" and "Application"). It checks files headed for the PTV Pipeline, then runs the pipeline
	If the filenames and types match then it moves them from the incoming directory to a working directory and calls the pipeline. 
	If they don't match, then it moves them to the Rejected folder and sends an e-mail notification to let someone know a file was bounced.

The file format required is currently:
	NNNN-filename.dv or NNNN-filename.mov
where:
	NNNN is replaced with a number between 1000 and 999999.
	filename is any name for the file
	".dv" or ".mov" are required file extensions for submissions to Robot

TESTING:
	This script feeds an archive. We don't want test videos to end up in the archive.
	The project number  999999 is reserved for testing.
	If a project is submitted with this number, processing is changed as follows:
		- the output 

This is intended to help protect against obviously-wrong files (such as text files being dropped) and ALSO to help enforce file naming conventions that are vital to the Robot, Archive, and Vimeo Sync processes working correctly.

The script should be saved as an Application with Stay Open and NO Startup Screen... and launched from the login routine for the user Robot.


Incoming files will be watched for in SOURCEFOLDER1 or SOURCEFOLDER2
Incoming files that are accepted will be moved, respectively, to WORKFOLDER1 or WORKFOLDER2

Incoming files that are rejected are moved to REJECTFOLDER
Incoming files that are processed are moved to PROCESSEFOLDER
Incoming files that incur an error while processing are moved to ERRORFOLDER

Incoming files should end with something from the list in SOURCEFILEEXTNS (EXCLUDE the dot when setting SOURCEFILEEXTNS, for example "dv", not ".dv")
Incoming files should have a type identifier that is in the list SOURCEFILETYPES, for example, "MooV" or "dvc!"
When an error occurs, e-mail will be sent to EMAILTO
The number of seconds to delay when waiting to check again for a new file, is LOOPDELAYSEC. Normally this is 30 (seconds). The idle handler is called at this interval
The number of seconds to delay when measuring file sizes to see if a file is growing, is FILESIZEDELAYSEC. Normally this is 20 or more (seconds)
The valid values for the leading number are the range MINIDNUM and MAXIDNUM, inclusive
The minimum file size (also a way to tease out non-video) is set in MINFILESIZE
Error messages are sent to EMAILTO which can contain more than one address - separate multiple addresses with commas

Author: Jim Youll
2009-06-21 JY final revs for the new pipeline
2009-06-29 JY Revised to use an On Idle handler instead of its own loop
2009-07-06 JY Added special handling for testing with id number 999999; fixed e-mail error reporting issue
     � 	 	� 
 T h i s   s c r i p t   r u n s   " f o r e v e r "   ( m u s t   b e   s a v e d   a s   " S t a y   O p e n "   a n d   " A p p l i c a t i o n " ) .   I t   c h e c k s   f i l e s   h e a d e d   f o r   t h e   P T V   P i p e l i n e ,   t h e n   r u n s   t h e   p i p e l i n e 
 	 I f   t h e   f i l e n a m e s   a n d   t y p e s   m a t c h   t h e n   i t   m o v e s   t h e m   f r o m   t h e   i n c o m i n g   d i r e c t o r y   t o   a   w o r k i n g   d i r e c t o r y   a n d   c a l l s   t h e   p i p e l i n e .   
 	 I f   t h e y   d o n ' t   m a t c h ,   t h e n   i t   m o v e s   t h e m   t o   t h e   R e j e c t e d   f o l d e r   a n d   s e n d s   a n   e - m a i l   n o t i f i c a t i o n   t o   l e t   s o m e o n e   k n o w   a   f i l e   w a s   b o u n c e d . 
 
 T h e   f i l e   f o r m a t   r e q u i r e d   i s   c u r r e n t l y : 
 	 N N N N - f i l e n a m e . d v   o r   N N N N - f i l e n a m e . m o v 
 w h e r e : 
 	 N N N N   i s   r e p l a c e d   w i t h   a   n u m b e r   b e t w e e n   1 0 0 0   a n d   9 9 9 9 9 9 . 
 	 f i l e n a m e   i s   a n y   n a m e   f o r   t h e   f i l e 
 	 " . d v "   o r   " . m o v "   a r e   r e q u i r e d   f i l e   e x t e n s i o n s   f o r   s u b m i s s i o n s   t o   R o b o t 
 
 T E S T I N G : 
 	 T h i s   s c r i p t   f e e d s   a n   a r c h i v e .   W e   d o n ' t   w a n t   t e s t   v i d e o s   t o   e n d   u p   i n   t h e   a r c h i v e . 
 	 T h e   p r o j e c t   n u m b e r     9 9 9 9 9 9   i s   r e s e r v e d   f o r   t e s t i n g . 
 	 I f   a   p r o j e c t   i s   s u b m i t t e d   w i t h   t h i s   n u m b e r ,   p r o c e s s i n g   i s   c h a n g e d   a s   f o l l o w s : 
 	 	 -   t h e   o u t p u t   
 
 T h i s   i s   i n t e n d e d   t o   h e l p   p r o t e c t   a g a i n s t   o b v i o u s l y - w r o n g   f i l e s   ( s u c h   a s   t e x t   f i l e s   b e i n g   d r o p p e d )   a n d   A L S O   t o   h e l p   e n f o r c e   f i l e   n a m i n g   c o n v e n t i o n s   t h a t   a r e   v i t a l   t o   t h e   R o b o t ,   A r c h i v e ,   a n d   V i m e o   S y n c   p r o c e s s e s   w o r k i n g   c o r r e c t l y . 
 
 T h e   s c r i p t   s h o u l d   b e   s a v e d   a s   a n   A p p l i c a t i o n   w i t h   S t a y   O p e n   a n d   N O   S t a r t u p   S c r e e n . . .   a n d   l a u n c h e d   f r o m   t h e   l o g i n   r o u t i n e   f o r   t h e   u s e r   R o b o t . 
 
 
 I n c o m i n g   f i l e s   w i l l   b e   w a t c h e d   f o r   i n   S O U R C E F O L D E R 1   o r   S O U R C E F O L D E R 2 
 I n c o m i n g   f i l e s   t h a t   a r e   a c c e p t e d   w i l l   b e   m o v e d ,   r e s p e c t i v e l y ,   t o   W O R K F O L D E R 1   o r   W O R K F O L D E R 2 
 
 I n c o m i n g   f i l e s   t h a t   a r e   r e j e c t e d   a r e   m o v e d   t o   R E J E C T F O L D E R 
 I n c o m i n g   f i l e s   t h a t   a r e   p r o c e s s e d   a r e   m o v e d   t o   P R O C E S S E F O L D E R 
 I n c o m i n g   f i l e s   t h a t   i n c u r   a n   e r r o r   w h i l e   p r o c e s s i n g   a r e   m o v e d   t o   E R R O R F O L D E R 
 
 I n c o m i n g   f i l e s   s h o u l d   e n d   w i t h   s o m e t h i n g   f r o m   t h e   l i s t   i n   S O U R C E F I L E E X T N S   ( E X C L U D E   t h e   d o t   w h e n   s e t t i n g   S O U R C E F I L E E X T N S ,   f o r   e x a m p l e   " d v " ,   n o t   " . d v " ) 
 I n c o m i n g   f i l e s   s h o u l d   h a v e   a   t y p e   i d e n t i f i e r   t h a t   i s   i n   t h e   l i s t   S O U R C E F I L E T Y P E S ,   f o r   e x a m p l e ,   " M o o V "   o r   " d v c ! " 
 W h e n   a n   e r r o r   o c c u r s ,   e - m a i l   w i l l   b e   s e n t   t o   E M A I L T O 
 T h e   n u m b e r   o f   s e c o n d s   t o   d e l a y   w h e n   w a i t i n g   t o   c h e c k   a g a i n   f o r   a   n e w   f i l e ,   i s   L O O P D E L A Y S E C .   N o r m a l l y   t h i s   i s   3 0   ( s e c o n d s ) .   T h e   i d l e   h a n d l e r   i s   c a l l e d   a t   t h i s   i n t e r v a l 
 T h e   n u m b e r   o f   s e c o n d s   t o   d e l a y   w h e n   m e a s u r i n g   f i l e   s i z e s   t o   s e e   i f   a   f i l e   i s   g r o w i n g ,   i s   F I L E S I Z E D E L A Y S E C .   N o r m a l l y   t h i s   i s   2 0   o r   m o r e   ( s e c o n d s ) 
 T h e   v a l i d   v a l u e s   f o r   t h e   l e a d i n g   n u m b e r   a r e   t h e   r a n g e   M I N I D N U M   a n d   M A X I D N U M ,   i n c l u s i v e 
 T h e   m i n i m u m   f i l e   s i z e   ( a l s o   a   w a y   t o   t e a s e   o u t   n o n - v i d e o )   i s   s e t   i n   M I N F I L E S I Z E 
 E r r o r   m e s s a g e s   a r e   s e n t   t o   E M A I L T O   w h i c h   c a n   c o n t a i n   m o r e   t h a n   o n e   a d d r e s s   -   s e p a r a t e   m u l t i p l e   a d d r e s s e s   w i t h   c o m m a s 
 
 A u t h o r :   J i m   Y o u l l 
 2 0 0 9 - 0 6 - 2 1   J Y   f i n a l   r e v s   f o r   t h e   n e w   p i p e l i n e 
 2 0 0 9 - 0 6 - 2 9   J Y   R e v i s e d   t o   u s e   a n   O n   I d l e   h a n d l e r   i n s t e a d   o f   i t s   o w n   l o o p 
 2 0 0 9 - 0 7 - 0 6   J Y   A d d e d   s p e c i a l   h a n d l i n g   f o r   t e s t i n g   w i t h   i d   n u m b e r   9 9 9 9 9 9 ;   f i x e d   e - m a i l   e r r o r   r e p o r t i n g   i s s u e 
   
  
 l     ��������  ��  ��        p         �� �� 0 sourcefolder1 SOURCEFOLDER1  �� �� 0 sourcefolder2 SOURCEFOLDER2  �� �� 0 workfolder1 WORKFOLDER1  �� �� 0 workfolder2 WORKFOLDER2  �� �� "0 sourcefileextns SOURCEFILEEXTNS  ������ "0 sourcefiletypes SOURCEFILETYPES��        p         �� �� "0 processedfolder PROCESSEDFOLDER  �� �� 0 rejectfolder REJECTFOLDER  ������ 0 errorfolder ERRORFOLDER��        p         �� �� "0 pipelinescript1 PIPELINESCRIPT1  ������ "0 pipelinescript2 PIPELINESCRIPT2��        p         ��  �� 0 minidnum MINIDNUM   �� !�� 0 maxidnum MAXIDNUM ! �� "�� 0 	testidnum 	TESTIDNUM " ������ 0 minfilesize MINFILESIZE��     # $ # p       % % �� &�� 0 emailto EMAILTO & �� '�� 0 rejectmessage REJECTMESSAGE ' �� (�� 0 loopdelaysec LOOPDELAYSEC ( ������ $0 filesizedelaysec FILESIZEDELAYSEC��   $  ) * ) l      + , - + p       . . ������ 0 working WORKING��   , W Q true when working in the idle handler and no idle() should not trigger more runs    - � / / �   t r u e   w h e n   w o r k i n g   i n   t h e   i d l e   h a n d l e r   a n d   n o   i d l e ( )   s h o u l d   n o t   t r i g g e r   m o r e   r u n s *  0 1 0 l     ��������  ��  ��   1  2 3 2 i      4 5 4 I     �� 6��
�� .aevtoappnull  �   � **** 6 J      ����  ��   5 k     � 7 7  8 9 8 r      : ; : J      < <  = > = m      ? ? � @ @  d v >  A�� A m     B B � C C  m o v��   ; o      ���� "0 sourcefileextns SOURCEFILEEXTNS 9  D E D r     F G F J     H H  I J I m     K K � L L  M o o V J  M N M m    	 O O � P P  d v c ! N  Q�� Q m   	 
 R R � S S  ��   G o      ���� "0 sourcefiletypes SOURCEFILETYPES E  T U T l   ��������  ��  ��   U  V W V r     X Y X m     Z Z � [ [ d M a c i n t o s h   H D : U s e r s : r o b o t : p t v p o s t _ m e d i a : S u b m i t - H i g h Y o      ���� 0 sourcefolder1 SOURCEFOLDER1 W  \ ] \ r     ^ _ ^ m     ` ` � a a d / U s e r s / r o b o t / p t v p o s t / s c r i p t s / p t v p i p e l i n e a u t o   - h   - s _ o      ���� "0 pipelinescript1 PIPELINESCRIPT1 ]  b c b l   ��������  ��  ��   c  d e d r     f g f m     h h � i i b M a c i n t o s h   H D : U s e r s : r o b o t : p t v p o s t _ m e d i a : S u b m i t - L o w g o      ���� 0 sourcefolder2 SOURCEFOLDER2 e  j k j r     l m l m     n n � o o d / U s e r s / r o b o t / p t v p o s t / s c r i p t s / p t v p i p e l i n e a u t o   - l   - s m o      ���� "0 pipelinescript2 PIPELINESCRIPT2 k  p q p l   ��������  ��  ��   q  r s r r    $ t u t m      v v � w w b M a c i n t o s h   H D : U s e r s : r o b o t : p t v p o s t _ m e d i a : S u b m i t - D V D u o      ���� "0 processedfolder PROCESSEDFOLDER s  x y x r   % , z { z m   % ( | | � } } ^ M a c i n t o s h   H D : U s e r s : r o b o t : p t v p o s t _ m e d i a : R E J E C T E D { o      ���� 0 rejectfolder REJECTFOLDER y  ~  ~ r   - 4 � � � m   - 0 � � � � � X M a c i n t o s h   H D : U s e r s : r o b o t : p t v p o s t _ m e d i a : E R R O R � o      ���� 0 errorfolder ERRORFOLDER   � � � l  5 5��������  ��  ��   �  � � � r   5 < � � � m   5 8����� � o      ���� 0 minidnum MINIDNUM �  � � � r   = D � � � m   = @����  B? � o      ���� 0 maxidnum MAXIDNUM �  � � � r   E L � � � m   E H����  B? � o      ���� 0 	testidnum 	TESTIDNUM �  � � � r   M T � � � m   M P����  B@ � o      ���� 0 minfilesize MINFILESIZE �  � � � l  U U��������  ��  ��   �  � � � l  U U�� � ���   � ) # set EMAILTO to "jim@agentzero.com"    � � � � F   s e t   E M A I L T O   t o   " j i m @ a g e n t z e r o . c o m " �  � � � r   U \ � � � m   U X � � � � � . t e c h @ p r o v i n c e t o w n t v . o r g � o      ���� 0 emailto EMAILTO �  � � � l  ] ]��������  ��  ��   �  � � � l  ] d � � � � r   ] d � � � m   ] `����  � o      ���� 0 loopdelaysec LOOPDELAYSEC � : 4 how many seconds to wait between runs of the script    � � � � h   h o w   m a n y   s e c o n d s   t o   w a i t   b e t w e e n   r u n s   o f   t h e   s c r i p t �  � � � l  e l � � � � r   e l � � � m   e h����  � o      ���� $0 filesizedelaysec FILESIZEDELAYSEC � � � how many seconds to wait to determine if a file's size is changing (20 sec min due to network copies not updating size right away)    � � � �   h o w   m a n y   s e c o n d s   t o   w a i t   t o   d e t e r m i n e   i f   a   f i l e ' s   s i z e   i s   c h a n g i n g   ( 2 0   s e c   m i n   d u e   t o   n e t w o r k   c o p i e s   n o t   u p d a t i n g   s i z e   r i g h t   a w a y ) �  � � � l  m m��������  ��  ��   �  � � � r   m � � � � b   m � � � � b   m � � � � b   m � � � � b   m � � � � b   m � � � � b   m � � � � b   m � � � � b   m � � � � b   m � � � � b   m � � � � b   m � � � � b   m ~ � � � b   m z � � � b   m v � � � b   m r � � � m   m p � � � � � T h i s   f i l e   w a s   s u b m i t t e d   t o   a   P T V   P o s t p r o d u c t i o n   q u e u e   b u t   c o u l d   n o t   b e   p r o c e s s e d   b y   R o b o t .   
 
 F i l e s   s h o u l d   b e   n a m e d   ' N N N N - f i l e n a m e . � o   p q���� "0 sourcefileextns SOURCEFILEEXTNS � m   r u � � � � � | ' 
 
 	 w h e r e   N N N N   i s   a   P T V - a s s i g n e d   n u m b e r   f o r   t h e   f i l e   ( b e t w e e n   � o   v y���� 0 minidnum MINIDNUM � m   z } � � � � � 
   a n d   � o   ~ ����� 0 maxidnum MAXIDNUM � m   � � � � � � � 0   i n c l u s i v e 
 	 a n d   o n e   o f   ' � o   � ����� "0 sourcefileextns SOURCEFILEEXTNS � m   � � � � � � � � '   i s   t h e   f i l e   e x t e n s i o n . 
 
 T h e   f i l e   t y p e   o f   t h e   f i l e   m u s t   b e   o n e   o f :   ' � o   � ����� "0 sourcefiletypes SOURCEFILETYPES � m   � � � � � � � V '   . 
 
 T h e   s i z e   o f   t h e   f i l e   m u s t   b e   a t   l e a s t   � o   � ����� 0 minfilesize MINFILESIZE � m   � � � � � � � z   b y t e s 	 	 
 	 	 
 T h e   f i l e   h a s   b e e n   m o v e d   t o   t h i s   f o l d e r   o n   R o b o t :   � m   � � � � � � �  
 	 � o   � ����� 0 rejectfolder REJECTFOLDER � m   � � � � � � �  
 	 	 
 F i l e   n a m e : � o      ���� 0 rejectmessage REJECTMESSAGE �  � � � l  � ���������  ��  ��   �  ��� � r   � � � � � m   � ���
�� boovfals � o      ���� 0 working WORKING��   3  � � � l     ��������  ��  ��   �  � � � l     ��������  ��  ��   �  � � � i     � � � I     ������
�� .miscidlenmbr    ��� null��  ��   � k     E � �  � � � l     �� � ���   � 9 3- don't re-enter while something is already running    � � � � f -   d o n ' t   r e - e n t e r   w h i l e   s o m e t h i n g   i s   a l r e a d y   r u n n i n g �  � � � Z     
 ����  o     ���� 0 working WORKING L     o    ���� 0 loopdelaysec LOOPDELAYSEC��  ��   �  l   ��������  ��  ��    r     I    ��	���� 0 getafile getAFile	 
��
 o    ���� 0 sourcefolder1 SOURCEFOLDER1��  ��   o      ���� 	0 afile    Z    &���� >    o    ���� 	0 afile   m    ������ I    "������ 0 
checkafile 
checkAFile  o    ���� 	0 afile    o    ���� 0 sourcefolder1 SOURCEFOLDER1 �� o    �� "0 pipelinescript1 PIPELINESCRIPT1��  ��  ��  ��    r   ' / I   ' -�~�}�~ 0 getafile getAFile �| o   ( )�{�{ 0 sourcefolder2 SOURCEFOLDER2�|  �}   o      �z�z 	0 afile    Z   0 B �y�x >  0 3!"! o   0 1�w�w 	0 afile  " m   1 2�v�v��  I   6 >�u#�t�u 0 
checkafile 
checkAFile# $%$ o   7 8�s�s 	0 afile  % &'& o   8 9�r�r 0 sourcefolder2 SOURCEFOLDER2' (�q( o   9 :�p�p "0 pipelinescript2 PIPELINESCRIPT2�q  �t  �y  �x   )�o) L   C E** o   C D�n�n 0 loopdelaysec LOOPDELAYSEC�o   � +,+ l     �m�l�k�m  �l  �k  , -.- l     �j�i�h�j  �i  �h  . /0/ l      �g12�g  1f` Check and move one file to the in-processing folder or the reject folder 
	These things are checked:
	file name extension is one of those listed in SOURCEFILEEXTNS
	file type is one of those listed in SOURCEFILETYPES
	file name begins with numbers followed by a dash, e.g. "1000-"
		where the number is at least MINIDNUM and not greater than MAXIDNUM
   2 �33�   C h e c k   a n d   m o v e   o n e   f i l e   t o   t h e   i n - p r o c e s s i n g   f o l d e r   o r   t h e   r e j e c t   f o l d e r   
 	 T h e s e   t h i n g s   a r e   c h e c k e d : 
 	 f i l e   n a m e   e x t e n s i o n   i s   o n e   o f   t h o s e   l i s t e d   i n   S O U R C E F I L E E X T N S 
 	 f i l e   t y p e   i s   o n e   o f   t h o s e   l i s t e d   i n   S O U R C E F I L E T Y P E S 
 	 f i l e   n a m e   b e g i n s   w i t h   n u m b e r s   f o l l o w e d   b y   a   d a s h ,   e . g .   " 1 0 0 0 - " 
 	 	 w h e r e   t h e   n u m b e r   i s   a t   l e a s t   M I N I D N U M   a n d   n o t   g r e a t e r   t h a n   M A X I D N U M 
0 454 i    676 I      �f8�e�f 0 
checkafile 
checkAFile8 9:9 o      �d�d 0 thefile  : ;<; o      �c�c 0 workhere  < =�b= o      �a�a 0 pscript  �b  �e  7 k    >> ?@? r     ABA m     �`
�` boovtrueB o      �_�_ 0 working WORKING@ CDC r    EFE I   	�^G�]
�^ .sysonfo4asfe        fileG o    �\�\ 0 thefile  �]  F o      �[�[ 0 fileinfo  D HIH r    JKJ n    LML 1    �Z
�Z 
pnamM o    �Y�Y 0 fileinfo  K o      �X�X 0 filename  I NON l   �W�V�U�W  �V  �U  O PQP Z   RS�TTR l   6U�S�RU F    6VWV F    ,XYX F    !Z[Z l 
  \�Q�P\ l   ]�O�N] E   ^_^ o    �M�M "0 sourcefileextns SOURCEFILEEXTNS_ n    `a` 1    �L
�L 
nmxta o    �K�K 0 fileinfo  �O  �N  �Q  �P  [ l 
  b�J�Ib l   c�H�Gc E   ded o    �F�F "0 sourcefiletypes SOURCEFILETYPESe n    fgf 1    �E
�E 
astyg o    �D�D 0 fileinfo  �H  �G  �J  �I  Y l 
 $ *h�C�Bh I   $ *�Ai�@�A "0 checkfilenumber checkFileNumberi j�?j o   % &�>�> 0 filename  �?  �@  �C  �B  W l  / 4k�=�<k @  / 4lml n   / 2non 1   0 2�;
�; 
ptszo o   / 0�:�: 0 fileinfo  m o   2 3�9�9 0 minfilesize MINFILESIZE�=  �<  �S  �R  S Q   9 �pqrp k   < jss tut r   < Ivwv b   < Gxyx b   < Ez{z b   < ?|}| o   < =�8�8 0 pscript  } m   = >~~ �   { n   ? D��� 1   B D�7
�7 
strq� n   ? B��� 1   @ B�6
�6 
psxp� o   ? @�5�5 0 thefile  y m   E F�� ��� 
   2 > & 1w o      �4�4 0 	thescript  u ��� I  J Q�3��
�3 .sysoexecTEXT���     TEXT� o   J K�2�2 0 	thescript  � �1��0
�1 
alen� m   L M�/
�/ boovfals�0  � ��.� O   R j��� I  X i�-��
�- .coremoveobj        obj � o   X Y�,�, 0 thefile  � �+��
�+ 
insh� o   \ _�*�* "0 processedfolder PROCESSEDFOLDER� �)��(
�) 
alrp� m   b c�'
�' boovtrue�(  � m   R U���                                                                                  MACS   alis    r  Macintosh HD               ���H+     �
Finder.app                                                       w`Ţl;        ����  	                CoreServices    ��      Ţ��       �   Q   P  3Macintosh HD:System:Library:CoreServices:Finder.app    
 F i n d e r . a p p    M a c i n t o s h   H D  &System/Library/CoreServices/Finder.app  / ��  �.  q R      �&��
�& .ascrerr ****      � ****� o      �%�% 
0 errmsg  � �$��#
�$ 
errn� o      �"�" 	0 errno  �#  r k   r ��� ��� I   r ��!�� �! 0 	sendemail 	sendEmail� ��� b   s ���� b   s ���� b   s ���� b   s ���� b   s ���� b   s ~��� b   s |��� b   s x��� m   s v�� ��� � F i l e   w a s   a c c e p t e d   b u t   a n   e r r o r   o c c u r r e d   d u r i n g   p r o c e s s i n g   o r   w h i l e   m o v i n g   f i l e :� o   v w�� 	0 errno  � m   x {�� ���    m e s s a g e :� o   | }�� 
0 errmsg  � m   ~ ��� ���    f i l e :� o   � ��� 0 filename  � m   � ��� ���   � m   � ��� ���    t o :� o   � ��� "0 processedfolder PROCESSEDFOLDER�  �   � ��� O   � ���� I  � ����
� .coremoveobj        obj � o   � ��� 0 thefile  � ���
� 
insh� o   � ��� 0 errorfolder ERRORFOLDER� ���
� 
alrp� m   � ��
� boovtrue�  � m   � ����                                                                                  MACS   alis    r  Macintosh HD               ���H+     �
Finder.app                                                       w`Ţl;        ����  	                CoreServices    ��      Ţ��       �   Q   P  3Macintosh HD:System:Library:CoreServices:Finder.app    
 F i n d e r . a p p    M a c i n t o s h   H D  &System/Library/CoreServices/Finder.app  / ��  �  �T  T Q   ����� k   � ��� ��� O   � ���� I  � ����
� .coremoveobj        obj � o   � ��� 0 thefile  � ���
� 
insh� o   � ��� 0 rejectfolder REJECTFOLDER� ���
� 
alrp� m   � ��
� boovtrue�  � m   � ����                                                                                  MACS   alis    r  Macintosh HD               ���H+     �
Finder.app                                                       w`Ţl;        ����  	                CoreServices    ��      Ţ��       �   Q   P  3Macintosh HD:System:Library:CoreServices:Finder.app    
 F i n d e r . a p p    M a c i n t o s h   H D  &System/Library/CoreServices/Finder.app  / ��  � ��� I   � ��
��	�
 0 	sendemail 	sendEmail� ��� b   � ���� b   � ���� b   � ���� o   � ��� 0 rejectmessage REJECTMESSAGE� o   � ��� 0 filename  � m   � ��� ���  
 	 	 	 f i l e   t y p e :  � l  � ����� n   � ���� 1   � ��
� 
asty� o   � ��� 0 fileinfo  �  �  �  �	  �  � R      ���
� .ascrerr ****      � ****� o      � �  
0 errmsg  � �����
�� 
errn� o      ���� 	0 errno  ��  � I   �������� 0 	sendemail 	sendEmail� ���� b   ���� b   ���� b   ���� b   � ���� b   � ���� b   � ���� b   � ���� b   � ���� b   � ���� m   � ��� ��� h F i l e   w a s   r e j e c t e d   b u t   a n   e r r o r   o c c u r r e d   m o v i n g   f i l e :� o   � ����� 0 filename  � m   � ��� ���   � m   � ��� ���    t o :� o   � ����� 0 rejectfolder REJECTFOLDER� m   � ��� ���  
 	 	 	� o   � ����� 	0 errno  � m   ��� ���    m e s s a g e :� o  ���� 
0 errmsg  � m  �� ���    f i l e :��  ��  Q ���� r  � � m  ��
�� boovfals  o      ���� 0 working WORKING��  5  l     ��������  ��  ��    l      ����   w q check the leading NNNN- number of a file. return true if in bounds, false otherwise.
this is used by checkAFile
    � �   c h e c k   t h e   l e a d i n g   N N N N -   n u m b e r   o f   a   f i l e .   r e t u r n   t r u e   i f   i n   b o u n d s ,   f a l s e   o t h e r w i s e . 
 t h i s   i s   u s e d   b y   c h e c k A F i l e 
 	 i    

 I      ������ "0 checkfilenumber checkFileNumber �� o      ���� 0 filename  ��  ��   k     5  r      m      �  - 1    ��
�� 
txdl  r     n    
 4    
��
�� 
cwor m    	����  o    ���� 0 filename   o      ���� 0 w1    Q      r    !"! c    #$# o    ���� 0 w1  $ m    ��
�� 
nmbr" o      ���� 0 n1   R      ������
�� .ascrerr ****      � ****��  ��    L    %% m    ��
�� boovfals &'& l     ��������  ��  ��  ' (��( Z     5)*��+) l    +,����, F     +-.- l    #/����/ @    #010 o     !���� 0 n1  1 o   ! "���� 0 minidnum MINIDNUM��  ��  . l  & )2����2 B  & )343 o   & '���� 0 n1  4 o   ' (���� 0 maxidnum MAXIDNUM��  ��  ��  ��  * L   . 055 m   . /��
�� boovtrue��  + L   3 566 m   3 4��
�� boovfals��  	 787 l     ��������  ��  ��  8 9:9 l     ��������  ��  ��  : ;<; l      ��=>��  = H B get one file to process or return -1 if no files were available.    > �?? �   g e t   o n e   f i l e   t o   p r o c e s s   o r   r e t u r n   - 1   i f   n o   f i l e s   w e r e   a v a i l a b l e .  < @A@ i    BCB I      ��D���� 0 getafile getAFileD E��E o      ���� 0 
fromfolder  ��  ��  C Q     MFGHF k    CII JKJ O    LML 6   NON n    PQP 3    ��
�� 
cobjQ 4    ��R
�� 
cfolR o   	 
���� 0 
fromfolder  O H    SS C    TUT 1    ��
�� 
pnamU m    VV �WW  .M m    XX�                                                                                  MACS   alis    r  Macintosh HD               ���H+     �
Finder.app                                                       w`Ţl;        ����  	                CoreServices    ��      Ţ��       �   Q   P  3Macintosh HD:System:Library:CoreServices:Finder.app    
 F i n d e r . a p p    M a c i n t o s h   H D  &System/Library/CoreServices/Finder.app  / ��  K YZY r    [\[ c    ]^] 1    ��
�� 
rslt^ m    ��
�� 
alis\ o      ���� 	0 afile  Z _`_ l      ��ab��  a h b if file size is not stable, then we won't process it. Get size. Wait. Get size again and compare    b �cc �   i f   f i l e   s i z e   i s   n o t   s t a b l e ,   t h e n   w e   w o n ' t   p r o c e s s   i t .   G e t   s i z e .   W a i t .   G e t   s i z e   a g a i n   a n d   c o m p a r e  ` ded r     )fgf n     'hih 1   % '��
�� 
ptszi l    %j����j I    %��k��
�� .sysonfo4asfe        filek o     !���� 	0 afile  ��  ��  ��  g o      ���� 0 initialsize  e lml l  * /nopn I  * /��q��
�� .sysodelanull��� ��� nmbrq o   * +���� $0 filesizedelaysec FILESIZEDELAYSEC��  o : 4 wait a while then compare new size and initial size   p �rr h   w a i t   a   w h i l e   t h e n   c o m p a r e   n e w   s i z e   a n d   i n i t i a l   s i z em s��s Z   0 Ctu��vt >  0 9wxw n   0 7yzy 1   5 7��
�� 
ptszz l  0 5{����{ I  0 5��|��
�� .sysonfo4asfe        file| o   0 1���� 	0 afile  ��  ��  ��  x o   7 8���� 0 initialsize  u L   < >}} m   < =��������  v L   A C~~ o   A B���� 	0 afile  ��  G R      ���
�� .ascrerr ****      � **** o      ���� 
0 errmsg  � �����
�� 
errn� o      ���� 	0 errno  ��  H l  K M���� L   K M�� m   K L������� S M if there are no files available, or if a real error occurred, we end up here   � ��� �   i f   t h e r e   a r e   n o   f i l e s   a v a i l a b l e ,   o r   i f   a   r e a l   e r r o r   o c c u r r e d ,   w e   e n d   u p   h e r eA ��� l     ��������  ��  ��  � ��� l     ��������  ��  ��  � ��� l      ������  � B < Send email updating someone about a file that was rejected    � ��� x   S e n d   e m a i l   u p d a t i n g   s o m e o n e   a b o u t   a   f i l e   t h a t   w a s   r e j e c t e d  � ��� i    ��� I      ������� 0 	sendemail 	sendEmail� ���� o      ���� 0 msgtext msgText��  ��  � Q     N���� O    7��� k    6�� ��� r    ��� I   �����
�� .corecrel****      � null��  � ����
�� 
kocl� m   	 
��
�� 
bcke� �����
�� 
prdt� K    �� ����
�� 
subj� m    �� ��� ^ A n   e r r o r   o c c u r r e d   i n   P o s t - P r o d u c t i o n   p r o c e s s i n g� ����
�� 
ctnt� o    ���� 0 msgtext msgText� �����
�� 
pvis� m    ��
�� boovtrue��  ��  � o      ���� 0 thenewmessage theNewMessage� ���� O    6��� k    5�� ��� I   /�����
�� .corecrel****      � null��  � ����
�� 
kocl� m     !��
�� 
trcp� ����
�� 
insh� n   " &���  ;   % &� 2  " %��
�� 
trcp� ����
�� 
prdt� K   ' +�� �~��}
�~ 
radd� o   ( )�|�| 0 emailto EMAILTO�}  �  � ��{� I  0 5�z�y�x
�z .emsgsendbool        bcke�y  �x  �{  � o    �w�w 0 thenewmessage theNewMessage��  � m    ���                                                                                  emal   alis    D  Macintosh HD               ���H+     �Mail.app                                                        ��J`�        ����  	                Applications    ��      �J�       �  "Macintosh HD:Applications:Mail.app    M a i l . a p p    M a c i n t o s h   H D  Applications/Mail.app   / ��  � R      �v��
�v .ascrerr ****      � ****� o      �u�u 
0 errmsg  � �t��s
�t 
errn� o      �r�r 	0 errno  �s  � I  ? N�q��p
�q .ascrcmnt****      � ****� b   ? J��� b   ? H��� b   ? D��� m   ? B�� ��� T E r r o r   o c c u r r e d   w h i l e   t r y i n g   t o   s e n d   e m a i l :� o   B C�o�o 	0 errno  � m   D G�� ��� 
   m s g :� o   H I�n�n 
0 errmsg  �p  � ��m� l     �l�k�j�l  �k  �j  �m       �i��������i  � �h�g�f�e�d�c
�h .aevtoappnull  �   � ****
�g .miscidlenmbr    ��� null�f 0 
checkafile 
checkAFile�e "0 checkfilenumber checkFileNumber�d 0 getafile getAFile�c 0 	sendemail 	sendEmail� �b 5�a�`���_
�b .aevtoappnull  �   � ****�a  �`  �  � - ? B�^ K O R�] Z�\ `�[ h�Z n�Y v�X |�W ��V�U�T�S�R�Q�P�O ��N�M�L�K�J � � � � � � � � ��I�H�^ "0 sourcefileextns SOURCEFILEEXTNS�] "0 sourcefiletypes SOURCEFILETYPES�\ 0 sourcefolder1 SOURCEFOLDER1�[ "0 pipelinescript1 PIPELINESCRIPT1�Z 0 sourcefolder2 SOURCEFOLDER2�Y "0 pipelinescript2 PIPELINESCRIPT2�X "0 processedfolder PROCESSEDFOLDER�W 0 rejectfolder REJECTFOLDER�V 0 errorfolder ERRORFOLDER�U��T 0 minidnum MINIDNUM�S  B?�R 0 maxidnum MAXIDNUM�Q 0 	testidnum 	TESTIDNUM�P  B@�O 0 minfilesize MINFILESIZE�N 0 emailto EMAILTO�M �L 0 loopdelaysec LOOPDELAYSEC�K �J $0 filesizedelaysec FILESIZEDELAYSEC�I 0 rejectmessage REJECTMESSAGE�H 0 working WORKING�_ ���lvE�O���mvE�O�E�O�E�O�E�O�E�O�E` Oa E` Oa E` Oa E` Oa E` Oa E` Oa E` Oa E` Oa E` Oa  E` !Oa "�%a #%_ %a $%_ %a %%�%a &%�%a '%_ %a (%a )%_ %a *%E` +OfE` ,� �G ��F�E���D
�G .miscidlenmbr    ��� null�F  �E  � �C�C 	0 afile  � �B�A�@�?�>�=�<�;�B 0 working WORKING�A 0 loopdelaysec LOOPDELAYSEC�@ 0 sourcefolder1 SOURCEFOLDER1�? 0 getafile getAFile�> "0 pipelinescript1 PIPELINESCRIPT1�= 0 
checkafile 
checkAFile�< 0 sourcefolder2 SOURCEFOLDER2�; "0 pipelinescript2 PIPELINESCRIPT2�D F� �Y hO*�k+ E�O�i *���m+ Y hO*�k+ E�O�i *���m+ Y hO�� �:7�9�8���7�: 0 
checkafile 
checkAFile�9 �6��6 �  �5�4�3�5 0 thefile  �4 0 workhere  �3 0 pscript  �8  � �2�1�0�/�.�-�,�+�2 0 thefile  �1 0 workhere  �0 0 pscript  �/ 0 fileinfo  �. 0 filename  �- 0 	thescript  �, 
0 errmsg  �+ 	0 errno  � )�*�)�(�'�&�%�$�#�"�!� ~������������������������������* 0 working WORKING
�) .sysonfo4asfe        file
�( 
pnam�' "0 sourcefileextns SOURCEFILEEXTNS
�& 
nmxt�% "0 sourcefiletypes SOURCEFILETYPES
�$ 
asty
�# 
bool�" "0 checkfilenumber checkFileNumber
�! 
ptsz�  0 minfilesize MINFILESIZE
� 
psxp
� 
strq
� 
alen
� .sysoexecTEXT���     TEXT
� 
insh� "0 processedfolder PROCESSEDFOLDER
� 
alrp� 
� .coremoveobj        obj � 
0 errmsg  � ���
� 
errn� 	0 errno  �  � 0 	sendemail 	sendEmail� 0 errorfolder ERRORFOLDER� 0 rejectfolder REJECTFOLDER� 0 rejectmessage REJECTMESSAGE�7eE�O�j E�O��,E�Oã�,	 	ţ�,�&	 
*�k+ �&	 	��,��& y 3��%��,�,%�%E�O��fl Oa  �a _ a ea  UW BX  *a �%a %�%a %�%a %a %_ %k+ Oa  �a _ a ea  UY ^ 0a  �a _  a ea  UO*_ !�%a "%��,%k+ W -X  *a #�%a $%a %%_  %a &%�%a '%�%a (%k+ OfE�� ������� "0 checkfilenumber checkFileNumber� �
��
 �  �	�	 0 filename  �  � ���� 0 filename  � 0 w1  � 0 n1  � 	������ ����
� 
txdl
� 
cwor
� 
nmbr�  �  �  0 minidnum MINIDNUM�� 0 maxidnum MAXIDNUM
�� 
bool� 6�*�,FO��k/E�O 
��&E�W 	X  fO��	 ���& eY f� ��C���������� 0 getafile getAFile�� ����� �  ���� 0 
fromfolder  ��  � ������������ 0 
fromfolder  �� 	0 afile  �� 0 initialsize  �� 
0 errmsg  �� 	0 errno  � X�������V���������������
�� 
cfol
�� 
cobj�  
�� 
pnam
�� 
rslt
�� 
alis
�� .sysonfo4asfe        file
�� 
ptsz�� $0 filesizedelaysec FILESIZEDELAYSEC
�� .sysodelanull��� ��� nmbr�� 
0 errmsg  � ������
�� 
errn�� 	0 errno  ��  �� N E� *�/�.�[�,\Z�>C1EUO��&E�O�j �,E�O�j O�j �,� iY �W 	X  i� ������������� 0 	sendemail 	sendEmail�� ����� �  ���� 0 msgtext msgText��  � ���������� 0 msgtext msgText�� 0 thenewmessage theNewMessage�� 
0 errmsg  �� 	0 errno  � �������������������������������������
�� 
kocl
�� 
bcke
�� 
prdt
�� 
subj
�� 
ctnt
�� 
pvis�� �� 
�� .corecrel****      � null
�� 
trcp
�� 
insh
�� 
radd�� 0 emailto EMAILTO
�� .emsgsendbool        bcke�� 
0 errmsg  � ������
�� 
errn�� 	0 errno  ��  
�� .ascrcmnt****      � ****�� O 9� 1*�������e�� 
E�O� *���*�-6���l� 
O*j UUW X  a �%a %�%j  ascr  ��ޭ