<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>
<%
String dwbh=(String)session.getAttribute("dwbh");
String dwlx=(String)session.getAttribute("dwlx");
String yhjs=(String)session.getAttribute("yhjs");
String ssfgs=(String)session.getAttribute("ssfgs");
//where dwbh='"+dwbh+"'
//where dqbm='"+dqbm+"'
//and (dwlx='F1'  or dwlx='F2')
%>
<%
	String ls_sql=null;
	String wheresql="";
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String bgypbh=null;
	String bgypmc=null;
	String pp=null;
	String ghr=null;
	bgypbh=request.getParameter("bgypbh");
	if (bgypbh!=null)
	{
		bgypbh=cf.GB2Uni(bgypbh);
		if (!(bgypbh.equals("")))	wheresql+=" and  (bgypbh='"+bgypbh+"')";
	}
	bgypmc=request.getParameter("bgypmc");
	if (bgypmc!=null)
	{
		bgypmc=cf.GB2Uni(bgypmc);
		if (!(bgypmc.equals("")))	wheresql+=" and  (bgypmc='"+bgypmc+"')";
	}
	pp=request.getParameter("pp");
	if (pp!=null)
	{
		pp=cf.GB2Uni(pp);
		if (!(pp.equals("")))	wheresql+=" and  (pp='"+pp+"')";
	}
	ghr=request.getParameter("ghr");
	if (ghr!=null)
	{
		ghr=cf.GB2Uni(ghr);
		if (!(ghr.equals("")))	wheresql+=" and  (ghr='"+ghr+"')";
	}
	ls_sql="SELECT xz_bgypbm.bgypbh,xz_bgypbm.bgypmc,xz_bgypbm.gg,xz_bgypbm.pp,xz_bgypbm.jg,xz_bgypbm.ghr,xz_bgypbm.bz,sq_dwxx.dwmc  ";
	ls_sql+=" FROM xz_bgypbm,sq_dwxx  ";
    ls_sql+="  where xz_bgypbm.ssfgs=sq_dwxx.dwbh and xz_bgypbm.ssfgs='"+ssfgs+"'";
    ls_sql+=wheresql;
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","EditXz_bgypbm.jsp");
	pageObj.setPageRow(40000);
/*
//������ʾ��
	String[] disColName={"bgypbh","bgypmc","gg","pp","jg","ghr","bz","dqbm"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"bgypbh"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Xz_bgypbmList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={0};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);
/*
//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"saleid","corpid"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="link.jsp?";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("saleid",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��
//������������ʾ��ʽ
	pageObj.setKeyMark("SQL");//SQL��������SQL�ķ�ʽ��ʾ��PARAM��������"123*we*4455"�ķ�ʽ��ʾ
*/
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">��ѯ���</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="12%">&nbsp;</td>
	<td  width="11%">�칫��Ʒ���</td>
	<td  width="11%">�칫��Ʒ����</td>
	<td  width="11%">���</td>
	<td  width="11%">Ʒ��</td>
	<td  width="11%">�۸�</td>
	<td  width="11%">������</td>
	<td  width="11%">��ע</td>
	<td  width="11%">�����ֹ�˾</td>
</tr>
<%
	pageObj.displayDate();
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