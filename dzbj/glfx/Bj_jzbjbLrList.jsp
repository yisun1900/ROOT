<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
int curPage=0;//��ǰ��Ҫ��ʾ��ҳ���
String pageStr=request.getParameter("curPage");//��ȡ��ǰҳ��
if (pageObj.needInit(pageStr))//�ж��Ƿ���Ҫ��ʼ��������һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String dqbm=null;
	String bj_jzbjb_xmbh=null;
	String bj_jzbjb_xmmc=null;
	String[] bj_jzbjb_xmdlbm=null;
	String[] bj_jzbjb_xmxlbm=null;
	String bj_jzbjb_smbm=null;
	String bj_jzbjb_jldwbm=null;

	String bjbbh=null;
	bjbbh=request.getParameter("bjbbh");
	if (bjbbh!=null)
	{
		bjbbh=cf.GB2Uni(bjbbh);
		if (!(bjbbh.equals("")))	wheresql+=" and  (bj_jzbjb.bjbbh='"+bjbbh+"')";
	}
	String bjjbbm=null;
	bjjbbm=request.getParameter("bjjbbm");
	if (bjjbbm!=null)
	{
		bjjbbm=cf.GB2Uni(bjjbbm);
		if (!(bjjbbm.equals("")))	wheresql+=" and  (bj_jzbjb.bjjbbm='"+bjjbbm+"')";
	}

	
	String lrr=null;
	lrr=request.getParameter("lrr");
	if (lrr!=null)
	{
		if (!(lrr.equals("")))	wheresql+=" and  (bj_jzbjb.lrr='"+lrr+"')";
	}
	String lrsj=null;
	lrsj=request.getParameter("lrsj");
	if (lrsj!=null)
	{
		if (!(lrsj.equals("")))	wheresql+="  and (bj_jzbjb.lrsj=TO_DATE('"+lrsj+"','YYYY-MM-DD'))";
	}
	
	dqbm=request.getParameter("dqbm");
	if (dqbm!=null)
	{
		dqbm=cf.GB2Uni(dqbm);
		if (!(dqbm.equals("")))	wheresql+=" and  (bj_jzbjb.dqbm='"+dqbm+"')";
	}
	bj_jzbjb_xmbh=request.getParameter("bj_jzbjb_xmbh");
	if (bj_jzbjb_xmbh!=null)
	{
		bj_jzbjb_xmbh=cf.GB2Uni(bj_jzbjb_xmbh);
		if (!(bj_jzbjb_xmbh.equals("")))	wheresql+=" and  (bj_jzbjb.xmbh='"+bj_jzbjb_xmbh+"')";
	}
	bj_jzbjb_xmmc=request.getParameter("bj_jzbjb_xmmc");
	if (bj_jzbjb_xmmc!=null)
	{
		bj_jzbjb_xmmc=cf.GB2Uni(bj_jzbjb_xmmc);
		if (!(bj_jzbjb_xmmc.equals("")))	wheresql+=" and  (bj_jzbjb.xmmc like '%"+bj_jzbjb_xmmc+"%')";
	}
	bj_jzbjb_xmdlbm=request.getParameterValues("bj_jzbjb_xmdlbm");
	if (bj_jzbjb_xmdlbm!=null)
	{
		wheresql+=cf.arrayToSQL(bj_jzbjb_xmdlbm,"bj_jzbjb.xmdlbm");
	}
	bj_jzbjb_xmxlbm=request.getParameterValues("bj_jzbjb_xmxlbm");
	if (bj_jzbjb_xmxlbm!=null)
	{
		wheresql+=cf.arrayToSQL(bj_jzbjb_xmxlbm,"bj_jzbjb.xmxlbm");
	}
	bj_jzbjb_smbm=request.getParameter("bj_jzbjb_smbm");
	if (bj_jzbjb_smbm!=null)
	{
		bj_jzbjb_smbm=cf.GB2Uni(bj_jzbjb_smbm);
		if (!(bj_jzbjb_smbm.equals("")))	wheresql+=" and  (bj_jzbjb.smbm='"+bj_jzbjb_smbm+"')";
	}
	bj_jzbjb_jldwbm=request.getParameter("bj_jzbjb_jldwbm");
	if (bj_jzbjb_jldwbm!=null)
	{
		bj_jzbjb_jldwbm=cf.GB2Uni(bj_jzbjb_jldwbm);
		if (!(bj_jzbjb_jldwbm.equals("")))	wheresql+=" and  (bj_jzbjb.jldwbm='"+bj_jzbjb_jldwbm+"')";
	}

	ls_sql="SELECT bj_jzbjb.bjbbh,bj_jzbjb.dqbm,dqmc,xmdlmc,xmxlmc ,bj_jzbjb.xh,bj_jzbjb.xmbh,bj_jzbjb.bjjbbm,bjjbmc,bj_jzbjb.xmmc,smmc,jdm_jldwbm.jldwmc,cbenj,sgdbj,bj_jzbjb.bj,lrr,lrsj,gycl";
	ls_sql+=" FROM bj_jzbjb,bdm_xmdlbm,bdm_xmxlbm,bdm_smbm,dm_dqbm,jdm_jldwbm,bdm_bjjbbm  ";
    ls_sql+=" where bj_jzbjb.xmdlbm=bdm_xmdlbm.xmdlbm(+) and bj_jzbjb.xmxlbm=bdm_xmxlbm.xmxlbm(+) and bj_jzbjb.bjjbbm=bdm_bjjbbm.bjjbbm(+)";
    ls_sql+=" and bj_jzbjb.smbm=bdm_smbm.smbm(+) and bj_jzbjb.dqbm=dm_dqbm.dqbm(+) and bj_jzbjb.jldwbm=jdm_jldwbm.jldwbm(+)";
	ls_sql+=wheresql;
    ls_sql+=" order by bj_jzbjb.bjbbh,bj_jzbjb.dqbm,bj_jzbjb.bjjbbm,bj_jzbjb.xmdlbm,bj_jzbjb.xmxlbm,bj_jzbjb.xmbh,bj_jzbjb.xh";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Bj_jzbjbLrList.jsp","","","InsertBj_jzglfxb.jsp");
	pageObj.setPageRow(100);//����ÿҳ��ʾ��¼��
//������ʾ��
	String[] disColName={"xmbh","xmmc","bjbbh","dqmc","bjjbmc","xmdlmc","xmxlmc","smmc","jldwmc","cbenj","sgdbj","bj","gycl","lrr","lrsj","xh"};
	pageObj.setDisColName(disColName);
/*
*/

//��������
	String[] keyName={"xmbh","dqbm","bjjbbm","bjbbh"};
	pageObj.setKey(keyName);
	pageObj.setEditStr("¼��");


//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"dqbm","bjbbh","bjjbbm","xmbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="ViewXmbhGlfx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("xmbh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

	pageObj.alignStr[12]="align='left'";

}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=Integer.parseInt(pageStr);
}
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">¼�빤�Ϸ���</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(220);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">&nbsp;</td>
	<td  width="4%">��Ŀ���</td>
	<td  width="13%">��Ŀ����</td>
	<td  width="4%">���۰汾��</td>
	<td  width="4%">����</td>
	<td  width="4%">���ۼ���</td>
	<td  width="5%">��Ŀ����</td>
	<td  width="6%">��ĿС��</td>
	<td  width="4%">����</td>
	<td  width="3%">������λ</td>
	<td  width="4%">�ɱ���</td>
	<td  width="4%">���̻�������</td>
	<td  width="4%">����Ԥ���</td>
	<td  width="29%">���ղ��ϼ��</td>
	<td  width="3%">¼����</td>
	<td  width="4%">¼��ʱ��</td>
	<td  width="3%">���</td>
</tr>
<%
	pageObj.displayDate();
	pageObj.printPageLinkTr();
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