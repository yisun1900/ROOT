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
	String tc_csrjbzgcxm_bjbbh=null;
	String tc_csrjbzgcxm_dqbm=null;
	String tc_csrjbzgcxm_bjjbbm=null;
	String tc_csrjbzgcxm_xmbh=null;
	String sfxzsl=null;
	String tc_csrjbzgcxm_lrr=null;
	String tc_csrjbzgcxm_lrsj=null;


	String xmmc=null;
	xmmc=request.getParameter("xmmc");
	if (xmmc!=null)
	{
		xmmc=cf.GB2Uni(xmmc);
		if (!(xmmc.equals("")))	wheresql+=" and  (bj_jzbjb.xmmc like '%"+xmmc+"%')";
	}
	
	tc_csrjbzgcxm_bjbbh=request.getParameter("tc_csrjbzgcxm_bjbbh");
	if (tc_csrjbzgcxm_bjbbh!=null)
	{
		tc_csrjbzgcxm_bjbbh=cf.GB2Uni(tc_csrjbzgcxm_bjbbh);
		if (!(tc_csrjbzgcxm_bjbbh.equals("")))	wheresql+=" and  (tc_csrjbzgcxm.bjbbh='"+tc_csrjbzgcxm_bjbbh+"')";
	}
	tc_csrjbzgcxm_dqbm=request.getParameter("tc_csrjbzgcxm_dqbm");
	if (tc_csrjbzgcxm_dqbm!=null)
	{
		tc_csrjbzgcxm_dqbm=cf.GB2Uni(tc_csrjbzgcxm_dqbm);
		if (!(tc_csrjbzgcxm_dqbm.equals("")))	wheresql+=" and  (tc_csrjbzgcxm.dqbm='"+tc_csrjbzgcxm_dqbm+"')";
	}
	tc_csrjbzgcxm_bjjbbm=request.getParameter("tc_csrjbzgcxm_bjjbbm");
	if (tc_csrjbzgcxm_bjjbbm!=null)
	{
		tc_csrjbzgcxm_bjjbbm=cf.GB2Uni(tc_csrjbzgcxm_bjjbbm);
		if (!(tc_csrjbzgcxm_bjjbbm.equals("")))	wheresql+=" and  (tc_csrjbzgcxm.bjjbbm='"+tc_csrjbzgcxm_bjjbbm+"')";
	}
	tc_csrjbzgcxm_xmbh=request.getParameter("tc_csrjbzgcxm_xmbh");
	if (tc_csrjbzgcxm_xmbh!=null)
	{
		tc_csrjbzgcxm_xmbh=cf.GB2Uni(tc_csrjbzgcxm_xmbh);
		if (!(tc_csrjbzgcxm_xmbh.equals("")))	wheresql+=" and  (tc_csrjbzgcxm.xmbh='"+tc_csrjbzgcxm_xmbh+"')";
	}
	sfxzsl=request.getParameter("sfxzsl");
	if (sfxzsl!=null)
	{
		sfxzsl=cf.GB2Uni(sfxzsl);
		if (!(sfxzsl.equals("")))	wheresql+=" and  (tc_csrjbzgcxm.sfxzsl='"+sfxzsl+"')";
	}
	tc_csrjbzgcxm_lrr=request.getParameter("tc_csrjbzgcxm_lrr");
	if (tc_csrjbzgcxm_lrr!=null)
	{
		tc_csrjbzgcxm_lrr=cf.GB2Uni(tc_csrjbzgcxm_lrr);
		if (!(tc_csrjbzgcxm_lrr.equals("")))	wheresql+=" and  (tc_csrjbzgcxm.lrr='"+tc_csrjbzgcxm_lrr+"')";
	}
	tc_csrjbzgcxm_lrsj=request.getParameter("tc_csrjbzgcxm_lrsj");
	if (tc_csrjbzgcxm_lrsj!=null)
	{
		tc_csrjbzgcxm_lrsj=tc_csrjbzgcxm_lrsj.trim();
		if (!(tc_csrjbzgcxm_lrsj.equals("")))	wheresql+="  and (tc_csrjbzgcxm.lrsj>=TO_DATE('"+tc_csrjbzgcxm_lrsj+"','YYYY/MM/DD'))";
	}
	tc_csrjbzgcxm_lrsj=request.getParameter("tc_csrjbzgcxm_lrsj2");
	if (tc_csrjbzgcxm_lrsj!=null)
	{
		tc_csrjbzgcxm_lrsj=tc_csrjbzgcxm_lrsj.trim();
		if (!(tc_csrjbzgcxm_lrsj.equals("")))	wheresql+="  and (tc_csrjbzgcxm.lrsj<=TO_DATE('"+tc_csrjbzgcxm_lrsj+"','YYYY/MM/DD'))";
	}
	ls_sql="SELECT tc_csrjbzgcxm.bjbbh,tc_csrjbzgcxm.dqbm,dm_dqbm.dqmc,tc_csrjbzgcxm.bjjbbm,bjjbmc,tc_csrjbzgcxm.xmbh,bj_jzbjb.xmmc,tc_csrjbzgcxm.bzsl, DECODE(tc_csrjbzgcxm.sfxzsl,'1','������','2','��������','3','������') sfxzsl,tc_csrjbzgcxm.lrr,tc_csrjbzgcxm.lrsj  ";
	ls_sql+=" FROM tc_csrjbzgcxm,dm_dqbm,bdm_bjjbbm,bj_jzbjb  ";
    ls_sql+=" where tc_csrjbzgcxm.dqbm=dm_dqbm.dqbm(+)";
    ls_sql+=" and tc_csrjbzgcxm.bjjbbm=bdm_bjjbbm.bjjbbm(+)";
    ls_sql+=" and tc_csrjbzgcxm.bjbbh=bj_jzbjb.bjbbh(+) and tc_csrjbzgcxm.dqbm=bj_jzbjb.dqbm(+) and tc_csrjbzgcxm.bjjbbm=bj_jzbjb.bjjbbm(+) and tc_csrjbzgcxm.xmbh=bj_jzbjb.xmbh(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by tc_csrjbzgcxm.dqbm,tc_csrjbzgcxm.bjbbh,tc_csrjbzgcxm.bjjbbm,tc_csrjbzgcxm.xmbh";
    pageObj.sql=ls_sql;
//	out.println(ls_sql);
//���ж����ʼ��
	pageObj.initPage("Tc_csrjbzgcxmList.jsp","","","EditTc_csrjbzgcxm.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��

//������ʾ��
	String[] disColName={"bjbbh","dqmc","bjjbmc","xmbh","xmmc","sfxzsl","bzsl","lrr","lrsj"};
	pageObj.setDisColName(disColName);


//��������
	String[] keyName={"bjbbh","dqbm","bjjbbm","xmbh"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Tc_csrjbzgcxmList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={0};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);
}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	String chooseitem = cf.getParameter(request,"chooseitem");
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[1];//Ҫִ�е�SQL
		boolean needCommit=false;//����Ҫ������
		sql[0]="delete from tc_csrjbzgcxm where "+chooseitem;
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
	pageObj.printPageLink(120);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="7%">&nbsp;</td>
	<td  width="8%">���۰汾��</td>
	<td  width="8%">����</td>
	<td  width="8%">���ۼ���</td>
	<td  width="9%">��Ŀ���</td>
	<td  width="21%">��Ŀ����</td>
	<td  width="6%">�Ƿ���������</td>
	<td  width="6%">��׼����</td>
	<td  width="5%">¼����</td>
	<td  width="8%">¼��ʱ��</td>
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