<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	String ls_sql=null;
	String wheresql="";
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String jxc_kcjzmx_jzph=null;
	String jxc_kcjzmx_clbm=null;
	String jxc_kcjzmx_zljb=null;
	String jxc_kcjzmx_zsl=null;
	String jxc_kcjzmx_zjg=null;
	jxc_kcjzmx_jzph=request.getParameter("jxc_kcjzmx_jzph");
	if (jxc_kcjzmx_jzph!=null)
	{
		jxc_kcjzmx_jzph=cf.GB2Uni(jxc_kcjzmx_jzph);
		if (!(jxc_kcjzmx_jzph.equals("")))	wheresql+=" and  (jxc_kcjzmx.jzph='"+jxc_kcjzmx_jzph+"')";
	}
	jxc_kcjzmx_clbm=request.getParameter("jxc_kcjzmx_clbm");
	if (jxc_kcjzmx_clbm!=null)
	{
		jxc_kcjzmx_clbm=cf.GB2Uni(jxc_kcjzmx_clbm);
		if (!(jxc_kcjzmx_clbm.equals("")))	wheresql+=" and  (jxc_kcjzmx.clbm='"+jxc_kcjzmx_clbm+"')";
	}
	jxc_kcjzmx_zljb=request.getParameter("jxc_kcjzmx_zljb");
	if (jxc_kcjzmx_zljb!=null)
	{
		jxc_kcjzmx_zljb=cf.GB2Uni(jxc_kcjzmx_zljb);
		if (!(jxc_kcjzmx_zljb.equals("")))	wheresql+=" and  (jxc_kcjzmx.zljb='"+jxc_kcjzmx_zljb+"')";
	}
	jxc_kcjzmx_zsl=request.getParameter("jxc_kcjzmx_zsl");
	if (jxc_kcjzmx_zsl!=null)
	{
		jxc_kcjzmx_zsl=jxc_kcjzmx_zsl.trim();
		if (!(jxc_kcjzmx_zsl.equals("")))	wheresql+=" and (jxc_kcjzmx.zsl="+jxc_kcjzmx_zsl+") ";
	}
	jxc_kcjzmx_zjg=request.getParameter("jxc_kcjzmx_zjg");
	if (jxc_kcjzmx_zjg!=null)
	{
		jxc_kcjzmx_zjg=jxc_kcjzmx_zjg.trim();
		if (!(jxc_kcjzmx_zjg.equals("")))	wheresql+=" and  (jxc_kcjzmx.zjg="+jxc_kcjzmx_zjg+") ";
	}
	ls_sql="SELECT jxc_kcjzmx.jzph,jxc_kcjzmx.clbm,jxc_kcjzmx.zljb,jxc_kcjzmx.zsl,jxc_kcjzmx.zjg  ";
	ls_sql+=" FROM jxc_kcjzmx  ";
    ls_sql+=" where (1=1)";
    ls_sql+=wheresql;
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(40000);
/*
//������ʾ��
	String[] disColName={"jzph","clbm","zljb","jxc_kcjzmx_zsl","jxc_kcjzmx_zjg"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"jzph","clbm","zljb"};
	pageObj.setKey(keyName);
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
	<td  width="20%">��ת����</td>
	<td  width="20%">���ϱ���</td>
	<td  width="20%">��������</td>
	<td  width="20%">������</td>
	<td  width="20%">�ܽ��</td>
</tr>
<%
	pageObj.printDateSum();
	pageObj.printFoot();
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