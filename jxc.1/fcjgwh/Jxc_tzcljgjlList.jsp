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
	String jxc_tzcljgjl_clbm=null;
	String jxc_tzcljgjl_dqbm=null;
	String dm_dqbm_dqmc=null;
	String jxc_tzcljgjl_lrsj=null;
	String jxc_tzcljgjl_lrr=null;
	String jxc_tzcljgjl_lrbm=null;
	String jxc_tzcljgjl_cbj=null;
	String jxc_tzcljgjl_lsj=null;
	String jxc_tzcljgjl_xsj=null;
	String jxc_tzcljgjl_dfgsjg=null;
	String jxc_tzcljgjl_dgzjg=null;
	String jxc_tzcljgjl_sxsj=null;
	String jxc_tzcljgjl_xgzt=null;
	String jxc_tzcljgjl_xgsj=null;
	jxc_tzcljgjl_clbm=request.getParameter("jxc_tzcljgjl_clbm");
	if (jxc_tzcljgjl_clbm!=null)
	{
		jxc_tzcljgjl_clbm=cf.GB2Uni(jxc_tzcljgjl_clbm);
		if (!(jxc_tzcljgjl_clbm.equals("")))	wheresql+=" and  (jxc_tzcljgjl.clbm='"+jxc_tzcljgjl_clbm+"')";
	}
	jxc_tzcljgjl_dqbm=request.getParameter("jxc_tzcljgjl_dqbm");
	if (jxc_tzcljgjl_dqbm!=null)
	{
		jxc_tzcljgjl_dqbm=cf.GB2Uni(jxc_tzcljgjl_dqbm);
		if (!(jxc_tzcljgjl_dqbm.equals("")))	wheresql+=" and  (jxc_tzcljgjl.dqbm='"+jxc_tzcljgjl_dqbm+"')";
	}
	dm_dqbm_dqmc=request.getParameter("dm_dqbm_dqmc");
	if (dm_dqbm_dqmc!=null)
	{
		dm_dqbm_dqmc=cf.GB2Uni(dm_dqbm_dqmc);
		if (!(dm_dqbm_dqmc.equals("")))	wheresql+=" and  (dm_dqbm.dqmc='"+dm_dqbm_dqmc+"')";
	}
	jxc_tzcljgjl_lrsj=request.getParameter("jxc_tzcljgjl_lrsj");
	if (jxc_tzcljgjl_lrsj!=null)
	{
		jxc_tzcljgjl_lrsj=jxc_tzcljgjl_lrsj.trim();
		if (!(jxc_tzcljgjl_lrsj.equals("")))	wheresql+="  and (jxc_tzcljgjl.lrsj>=TO_DATE('"+jxc_tzcljgjl_lrsj+"','YYYY/MM/DD'))";
	}
	jxc_tzcljgjl_lrsj=request.getParameter("jxc_tzcljgjl_lrsj2");
	if (jxc_tzcljgjl_lrsj!=null)
	{
		jxc_tzcljgjl_lrsj=jxc_tzcljgjl_lrsj.trim();
		if (!(jxc_tzcljgjl_lrsj.equals("")))	wheresql+="  and (jxc_tzcljgjl.lrsj<=TO_DATE('"+jxc_tzcljgjl_lrsj+" 23:59:59','YYYY-MM-DD hh24:mi:ss'))";
	}
	jxc_tzcljgjl_lrr=request.getParameter("jxc_tzcljgjl_lrr");
	if (jxc_tzcljgjl_lrr!=null)
	{
		jxc_tzcljgjl_lrr=cf.GB2Uni(jxc_tzcljgjl_lrr);
		if (!(jxc_tzcljgjl_lrr.equals("")))	wheresql+=" and  (jxc_tzcljgjl.lrr='"+jxc_tzcljgjl_lrr+"')";
	}
	jxc_tzcljgjl_lrbm=request.getParameter("jxc_tzcljgjl_lrbm");
	if (jxc_tzcljgjl_lrbm!=null)
	{
		jxc_tzcljgjl_lrbm=cf.GB2Uni(jxc_tzcljgjl_lrbm);
		if (!(jxc_tzcljgjl_lrbm.equals("")))	wheresql+=" and  (jxc_tzcljgjl.lrbm='"+jxc_tzcljgjl_lrbm+"')";
	}
	jxc_tzcljgjl_cbj=request.getParameter("jxc_tzcljgjl_cbj");
	if (jxc_tzcljgjl_cbj!=null)
	{
		jxc_tzcljgjl_cbj=jxc_tzcljgjl_cbj.trim();
		if (!(jxc_tzcljgjl_cbj.equals("")))	wheresql+=" and  (jxc_tzcljgjl.cbj="+jxc_tzcljgjl_cbj+") ";
	}
	jxc_tzcljgjl_lsj=request.getParameter("jxc_tzcljgjl_lsj");
	if (jxc_tzcljgjl_lsj!=null)
	{
		jxc_tzcljgjl_lsj=jxc_tzcljgjl_lsj.trim();
		if (!(jxc_tzcljgjl_lsj.equals("")))	wheresql+=" and  (jxc_tzcljgjl.lsj="+jxc_tzcljgjl_lsj+") ";
	}
	jxc_tzcljgjl_xsj=request.getParameter("jxc_tzcljgjl_xsj");
	if (jxc_tzcljgjl_xsj!=null)
	{
		jxc_tzcljgjl_xsj=jxc_tzcljgjl_xsj.trim();
		if (!(jxc_tzcljgjl_xsj.equals("")))	wheresql+=" and  (jxc_tzcljgjl.xsj="+jxc_tzcljgjl_xsj+") ";
	}
	jxc_tzcljgjl_dfgsjg=request.getParameter("jxc_tzcljgjl_dfgsjg");
	if (jxc_tzcljgjl_dfgsjg!=null)
	{
		jxc_tzcljgjl_dfgsjg=jxc_tzcljgjl_dfgsjg.trim();
		if (!(jxc_tzcljgjl_dfgsjg.equals("")))	wheresql+=" and  (jxc_tzcljgjl.dfgsjg="+jxc_tzcljgjl_dfgsjg+") ";
	}
	jxc_tzcljgjl_dgzjg=request.getParameter("jxc_tzcljgjl_dgzjg");
	if (jxc_tzcljgjl_dgzjg!=null)
	{
		jxc_tzcljgjl_dgzjg=jxc_tzcljgjl_dgzjg.trim();
		if (!(jxc_tzcljgjl_dgzjg.equals("")))	wheresql+=" and  (jxc_tzcljgjl.dgzjg="+jxc_tzcljgjl_dgzjg+") ";
	}
	jxc_tzcljgjl_sxsj=request.getParameter("jxc_tzcljgjl_sxsj");
	if (jxc_tzcljgjl_sxsj!=null)
	{
		jxc_tzcljgjl_sxsj=jxc_tzcljgjl_sxsj.trim();
		if (!(jxc_tzcljgjl_sxsj.equals("")))	wheresql+="  and (jxc_tzcljgjl.sxsj>=TO_DATE('"+jxc_tzcljgjl_sxsj+"','YYYY/MM/DD'))";
	}
	jxc_tzcljgjl_sxsj=request.getParameter("jxc_tzcljgjl_sxsj2");
	if (jxc_tzcljgjl_sxsj!=null)
	{
		jxc_tzcljgjl_sxsj=jxc_tzcljgjl_sxsj.trim();
		if (!(jxc_tzcljgjl_sxsj.equals("")))	wheresql+="  and (jxc_tzcljgjl.sxsj<=TO_DATE('"+jxc_tzcljgjl_sxsj+" 23:59:59','YYYY-MM-DD hh24:mi:ss'))";
	}
	jxc_tzcljgjl_xgzt=request.getParameter("jxc_tzcljgjl_xgzt");
	if (jxc_tzcljgjl_xgzt!=null)
	{
		jxc_tzcljgjl_xgzt=cf.GB2Uni(jxc_tzcljgjl_xgzt);
		if (!(jxc_tzcljgjl_xgzt.equals("")))	wheresql+=" and  (jxc_tzcljgjl.xgzt='"+jxc_tzcljgjl_xgzt+"')";
	}
	jxc_tzcljgjl_xgsj=request.getParameter("jxc_tzcljgjl_xgsj");
	if (jxc_tzcljgjl_xgsj!=null)
	{
		jxc_tzcljgjl_xgsj=jxc_tzcljgjl_xgsj.trim();
		if (!(jxc_tzcljgjl_xgsj.equals("")))	wheresql+="  and (jxc_tzcljgjl.xgsj>=TO_DATE('"+jxc_tzcljgjl_xgsj+"','YYYY/MM/DD'))";
	}
	jxc_tzcljgjl_xgsj=request.getParameter("jxc_tzcljgjl_xgsj2");
	if (jxc_tzcljgjl_xgsj!=null)
	{
		jxc_tzcljgjl_xgsj=jxc_tzcljgjl_xgsj.trim();
		if (!(jxc_tzcljgjl_xgsj.equals("")))	wheresql+="  and (jxc_tzcljgjl.xgsj<=TO_DATE('"+jxc_tzcljgjl_xgsj+" 23:59:59','YYYY-MM-DD hh24:mi:ss'))";
	}
	ls_sql="SELECT jxc_tzcljgjl.clbm,DECODE(jxc_tzcljgjl.xgzt,'N','δ��','Y','���޸�') xgzt,jxc_tzcljgjl.sxsj,jxc_clbm.nbbm,jxc_clbm.clmc,jxc_clbm.gg,jxc_clbm.jldwbm,jxc_tzcljgjl.cbj,jxc_tzcljgjl.dfgsjg,jxc_tzcljgjl.dgzjg,jxc_tzcljgjl.dqbm,dm_dqbm.dqmc,jxc_tzcljgjl.lrsj,jxc_tzcljgjl.lrr,dwmc ";
	ls_sql+=" FROM dm_dqbm,jxc_tzcljgjl,sq_dwxx,jxc_clbm  ";
    ls_sql+=" where jxc_tzcljgjl.dqbm=dm_dqbm.dqbm(+) and jxc_tzcljgjl.lrbm=sq_dwxx.dwbh(+)";
    ls_sql+=" and jxc_tzcljgjl.clbm=jxc_clbm.clbm(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by jxc_tzcljgjl.dqbm,jxc_tzcljgjl.sxsj,jxc_clbm.clmc";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Jxc_tzcljgjlList.jsp","","","EditJxc_tzcljgjl.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��

