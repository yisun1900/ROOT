<%@ page contentType="text/html;charset=gb2312" %>


<html>
<head>
<title>OROP��Ϣ����ϵͳ�˵�</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<LINK HREF='./js/menu.css' REL='stylesheet' TYPE='text/css'>
</head>
<BODY CLASS='nav' TEXT="#333333" LINK="#003399" VLINK="#003399" ALINK="#cc9900" LEFTMARGIN=3 TOPMARGIN=5>
<SCRIPT SRC="./js/menu.js"></SCRIPT>
<SCRIPT SRC="./js/menu_functions.js"></SCRIPT>

<script>
foldersTree = gFld('YBL-JCoding���˵�|iGeneric', '');

cdbh02       = insFld(foldersTree, gFld("<FONT COLOR=#006043><B>�༭���ݴ���</B></FONT>|iJvm", ""));
insDoc(cdbh02, gLnk(2, "�༭���ݴ���^iJvmAttribute.gif", "datawindow/SelectDwFrame.jsp"));
insDoc(cdbh02, gLnk(2, "�༭���ݴ���^iJvmAttribute.gif", "datawindow1/SelectDwFrame.jsp"));
insDoc(cdbh02, gLnk(2, "�鿴���ݴ���^iJvmAttribute.gif", "datawindow/SelectCxJdatawindow_note.jsp"));
insDoc(cdbh02, gLnk(2, "����SQL���^iJvmAttribute.gif", "makesql/SelectTableFrame.jsp"));

cdbh03       = insFld(foldersTree, gFld("<FONT COLOR=#006043><B>���ɲ�����ҳ</B></FONT>|iJvm", ""));
insDoc(cdbh03, gLnk(2, "ѡ�������^iJvmAttribute.gif", "insert/editInsertFrame.jsp"));
insDoc(cdbh03, gLnk(2, "���ɲ������^iJvmAttribute.gif", "insert/viewInsertFrame.jsp"));
insDoc(cdbh03, gLnk(2, "ѡ�������^iJvmAttribute.gif", "insert1/editInsertFrame.jsp"));
insDoc(cdbh03, gLnk(2, "���ɲ������^iJvmAttribute.gif", "insert1/viewInsertFrame.jsp"));

cdbh04       = insFld(foldersTree, gFld("<FONT COLOR=#006043><B>�����޸���ҳ</B></FONT>|iJvm", ""));
insDoc(cdbh04, gLnk(2, "ѡ���޸���^iJvmAttribute.gif", "edit/editFrame.jsp"));
insDoc(cdbh04, gLnk(2, "�����޸Ĵ���^iJvmAttribute.gif", "edit/viewEditFrame.jsp"));
insDoc(cdbh04, gLnk(2, "ѡ���޸���^iJvmAttribute.gif", "edit1/editFrame.jsp"));
insDoc(cdbh04, gLnk(2, "�����޸Ĵ���^iJvmAttribute.gif", "edit1/viewEditFrame.jsp"));

cdbh05       = insFld(foldersTree, gFld("<FONT COLOR=#006043><B>���ɲ鿴��ҳ</B></FONT>|iJvm", ""));
insDoc(cdbh05, gLnk(2, "ѡ��鿴��^iJvmAttribute.gif", "view/viewFrame.jsp"));
insDoc(cdbh05, gLnk(2, "���ɲ鿴����^iJvmAttribute.gif", "view/viewViewFrame.jsp"));
insDoc(cdbh05, gLnk(2, "ѡ��鿴��^iJvmAttribute.gif", "view1/viewFrame.jsp"));
insDoc(cdbh05, gLnk(2, "���ɲ鿴����^iJvmAttribute.gif", "view1/viewViewFrame.jsp"));

cdbh06       = insFld(foldersTree, gFld("<FONT COLOR=#006043><B>���ɲ�ѯ��ҳ</B></FONT>|iJvm", ""));
insDoc(cdbh06, gLnk(2, "ѡ���ѯ��^iJvmAttribute.gif", "select/editSelectFrame.jsp"));
insDoc(cdbh06, gLnk(2, "���ɲ�ѯ����^iJvmAttribute.gif", "select/viewSelectFrame.jsp"));
insDoc(cdbh06, gLnk(2, "ѡ���ѯ��^iJvmAttribute.gif", "select1/editSelectFrame.jsp"));
insDoc(cdbh06, gLnk(2, "���ɲ�ѯ����^iJvmAttribute.gif", "select1/viewSelectFrame.jsp"));

cdbh07       = insFld(foldersTree, gFld("<FONT COLOR=#006043><B>����ͳ����ҳ</B></FONT>|iJvm", ""));
insDoc(cdbh07, gLnk(2, "ѡ��ͳ������^iJvmAttribute.gif", "tj/tjFrame.jsp"));
insDoc(cdbh07, gLnk(2, "����ͳ�ƴ���^iJvmAttribute.gif", "tj/viewTjFrame.jsp"));

cdbh08       = insFld(foldersTree, gFld("<FONT COLOR=#006043><B>Ԥ�����ɽ��</B></FONT>|iJvm", ""));
insDoc(cdbh08, gLnk(2, "Ԥ�����ɽ��^iJvmAttribute.gif", "preview/previewframe.jsp"));

cdbh09       = insFld(foldersTree, gFld("<FONT COLOR=#006043><B>ϵͳ����</B></FONT>|iJvm", ""));
insDoc(cdbh09, gLnk(2, "ϵͳ����^iJvmAttribute.gif", "ff/editViewCol.jsp"));

cdbh10       = insFld(foldersTree, gFld("<FONT COLOR=#006043><B>��������</B></FONT>|iJvm", ""));
insDoc(cdbh10, gLnk(2, "��������^iJvmAttribute.gif", "setparam/setparam.jsp"));

cdbh011       = insFld(foldersTree, gFld("<FONT COLOR=#006043><B>����</B></FONT>|iJvm", ""));
insDoc(cdbh011, gLnk(2, "����˵��^iJvmAttribute.gif", "help/use.jsp"));
insDoc(cdbh011, gLnk(2, "����JCoding^iJvmAttribute.gif", "help/about.jsp"));

</SCRIPT>

<script language="JavaScript">
	parent.main.location="content.jsp";
	initializeDocument()
</SCRIPT>

</body>
</html>
