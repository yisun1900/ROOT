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
	String tckd_tcfgzcxm_dqbm=null;
	String tckd_tcfgzcxm_bjjbbm=null;
	String tckd_tcfgzcxm_hxbm=null;
	String tckd_tcfgzcxm_jgwzbm=null;
	String tckd_tcfgzcxm_tccplbbm=null;

	String tckd_tcfgzcxm_lrr=null;
	String tckd_tcfgzcxm_lrsj=null;

	String fgmc=null;
	fgmc=request.getParameter("fgmc");
	if (fgmc!=null)
	{
		fgmc=cf.GB2Uni(fgmc);
		if (!(fgmc.equals("")))	wheresql+=" and  (tckd_tcfgzcxm.fgmc='"+fgmc+"')";
	}
	String nbbm=null;
	nbbm=request.getParameter("nbbm");
	if (nbbm!=null)
	{
		nbbm=cf.GB2Uni(nbbm);
		if (!(nbbm.equals("")))	wheresql+=" and  (tckd_tcfgzcxm.nbbm='"+nbbm+"')";
	}

	
	tckd_tcfgzcxm_dqbm=request.getParameter("tckd_tcfgzcxm_dqbm");
	if (tckd_tcfgzcxm_dqbm!=null)
	{
		tckd_tcfgzcxm_dqbm=cf.GB2Uni(tckd_tcfgzcxm_dqbm);
		if (!(tckd_tcfgzcxm_dqbm.equals("")))	wheresql+=" and  (tckd_tcfgzcxm.dqbm='"+tckd_tcfgzcxm_dqbm+"')";
	}
	tckd_tcfgzcxm_bjjbbm=request.getParameter("tckd_tcfgzcxm_bjjbbm");
	if (tckd_tcfgzcxm_bjjbbm!=null)
	{
		tckd_tcfgzcxm_bjjbbm=cf.GB2Uni(tckd_tcfgzcxm_bjjbbm);
		if (!(tckd_tcfgzcxm_bjjbbm.equals("")))	wheresql+=" and  (tckd_tcfgzcxm.bjjbbm='"+tckd_tcfgzcxm_bjjbbm+"')";
	}
	tckd_tcfgzcxm_hxbm=request.getParameter("tckd_tcfgzcxm_hxbm");
	if (tckd_tcfgzcxm_hxbm!=null)
	{
		tckd_tcfgzcxm_hxbm=cf.GB2Uni(tckd_tcfgzcxm_hxbm);
		if (!(tckd_tcfgzcxm_hxbm.equals("")))	wheresql+=" and  (tckd_tcfgzcxm.hxbm='"+tckd_tcfgzcxm_hxbm+"')";
	}
	tckd_tcfgzcxm_jgwzbm=request.getParameter("tckd_tcfgzcxm_jgwzbm");
	if (tckd_tcfgzcxm_jgwzbm!=null)
	{
		tckd_tcfgzcxm_jgwzbm=cf.GB2Uni(tckd_tcfgzcxm_jgwzbm);
		if (!(tckd_tcfgzcxm_jgwzbm.equals("")))	wheresql+=" and  (tckd_tcfgzcxm.jgwzbm='"+tckd_tcfgzcxm_jgwzbm+"')";
	}
	tckd_tcfgzcxm_tccplbbm=request.getParameter("tckd_tcfgzcxm_tccplbbm");
	if (tckd_tcfgzcxm_tccplbbm!=null)
	{
		tckd_tcfgzcxm_tccplbbm=cf.GB2Uni(tckd_tcfgzcxm_tccplbbm);
		if (!(tckd_tcfgzcxm_tccplbbm.equals("")))	wheresql+=" and  (tckd_tcfgzcxm.tccplbbm='"+tckd_tcfgzcxm_tccplbbm+"')";
	}

	tckd_tcfgzcxm_lrr=request.getParameter("tckd_tcfgzcxm_lrr");
	if (tckd_tcfgzcxm_lrr!=null)
	{
		tckd_tcfgzcxm_lrr=cf.GB2Uni(tckd_tcfgzcxm_lrr);
		if (!(tckd_tcfgzcxm_lrr.equals("")))	wheresql+=" and  (tckd_tcfgzcxm.lrr='"+tckd_tcfgzcxm_lrr+"')";
	}
	tckd_tcfgzcxm_lrsj=request.getParameter("tckd_tcfgzcxm_lrsj");
	if (tckd_tcfgzcxm_lrsj!=null)
	{
		tckd_tcfgzcxm_lrsj=tckd_tcfgzcxm_lrsj.trim();
		if (!(tckd_tcfgzcxm_lrsj.equals("")))	wheresql+="  and (tckd_tcfgzcxm.lrsj>=TO_DATE('"+tckd_tcfgzcxm_lrsj+"','YYYY/MM/DD'))";
	}
	tckd_tcfgzcxm_lrsj=request.getParameter("tckd_tcfgzcxm_lrsj2");
	if (tckd_tcfgzcxm_lrsj!=null)
	{
		tckd_tcfgzcxm_lrsj=tckd_tcfgzcxm_lrsj.trim();
		if (!(tckd_tcfgzcxm_lrsj.equals("")))	wheresql+="  and (tckd_tcfgzcxm.lrsj<=TO_DATE('"+tckd_tcfgzcxm_lrsj+"','YYYY/MM/DD'))";
	}
	ls_sql="SELECT tckd_tcfgzcxm.dqbm,dm_dqbm.dqmc,tckd_tcfgzcxm.bjjbbm,bjjbmc,fgmc,tckd_tcfgzcxm.hxbm,hxmc,tckd_tcfgzcxm.jgwzbm,tckd_tcfgzcxm.tccplbbm,clxlmc,tckd_tcfgzcxm.jldw,tckd_tcfgzcxm.bzsl,tckd_tczcbj.nbbm,tckd_tczcbj.ppmc,tckd_tczcbj.cpmc,tckd_tczcbj.xh,tckd_tcfgzcxm.lrr,tckd_tcfgzcxm.lrsj  ";
	ls_sql+=" FROM tckd_tcfgzcxm,dm_dqbm,bdm_bjjbbm,dm_hxbm,jxc_clxlbm,tckd_tczcbj  ";
    ls_sql+=" where tckd_tcfgzcxm.dqbm=dm_dqbm.dqbm(+)";
    ls_sql+=" and tckd_tcfgzcxm.bjjbbm=bdm_bjjbbm.bjjbbm(+)";
    ls_sql+=" and tckd_tcfgzcxm.hxbm=dm_hxbm.hxbm(+)";
    ls_sql+=" and tckd_tcfgzcxm.tccplbbm=jxc_clxlbm.clxlbm(+)";
    ls_sql+=" and tckd_tcfgzcxm.nbbm=tckd_tczcbj.nbbm(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by tckd_tcfgzcxm.dqbm,tckd_tcfgzcxm.bjjbbm,fgmc,tckd_tcfgzcxm.hxbm,tckd_tcfgzcxm.jgwzbm,tckd_tcfgzcxm.tccplbbm";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Tckd_tcfgzcxmList.jsp","","","EditTckd_tcfgzcxm.jsp");
	pageObj.setPageRow(19);//����ÿҳ��ʾ��¼��

