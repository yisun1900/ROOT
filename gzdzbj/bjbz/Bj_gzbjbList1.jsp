<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String dzbjzjmc=(String)session.getAttribute("dzbjzjmc");//���ӱ����м�����
String dzbjzgjmc=(String)session.getAttribute("dzbjzgjmc");//���ӱ����и߼�����
String dzbjgjmc=(String)session.getAttribute("dzbjgjmc");//���ӱ��۸߼�����

String dybjjb=(String)session.getAttribute("bjjb");
if (dybjjb==null)
{
	dybjjb="";
}

int curPage=0;//��ǰ��Ҫ��ʾ��ҳ���
String pageStr=request.getParameter("curPage");//��ȡ��ǰҳ��
if (pageObj.needInit(pageStr))//�ж��Ƿ���Ҫ��ʼ��������һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String bj_jzbjb_dqbm=null;
	String bj_jzbjb_xmbh=null;
	String bj_jzbjb_xmmc=null;
	String[] bj_jzbjb_xmdlbm=null;
	String[] bj_jzbjb_xmxlbm=null;
	String bj_jzbjb_smbm=null;
	String bj_jzbjb_jldwbm=null;

	String bjlx=null;
	bjlx=request.getParameter("bjlx");
	if (!(bjlx.equals("")))	wheresql+=" and  (bj_gzbjb.bjlx='"+bjlx+"')";

	String shbz=null;
	shbz=request.getParameter("shbz");
	if (shbz!=null)
	{
		if (!(shbz.equals("")))	wheresql+=" and  (bj_gzbjb.shbz='"+shbz+"')";
	}
	String lrr=null;
	lrr=request.getParameter("lrr");
	if (lrr!=null)
	{
		if (!(lrr.equals("")))	wheresql+=" and  (bj_gzbjb.lrr='"+lrr+"')";
	}
	String lrsj=null;
	lrsj=request.getParameter("lrsj");
	if (lrsj!=null)
	{
		if (!(lrsj.equals("")))	wheresql+="  and (crm_khxx.lrsj>=TO_DATE('"+lrsj+"','YYYY-MM-DD'))";
	}

	String gycl=null;
	gycl=request.getParameter("gycl");
	if (gycl!=null)
	{
		gycl=cf.GB2Uni(gycl);
		if (!(gycl.equals("")))	wheresql+=" and  (bj_gzbjb.gycl like '%"+gycl+"%')";
	}
	String bgycl=null;
	bgycl=request.getParameter("bgycl");
	if (bgycl!=null)
	{
		bgycl=cf.GB2Uni(bgycl);
		if (!(bgycl.equals("")))	wheresql+=" and  (bj_gzbjb.bgycl like '%"+bgycl+"%')";
	}
	String cgycl=null;
	cgycl=request.getParameter("cgycl");
	if (cgycl!=null)
	{
		cgycl=cf.GB2Uni(cgycl);
		if (!(cgycl.equals("")))	wheresql+=" and  (bj_gzbjb.cgycl like '%"+cgycl+"%')";
	}
	
	
	bj_jzbjb_dqbm=request.getParameter("bj_jzbjb_dqbm");
	if (bj_jzbjb_dqbm!=null)
	{
		bj_jzbjb_dqbm=cf.GB2Uni(bj_jzbjb_dqbm);
		if (!(bj_jzbjb_dqbm.equals("")))	wheresql+=" and  (bj_gzbjb.dqbm='"+bj_jzbjb_dqbm+"')";
	}
	bj_jzbjb_xmbh=request.getParameter("bj_jzbjb_xmbh");
	if (bj_jzbjb_xmbh!=null)
	{
		bj_jzbjb_xmbh=cf.GB2Uni(bj_jzbjb_xmbh);
		if (!(bj_jzbjb_xmbh.equals("")))	wheresql+=" and  (bj_gzbjb.xmbh='"+bj_jzbjb_xmbh+"')";
	}
	bj_jzbjb_xmmc=request.getParameter("bj_jzbjb_xmmc");
	if (bj_jzbjb_xmmc!=null)
	{
		bj_jzbjb_xmmc=cf.GB2Uni(bj_jzbjb_xmmc);
		if (!(bj_jzbjb_xmmc.equals("")))	wheresql+=" and  (bj_gzbjb.xmmc like '%"+bj_jzbjb_xmmc+"%')";
	}
	bj_jzbjb_xmdlbm=request.getParameterValues("bj_jzbjb_xmdlbm");
	if (bj_jzbjb_xmdlbm!=null)
	{
		wheresql+=cf.arrayToSQL(bj_jzbjb_xmdlbm,"bj_gzbjb.xmdlbm");
	}
	bj_jzbjb_xmxlbm=request.getParameterValues("bj_jzbjb_xmxlbm");
	if (bj_jzbjb_xmxlbm!=null)
	{
		wheresql+=cf.arrayToSQL(bj_jzbjb_xmxlbm,"bj_gzbjb.xmxlbm");
	}
	bj_jzbjb_smbm=request.getParameter("bj_jzbjb_smbm");
	if (bj_jzbjb_smbm!=null)
	{
		bj_jzbjb_smbm=cf.GB2Uni(bj_jzbjb_smbm);
		if (!(bj_jzbjb_smbm.equals("")))	wheresql+=" and  (bj_gzbjb.smbm='"+bj_jzbjb_smbm+"')";
	}
	bj_jzbjb_jldwbm=request.getParameter("bj_jzbjb_jldwbm");
	if (bj_jzbjb_jldwbm!=null)
	{
		bj_jzbjb_jldwbm=cf.GB2Uni(bj_jzbjb_jldwbm);
		if (!(bj_jzbjb_jldwbm.equals("")))	wheresql+=" and  (bj_gzbjb.jldwbm='"+bj_jzbjb_jldwbm+"')";
	}

	
	ls_sql="SELECT wybh,bj_gzbjb.dqbm as dqbm,dqmc,xmdlmc,xmxlmc ,bj_gzbjb.xh as xh,bj_gzbjb.xmbh as xmbh,bj_gzbjb.xmmc as bj_gzbjb_xmmc,smmc,jdm_jldwbm.jldwmc as jdm_jldwbm_jldwmc,cbenj,sgdbj,bj_gzbjb.bj as bj_gzbjb_bj,clf,bj_gzbjb.bbj as bj_gzbjb_bbj,bclf,bj_gzbjb.cbj as bj_gzbjb_cbj,cclf,DECODE(bjlx,'1','��׼','2','�Զ���') bjlx,lrr,lrsj,DECODE(shbz,'N','δ���','Y','�����') shbz,gycl,bgycl,cgycl,zcmc,zcgg,zcf,rgf,glfbl,jjf,lrbl,bzcmc,bzcgg,bzcf,brgf,bglfbl,bjjf,blrbl,czcmc,czcgg,czcf,crgf,cglfbl,cjjf,clrbl";
	ls_sql+=" FROM bj_gzbjb,bdm_xmdlbm,bdm_xmxlbm,bdm_smbm,dm_dqbm,jdm_jldwbm  ";
    ls_sql+=" where bj_gzbjb.xmdlbm=bdm_xmdlbm.xmdlbm(+) and bj_gzbjb.xmxlbm=bdm_xmxlbm.xmxlbm(+)";
    ls_sql+=" and bj_gzbjb.smbm=bdm_smbm.smbm(+) and bj_gzbjb.dqbm=dm_dqbm.dqbm(+) and bj_gzbjb.jldwbm=jdm_jldwbm.jldwbm(+)";
	ls_sql+=wheresql;
    ls_sql+=" order by bj_gzbjb.dqbm,bj_gzbjb.xmdlbm,bj_gzbjb.xmxlbm,bj_gzbjb.xh,bj_gzbjb.xmbh";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Bj_jzbjbList.jsp","Selectbj_jzbjb.jsp","","EditBj_jzbjb1.jsp");
	pageObj.setPageRow(100);//����ÿҳ��ʾ��¼��
