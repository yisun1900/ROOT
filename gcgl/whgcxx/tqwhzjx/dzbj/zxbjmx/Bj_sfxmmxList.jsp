<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String ls_sql=null;
	String wheresql="";
	String khbh=request.getParameter("khbh");
	String zjxxh=request.getParameter("zjxxh");

	ls_sql="SELECT bj_sfxmmxh.sfxmbm,sfxmmc,DECODE(sflx,'1','����ֱ�ӷѰٷֱȣ����ɸģ�','A','����ֱ�ӷѰٷֱȣ��ɸģ�','2','�̶����(�ɸ�)','3','˰���ۺ󰴻������㣩','8','˰���ۺ��ۿۼ��㣩','4','�̶����(���ɸ�)','5','�����','6','��˾�����İٷֱ�','7','�Թ����İٷֱ�','9','���ٷֱ�����Ʒ�') sflxmc,DECODE(sfxmlx,'1','��ӹ��̷�','2','������ط�','3','��Ʒ�','4','��˾�����ļ�ӷ�','5','���̹����','6','����˰��','7','��˾�����Ĺ����','8','��˾������˰��','A','�Թ����Ĺ����','B','�Թ�����˰��','C','�Թ����ļ�ӷ�','9','����') sfxmlxmc,bj_sfxmmxh.jldw,TO_CHAR(bj_sfxmmxh.sl) sl,TO_CHAR(bj_sfxmmxh.dj) dj,bj_sfxmmxh.sfbfb||'%' sfbfb,TO_CHAR(bj_sfxmmxh.dxzkl) dxzkl,bj_sfxmmxh.zqsfje,bj_sfxmmxh.sfje,DECODE(bj_sfxmmxh.sfjrqye,'1','����','2','������') sfjrqye,DECODE(bj_sfxmmxh.jrsjbz,'1','��ȡ','2','����ȡ') jrsjbz,DECODE(bj_sfxmmxh.jrglfbz,'1','��ȡ','2','����ȡ') jrglfbz,DECODE(bj_sfxmmxh.sfssjf,'1','��ȡ','2','����ȡ') sfssjf,bj_sfxmmxh.bz";
	ls_sql+=" FROM bj_sfxmmxh  ";
    ls_sql+=" where bj_sfxmmxh.zjxxh='"+zjxxh+"' and  bj_sfxmmxh.khbh='"+khbh+"'";
    ls_sql+=" order by sfxmlx,bj_sfxmmxh.sfxmbm";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","EditBj_sfxmmx.jsp?khbh="+khbh+"&zjxxh="+zjxxh);
	pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��
//������ʾ��
	String[] disColName={"sfxmmc","sflxmc","sfxmlxmc","sfbfb","jldw","sl","dj","dxzkl","zqsfje","sfje","sfjrqye","jrsjbz","jrglfbz","sfssjf","bz"};
	pageObj.setDisColName(disColName);
/*
*/

//��������
	String[] keyName={"sfxmbm"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"DeleteBj_sfxmmx.jsp?khbh="+khbh+"&zjxxh="+zjxxh};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={1};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">�����շ���Ŀ��ϸ���ͻ���ţ�<%=khbh%>��
  </font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink(130);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="6%">&nbsp;</td>
	<td  width="12%">�շ���Ŀ</td>
	<td  width="9%">�շѼ��㷽ʽ</td>
	<td  width="6%">�շ�����</td>
	<td  width="4%">�շѰٷֱ�</td>
	<td  width="4%">������λ</td>
	<td  width="4%">����</td>
	<td  width="7%">����</td>
	<td  width="4%">�����ۿ�</td>
	<td  width="7%">��ǰ���</td>
	<td  width="7%">�ۺ���</td>
	<td  width="4%">����ǩԼ��</td>
	<td  width="4%">��˰��</td>
	<td  width="4%">�չ����</td>
	<td  width="4%">����Ʒ�</td>
	<td  width="22%">��ע</td>
</tr>
<%
	pageObj.displayDateSum();
	pageObj.displayFoot();
%> 

</body>
<script  LANGUAGE="javascript">
<!--
<%
	pageObj.printScript();
%> 
//-->
</script>
</html>