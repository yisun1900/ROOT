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
	String bj_gzbjb_xmbh=null;
	String bj_gzbjb_xmmc=null;
	String[] bj_gzbjb_xmdlbm=null;
	String[] bj_gzbjb_xmxlbm=null;
	String bj_gzbjb_smbm=null;
	String bj_gzbjb_jldwbm=null;

	String sfbxx=null;
	sfbxx=request.getParameter("sfbxx");
	if (sfbxx!=null)
	{
		if (!(sfbxx.equals("")))	wheresql+=" and  (bj_gzbjb.sfbxx='"+sfbxx+"')";
	}

	String bjjbbm=null;
	bjjbbm=request.getParameter("bjjbbm");
	if (bjjbbm!=null)
	{
		bjjbbm=cf.GB2Uni(bjjbbm);
		if (!(bjjbbm.equals("")))	wheresql+=" and  (bj_gzbjb.bjjbbm='"+bjjbbm+"')";
	}

	String bj_gzbjb_dqbm=null;
	bj_gzbjb_dqbm=request.getParameter("bj_gzbjb_dqbm");
	if (!(bj_gzbjb_dqbm.equals("")))	wheresql+=" and  (bj_gzbjb.dqbm='"+bj_gzbjb_dqbm+"')";

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
	
	bj_gzbjb_xmbh=request.getParameter("bj_gzbjb_xmbh");
	if (bj_gzbjb_xmbh!=null)
	{
		bj_gzbjb_xmbh=cf.GB2Uni(bj_gzbjb_xmbh);
		if (!(bj_gzbjb_xmbh.equals("")))	wheresql+=" and  (bj_gzbjb.xmbh='"+bj_gzbjb_xmbh+"')";
	}
	bj_gzbjb_xmmc=request.getParameter("bj_gzbjb_xmmc");
	if (bj_gzbjb_xmmc!=null)
	{
		bj_gzbjb_xmmc=cf.GB2Uni(bj_gzbjb_xmmc);
		if (!(bj_gzbjb_xmmc.equals("")))	wheresql+=" and  (bj_gzbjb.xmmc like '%"+bj_gzbjb_xmmc+"%')";
	}
	bj_gzbjb_xmdlbm=request.getParameterValues("bj_gzbjb_xmdlbm");
	if (bj_gzbjb_xmdlbm!=null)
	{
		wheresql+=cf.arrayToSQL(bj_gzbjb_xmdlbm,"bj_gzbjb.xmdlbm");
	}
	bj_gzbjb_xmxlbm=request.getParameterValues("bj_gzbjb_xmxlbm");
	if (bj_gzbjb_xmxlbm!=null)
	{
		wheresql+=cf.arrayToSQL(bj_gzbjb_xmxlbm,"bj_gzbjb.xmxlbm");
	}
	bj_gzbjb_smbm=request.getParameter("bj_gzbjb_smbm");
	if (bj_gzbjb_smbm!=null)
	{
		bj_gzbjb_smbm=cf.GB2Uni(bj_gzbjb_smbm);
		if (!(bj_gzbjb_smbm.equals("")))	wheresql+=" and  (bj_gzbjb.smbm='"+bj_gzbjb_smbm+"')";
	}
	bj_gzbjb_jldwbm=request.getParameter("bj_gzbjb_jldwbm");
	if (bj_gzbjb_jldwbm!=null)
	{
		bj_gzbjb_jldwbm=cf.GB2Uni(bj_gzbjb_jldwbm);
		if (!(bj_gzbjb_jldwbm.equals("")))	wheresql+=" and  (bj_gzbjb.jldwbm='"+bj_gzbjb_jldwbm+"')";
	}
	ls_sql="SELECT bj_gzbjb.dqbm,xmdlmc,xmxlmc ,bj_gzbjb.xh,bj_gzbjb.xmbh,DECODE(bj_gzbjb.sfbxx,'1','<font color=\"#FF0000\">��ѡ</font>','2','�Ǳ�ѡ','3','<font color=\"#0000FF\">����ѡ</font>') sfbxx,bj_gzbjb.bjjbbm,bjjbmc,bj_gzbjb.xmmc,jdm_jldwbm.jldwmc,smmc,DECODE(sfxycl,'1','��Ҫ','2','����Ҫ') sfxycl,cbenj,sgdbj,bj_gzbjb.bj,clf,DECODE(bjlx,'1','��׼','2','�Զ���') bjlx,lrr,lrsj,DECODE(shbz,'N','δ���','Y','�����') shbz,gycl,zcmc,zcgg,zcf,rgf,glfbl||'%' glfbl,jjf,dqmc";
	ls_sql+=" FROM bj_gzbjb,bdm_xmdlbm,bdm_xmxlbm,bdm_smbm,dm_dqbm,jdm_jldwbm,bdm_bjjbbm  ";
    ls_sql+=" where bj_gzbjb.xmdlbm=bdm_xmdlbm.xmdlbm(+) and bj_gzbjb.xmxlbm=bdm_xmxlbm.xmxlbm(+) and bj_gzbjb.bjjbbm=bdm_bjjbbm.bjjbbm(+)";
    ls_sql+=" and bj_gzbjb.smbm=bdm_smbm.smbm(+) and bj_gzbjb.dqbm=dm_dqbm.dqbm(+) and bj_gzbjb.jldwbm=jdm_jldwbm.jldwbm(+)";
	ls_sql+=wheresql;
    ls_sql+=" order by bj_gzbjb.dqbm,bj_gzbjb.xmdlbm,bj_gzbjb.xmxlbm,bj_gzbjb.xmbh,bj_gzbjb.bjjbbm,bj_gzbjb.xh";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Bj_gzbjbList.jsp","SelectBj_gzbjb.jsp","","EditBj_gzbjb.jsp?dqbm="+bj_gzbjb_dqbm);
	pageObj.setPageRow(39);//����ÿҳ��ʾ��¼��
//������ʾ��
	String[] disColName={"xmbh","xmmc","sfbxx","xmdlmc","xmxlmc","dqmc","sfxycl","jldwmc","smmc","bjlx","bjjbmc","cbenj","sgdbj","bj","zcmc","zcgg","zcf","clf","rgf","jjf","glfbl","gycl","lrr","lrsj","shbz","xh"};
	pageObj.setDisColName(disColName);
/*
*/

//��������
	String[] keyName={"xmbh","bjjbbm"};
	pageObj.setKey(keyName);

//	pageObj.alignStr[11]="align='left'";
//���ð�ť����
	String[] buttonName={"�����޸�","ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"EnterTjgs.jsp?dqbm="+bj_gzbjb_dqbm,"Bj_gzbjbList.jsp?dqbm="+bj_gzbjb_dqbm};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={1,0};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);
//������ʾ�ϲ���
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("xmbh","1");//�в����������Hash��
	spanColHash.put("xmmc","1");//�в����������Hash��
	spanColHash.put("sfbxx","1");//�в����������Hash��
	spanColHash.put("xmdlmc","1");//�в����������Hash��
	spanColHash.put("xmxlmc","1");//�в����������Hash��
	spanColHash.put("dqmc","1");//�в����������Hash��
	spanColHash.put("sfxycl","1");//�в����������Hash��
	spanColHash.put("jldwmc","1");//�в����������Hash��
	spanColHash.put("smmc","1");//�в����������Hash��
	spanColHash.put("bjlx","1");//�в����������Hash��
	pageObj.setSpanCol(spanColHash);//�в����������Hash��

//	pageObj.alignStr[16]="align='left'";
//	pageObj.alignStr[25]="align='left'";
//	pageObj.alignStr[34]="align='left'";

}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	String dqbm=request.getParameter("dqbm");
	String chooseitem = request.getParameter("chooseitem");
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[2];//Ҫִ�е�SQL
		boolean needCommit=true;//����Ҫ������
		sql[0]="delete from bj_gzglfxb where dqbm='"+dqbm+"' and ("+chooseitem+")";
		sql[1]="delete from bj_gzbjb where dqbm='"+dqbm+"' and ("+chooseitem+")";
		pageObj.execDelete(sql,needCommit);
	}
	curPage=Integer.parseInt(pageStr);
}
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>

 <div align="center"> <B><font size="3">��ѯ���</font></B>
</div>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(320);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">&nbsp;</td>
	<td  width="3%">��Ŀ���</td>
	<td  width="7%">��Ŀ����</td>
	<td  width="3%">�Ƿ��ѡ��</td>
	<td  width="4%">��Ŀ����</td>
	<td  width="4%">��ĿС��</td>
	<td  width="3%">����</td>
	<td  width="2%">�Ƿ���Ҫ����</td>
	<td  width="2%">������λ</td>
	<td  width="4%">����</td>
	<td  width="2%">��������</td>
	<td  width="3%">���ۼ���</td>
	<td  width="3%">�ɱ���</td>
	<td  width="3%">ʩ���ӱ���</td>

	<td  width="3%">�ͻ�����</td>
	<td  width="7%">��������</td>
	<td  width="7%">���Ĺ��</td>
	<td  width="3%">���ķ�</td>
	<td  width="3%">���ķ�</td>
	<td  width="2%">�˹���</td>
	<td  width="2%">��е��</td>
	<td  width="2%">����Ѱٷֱ�</td>
	<td  width="16%">���ղ��ϼ��</td>

	<td  width="2%">¼����</td>
	<td  width="3%">¼��ʱ��</td>
	<td  width="2%">��˱�־</td>
	<td  width="2%">���</td>
</tr>
<%
	pageObj.printDate();
	pageObj.printPageLinkTr();
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