//������ʾ��
	String[] disColName={"dqmc","xmdlmc","xmxlmc","xh","xmbh","bj_gzbjb_xmmc","smmc","cbenj","sgdbj","bj_gzbjb_bj","zcmc","zcgg","zcf","clf","rgf","jjf","glfbl","lrbl","bj_gzbjb_bbj","bzcmc","bzcgg","bzcf","bclf","brgf","bjjf","bglfbl","blrbl","bj_gzbjb_cbj","czcmc","czcgg","czcf","cclf","crgf","cjjf","cglfbl","clrbl","bjlx","jdm_jldwbm_jldwmc","lrr","lrsj","shbz","gycl","bgycl","cgycl"};
	pageObj.setDisColName(disColName);
/*
*/

//��������
	String[] keyName={"wybh"};
	pageObj.setKey(keyName);

//	pageObj.alignStr[11]="align='left'";
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Bj_jzbjbList1.jsp?"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={0};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);
//������ʾ�ϲ���
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("dqmc","1");//�в����������Hash��
	spanColHash.put("xmdlmc","1");//�в����������Hash��
	spanColHash.put("xmxlmc","1");//�в����������Hash��
	pageObj.setSpanCol(spanColHash);//�в����������Hash��
}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	String[] wybh = request.getParameterValues("wybh");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(wybh,"wybh"));

	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[1];//Ҫִ�е�SQL
		boolean needCommit=false;//����Ҫ������
		sql[0]="delete from bj_gzbjb where "+chooseitem;
		pageObj.execDelete(sql,needCommit);
	}
	curPage=Integer.parseInt(pageStr);
}
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
	pageObj.getDate(curPage);
	pageObj.printPageLink(500);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">&nbsp;</td>
	<td  width="1%">����</td>
	<td  width="2%">��Ŀ����</td>
	<td  width="2%">��ĿС��</td>
	<td  width="1%">���</td>
	<td  width="2%">��Ŀ���</td>
	<td  width="3%">��Ŀ����</td>
	<td  width="2%">����</td>
	<td  width="2%">�ɱ���</td>
	<td  width="2%">ʩ���ӱ���</td>
	<td  width="2%"><%=dzbjzjmc%>����</td>
	<td  width="3%"><%=dzbjzjmc%>��������</td>
	<td  width="3%"><%=dzbjzjmc%>���Ĺ��</td>
	<td  width="2%"><%=dzbjzjmc%>���ķ�</td>
	<td  width="2%"><%=dzbjzjmc%>���Ϸ�</td>
	<td  width="2%"><%=dzbjzjmc%>�˹���</td>
	<td  width="2%"><%=dzbjzjmc%>��е��</td>
	
	<td  width="2%"><%=dzbjzjmc%>����Ѱٷֱ�</td>
	<td  width="2%"><%=dzbjzjmc%>����ٷֱ�</td>
	<td  width="2%"><%=dzbjzgjmc%>����</td>
	<td  width="3%"><%=dzbjzgjmc%>��������</td>
	<td  width="3%"><%=dzbjzgjmc%>���Ĺ��</td>
	<td  width="2%"><%=dzbjzgjmc%>���ķ�</td>
	<td  width="2%"><%=dzbjzgjmc%>�˹���</td>
	<td  width="2%"><%=dzbjzgjmc%>��е��</td>
	<td  width="2%"><%=dzbjzgjmc%>���Ϸ�</td>
	<td  width="2%"><%=dzbjzgjmc%>����Ѱٷֱ�</td>
	<td  width="2%"><%=dzbjzgjmc%>����ٷֱ�</td>
	<td  width="2%"><%=dzbjgjmc%>����</td>
	<td  width="3%"><%=dzbjgjmc%>��������</td>
	<td  width="3%"><%=dzbjgjmc%>���Ĺ��</td>
	<td  width="2%"><%=dzbjgjmc%>���ķ�</td>
	<td  width="2%"><%=dzbjgjmc%>���Ϸ�</td>
	<td  width="2%"><%=dzbjgjmc%>�˹���</td>
	<td  width="2%"><%=dzbjgjmc%>��е��</td>
	<td  width="2%"><%=dzbjgjmc%>����Ѱٷֱ�</td>
	<td  width="2%"><%=dzbjgjmc%>����ٷֱ�</td>
	<td  width="2%">��������</td>
	<td  width="2%">������������λ</td>
	<td  width="2%">¼����</td>
	<td  width="2%">¼��ʱ��</td>
	<td  width="2%">��˱�־</td>
	<td  width="4%"><%=dzbjzjmc%>���ղ��ϼ��</td>
	<td  width="4%"><%=dzbjzgjmc%>���ղ��ϼ��</td>
	<td  width="4%"><%=dzbjgjmc%>���ղ��ϼ��</td>
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