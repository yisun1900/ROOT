<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String ls_sql=null;
	String kpxh=request.getParameter("kpxh");

	ls_sql="SELECT '�޸�' xg,'ɾ��' sc,kp_jcmxb.kpxh as kpxh,kp_jcmxb.kpxmbm as kpxmbm,kp_gckpxm.kpxmmc as kp_gckpxm_kpxmmc,kp_jcmxb.kpjg, DECODE(kp_jcmxb.kpjg,'1','��΢Υ��','2','����Υ��','3','�ر�����') as kpjgmc,kp_jcmxb.kpcfbm as kpcfbm,kp_kpdlbm.kpdlmc as kp_kpdlbm_kpdlmc,kp_kpcfbm.kpcfmc as kp_kpcfbm_kpcfmc  ";
	ls_sql+=" FROM kp_kpcfbm,kp_kpdlbm,kp_gckpxm,kp_jcmxb  ";
    ls_sql+=" where kp_jcmxb.kpcfbm=kp_kpcfbm.kpcfbm and kp_gckpxm.kpdlbm=kp_kpdlbm.kpdlbm and kp_jcmxb.kpxmbm=kp_gckpxm.kpxmbm and kp_jcmxb.kpjg=kp_gckpxm.kpjg";
    ls_sql+=" and kp_jcmxb.kpxh='"+kpxh+"'";
    ls_sql+=" order by kp_gckpxm.kpdlbm,kp_jcmxb.kpxmbm,kp_jcmxb.kpjg,kp_jcmxb.kpcfbm";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);//����ÿҳ��ʾ��¼��
//������ʾ��
	String[] disColName={"kp_kpdlbm_kpdlmc","kp_gckpxm_kpxmmc","kpjgmc","xg","sc","kp_kpcfbm_kpcfmc"};
	pageObj.setDisColName(disColName);
/*
*/

//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"kpxh","kpxmbm"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="yrk_editmain.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target=_blank";//
	coluParmHash.put("xg",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey1={"kpxh","kpxmbm"};//�����в�����coluParm.key������
	coluParm.key=coluKey1;//�����в�����coluParm.key������
	coluParm.link="DeleteKp_jcmxb.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target=_blank";//
	coluParmHash.put("sc",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

//������ʾ�ϲ���
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("kp_kpdlbm_kpdlmc","1");//�в����������Hash��
	spanColHash.put("kp_gckpxm_kpxmmc","1");//�в����������Hash��
	spanColHash.put("kpjgmc","1");//�в����������Hash��
	spanColHash.put("xg","1");//�в����������Hash��
	spanColHash.put("sc","1");//�в����������Hash��
	pageObj.setSpanCol(spanColHash);//�в����������Hash��
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>
<CENTER ><B>�������(������ţ�<%=kpxh%>)</B></CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="22%">��������</td>
	<td  width="15%">������Ŀ</td>
	<td  width="12%">�������</td>
	<td  width="6%">�޸�</td>
	<td  width="6%">ɾ��</td>
	<td  width="15%">��������</td>
</tr>
<%
	pageObj.printDate();
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