//������ʾ��
	String[] disColName={"dqmc","bjjbmc","fgmc","hxmc","jgwzbm","clxlmc","jldw","bzsl","nbbm","ppmc","cpmc","xh","lrr","lrsj"};
	pageObj.setDisColName(disColName);


//��������
	String[] keyName={"dqbm","bjjbbm","fgmc","hxbm","jgwzbm","nbbm"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Tckd_tcfgzcxmList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={0,1,1,1};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);

}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	String chooseitem = cf.getParameter(request,"chooseitem");
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[1];//Ҫִ�е�SQL
		boolean needCommit=false;//����Ҫ������
		sql[0]="delete from tckd_tcfgzcxm where "+chooseitem;
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
  <B><font size="3">�ײͱ�׼������Ŀ��ά��</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(170);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">&nbsp;</td>
	<td  width="5%">����</td>
	<td  width="5%">���ۼ���</td>
	<td  width="5%">�������</td>
	<td  width="8%">����</td>
	<td  width="6%">�ṹλ��</td>
	<td  width="8%">��Ʒ���</td>
	<td  width="4%">������λ</td>
	<td  width="4%">��׼����</td>
	<td  width="6%">�����ڲ�����</td>
	<td  width="9%">Ʒ��</td>
	<td  width="12%">��Ʒ����</td>
	<td  width="13%">�ͺ�</td>
	<td  width="4%">¼����</td>
	<td  width="6%">¼��ʱ��</td>
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