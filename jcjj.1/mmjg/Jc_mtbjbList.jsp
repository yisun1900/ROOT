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
	String jc_mtbjb_mmdglxbm=null;
	String jc_mtbjb_ysbm=null;
	String jc_mtbjb_qhjgqjbm=null;
	String jc_mtbjb_mmdj=null;

	String lrbm=null;
	lrbm=request.getParameter("lrbm");
	if (lrbm!=null)
	{
		lrbm=cf.GB2Uni(lrbm);
		if (!(lrbm.equals("")))	wheresql+=" and  (jc_mtbjb.lrbm='"+lrbm+"')";
	}
	String dqbm=null;
	dqbm=request.getParameter("dqbm");
	if (!(dqbm.equals("")))	wheresql+=" and  (jc_mtbjb.dqbm='"+dqbm+"')";

	jc_mtbjb_mmdglxbm=request.getParameter("jc_mtbjb_mmdglxbm");
	if (jc_mtbjb_mmdglxbm!=null)
	{
		jc_mtbjb_mmdglxbm=cf.GB2Uni(jc_mtbjb_mmdglxbm);
		if (!(jc_mtbjb_mmdglxbm.equals("")))	wheresql+=" and  (jc_mtbjb.mmdglxbm='"+jc_mtbjb_mmdglxbm+"')";
	}
	jc_mtbjb_ysbm=request.getParameter("jc_mtbjb_ysbm");
	if (jc_mtbjb_ysbm!=null)
	{
		jc_mtbjb_ysbm=cf.GB2Uni(jc_mtbjb_ysbm);
		if (!(jc_mtbjb_ysbm.equals("")))	wheresql+=" and  (jc_mtbjb.ysbm='"+jc_mtbjb_ysbm+"')";
	}
	jc_mtbjb_qhjgqjbm=request.getParameter("jc_mtbjb_qhjgqjbm");
	if (jc_mtbjb_qhjgqjbm!=null)
	{
		jc_mtbjb_qhjgqjbm=cf.GB2Uni(jc_mtbjb_qhjgqjbm);
		if (!(jc_mtbjb_qhjgqjbm.equals("")))	wheresql+=" and  (jc_mtbjb.qhjgqjbm='"+jc_mtbjb_qhjgqjbm+"')";
	}
	jc_mtbjb_mmdj=request.getParameter("jc_mtbjb_mmdj");
	if (jc_mtbjb_mmdj!=null)
	{
		jc_mtbjb_mmdj=jc_mtbjb_mmdj.trim();
		if (!(jc_mtbjb_mmdj.equals("")))	wheresql+=" and  (jc_mtbjb.mmdj="+jc_mtbjb_mmdj+") ";
	}
	ls_sql="SELECT jc_mtbjb.dqbm,jc_mtbjb.mmdglxbm as mmdglxbm,jc_mmdglx.mmdglxmc as jc_mmdglx_mmdglxmc,jc_mtbjb.ysbm as ysbm,mmczmc,jc_mtbjb.qhjgqjbm as qhjgqjbm,jdm_qhjgqj.qhjgqj as jdm_qhjgqj_qhjgqj,jc_mtbjb.mmdj as jc_mtbjb_mmdj,yksmjjl,jc_mtbjb.lrr,jc_mtbjb.lrsj,dwmc,dqmc  ";
	ls_sql+=" FROM jdm_mmczbm,jc_mmdglx,jc_mtbjb,jdm_qhjgqj,dm_dqbm,sq_dwxx  ";
    ls_sql+=" where jc_mtbjb.qhjgqjbm=jdm_qhjgqj.qhjgqjbm(+) and jc_mtbjb.ysbm=jdm_mmczbm.mmczbm(+)";
    ls_sql+=" and jc_mtbjb.mmdglxbm=jc_mmdglx.mmdglxbm(+)";
    ls_sql+=" and jc_mtbjb.dqbm=dm_dqbm.dqbm(+) and jc_mtbjb.lrbm=sq_dwxx.dwbh(+)";
    ls_sql+=" and jc_mmdglx.jjfs in('12','13','14','15') ";
    ls_sql+=wheresql;
    ls_sql+=" order by jc_mtbjb.dqbm,jc_mtbjb.mmdglxbm,jc_mtbjb.ysbm,jc_mtbjb.qhjgqjbm";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Jc_mtbjbList.jsp","SelectJc_mtbjb.jsp","","EditJc_mtbjb.jsp");
	pageObj.setPageRow(100);//����ÿҳ��ʾ��¼��
//������ʾ��
	String[] disColName={"jc_mmdglx_mmdglxmc","mmczmc","jdm_qhjgqj_qhjgqj","jc_mtbjb_mmdj","yksmjjl","lrr","lrsj","dwmc","dqmc" };
	pageObj.setDisColName(disColName);
/*
*/

//��������
	String[] keyName={"mmdglxbm","dqbm","ysbm","qhjgqjbm"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Jc_mtbjbList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={0};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);
//������ʾ�ϲ���
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("jc_mmdglx_mmdglxmc","1");//�в����������Hash��
	spanColHash.put("mmczmc","1");//�в����������Hash��
	pageObj.setSpanCol(spanColHash);//�в����������Hash��
}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	String chooseitem = cf.GB2Uni(request.getParameter("chooseitem"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[1];//Ҫִ�е�SQL
		boolean needCommit=false;//����Ҫ������
		sql[0]="delete from jc_mtbjb where "+chooseitem;
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
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="8%">&nbsp;</td>
	<td  width="11%">ľ�Ŷ�������</td>
	<td  width="16%">����</td>
	<td  width="14%">ǽ��۸�����</td>
	<td  width="8%">ÿ�׵���</td>
	<td  width="8%">��ľ���ɲļӼ���</td>
	<td  width="7%">¼����</td>
	<td  width="9%">¼��ʱ��</td>
	<td  width="12%">¼�벿��</td>
	<td  width="7%">��������</td>
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