//������ʾ��
	String[] disColName={"clbm","xgzt","sxsj","nbbm","clmc","gg","jldwbm","cbj","dfgsjg","dgzjg","dqmc","lrsj","lrr","dwmc"};
	pageObj.setDisColName(disColName);

//��������
	String[] keyName={"clbm","dqbm","lrsj"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ","���¼۸�"};//��ť����ʾ����
	String[] buttonLink={"Jxc_tzcljgjlList.jsp?","plFcjg.jsp"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={0,1};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);

}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	String chooseitem = cf.GB2Uni(request.getParameter("chooseitem"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[1];//Ҫִ�е�SQL
		boolean needCommit=false;//����Ҫ������
		sql[0]="delete from jxc_tzcljgjl where xgzt='N' and ("+chooseitem+")";
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
  <B><font size="3">Ԥ�ȵ����۸�ά��</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(160);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">&nbsp;</td>
	<td  width="8%">���ϱ���</td>
	<td  width="4%">�޸�״̬</td>
	<td  width="6%">��Чʱ��</td>
	<td  width="8%">�ڲ�����</td>
	<td  width="14%">��������</td>
	<td  width="12%">���</td>
	<td  width="5%">������λ</td>
	<td  width="5%">�ɱ���</td>
	<td  width="5%">�Էֹ�˾�۸�</td>
	<td  width="5%">�Թ����۸�</td>
	<td  width="4%">����</td>
	<td  width="6%">¼��ʱ��</td>
	<td  width="4%">¼����</td>
	<td  width="9%">¼�벿��</td>
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