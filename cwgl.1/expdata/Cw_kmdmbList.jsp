<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	String ls_sql=null;
	String wheresql="";
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String cw_kmdmb_kmdm=null;
	String cw_kmdmb_xmmc1=null;
	String cw_kmdmb_xmmc2=null;
	String cw_kmdmb_xmmc3=null;
	String cw_kmdmb_xmmc4=null;
	String cw_kmdmb_dwbh=null;
	cw_kmdmb_kmdm=request.getParameter("cw_kmdmb_kmdm");
	if (cw_kmdmb_kmdm!=null)
	{
		cw_kmdmb_kmdm=cf.GB2Uni(cw_kmdmb_kmdm);
		if (!(cw_kmdmb_kmdm.equals("")))	wheresql+=" and  (cw_kmdmb.kmdm='"+cw_kmdmb_kmdm+"')";
	}
	cw_kmdmb_xmmc1=request.getParameter("cw_kmdmb_xmmc1");
	if (cw_kmdmb_xmmc1!=null)
	{
		cw_kmdmb_xmmc1=cf.GB2Uni(cw_kmdmb_xmmc1);
		if (!(cw_kmdmb_xmmc1.equals("")))	wheresql+=" and  (cw_kmdmb.xmmc1='"+cw_kmdmb_xmmc1+"')";
	}
	cw_kmdmb_xmmc2=request.getParameter("cw_kmdmb_xmmc2");
	if (cw_kmdmb_xmmc2!=null)
	{
		cw_kmdmb_xmmc2=cf.GB2Uni(cw_kmdmb_xmmc2);
		if (!(cw_kmdmb_xmmc2.equals("")))	wheresql+=" and  (cw_kmdmb.xmmc2='"+cw_kmdmb_xmmc2+"')";
	}
	cw_kmdmb_xmmc3=request.getParameter("cw_kmdmb_xmmc3");
	if (cw_kmdmb_xmmc3!=null)
	{
		cw_kmdmb_xmmc3=cf.GB2Uni(cw_kmdmb_xmmc3);
		if (!(cw_kmdmb_xmmc3.equals("")))	wheresql+=" and  (cw_kmdmb.xmmc3='"+cw_kmdmb_xmmc3+"')";
	}
	cw_kmdmb_xmmc4=request.getParameter("cw_kmdmb_xmmc4");
	if (cw_kmdmb_xmmc4!=null)
	{
		cw_kmdmb_xmmc4=cf.GB2Uni(cw_kmdmb_xmmc4);
		if (!(cw_kmdmb_xmmc4.equals("")))	wheresql+=" and  (cw_kmdmb.xmmc4='"+cw_kmdmb_xmmc4+"')";
	}
	cw_kmdmb_dwbh=request.getParameter("cw_kmdmb_dwbh");
	if (cw_kmdmb_dwbh!=null)
	{
		cw_kmdmb_dwbh=cf.GB2Uni(cw_kmdmb_dwbh);
		if (!(cw_kmdmb_dwbh.equals("")))	wheresql+=" and  (cw_kmdmb.dwbh='"+cw_kmdmb_dwbh+"')";
	}
	ls_sql="SELECT cw_kmdmb.kmdm,cw_kmdmb.xmmc1,cw_kmdmb.xmmc2,cw_kmdmb.xmmc3,cw_kmdmb.xmmc4,sq_dwxx.dwmc  ";
	ls_sql+=" FROM cw_kmdmb,sq_dwxx  ";
    ls_sql+=" where cw_kmdmb.dwbh=sq_dwxx.dwbh";
    ls_sql+=wheresql;
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","EditCw_kmdmb.jsp");
	pageObj.setPageRow(40000);
/*
//������ʾ��
	String[] disColName={"kmdm","cw_kmdmb_xmmc1","cw_kmdmb_xmmc2","cw_kmdmb_xmmc3","cw_kmdmb_xmmc4","sq_dwxx_dwmc"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"kmdm"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Cw_kmdmbList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
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
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
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
	<td  width="14%">��Ŀ����</td>
	<td  width="14%">��һ��������Ŀ�����������</td>
	<td  width="14%">�ڶ���������Ŀ�����������</td>
	<td  width="14%">������������Ŀ�����������</td>
	<td  width="14%">���ĸ�������Ŀ�����������</td>
	<td  width="14%">��λ����</td>
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
