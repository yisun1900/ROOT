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
	String jc_mlcbjb_mmdglxbm=null;
	String jc_mlcbjb_ysbm=null;
	String jc_mlcbjb_qhjgqjbm=null;

	String lrbm=null;
	lrbm=request.getParameter("lrbm");
	if (lrbm!=null)
	{
		lrbm=cf.GB2Uni(lrbm);
		if (!(lrbm.equals("")))	wheresql+=" and  (jc_mlcbjb.lrbm='"+lrbm+"')";
	}
	String dqbm=null;
	dqbm=request.getParameter("dqbm");
	if (!(dqbm.equals("")))	wheresql+=" and  (jc_mlcbjb.dqbm='"+dqbm+"')";

	jc_mlcbjb_mmdglxbm=request.getParameter("jc_mlcbjb_mmdglxbm");
	if (jc_mlcbjb_mmdglxbm!=null)
	{
		jc_mlcbjb_mmdglxbm=cf.GB2Uni(jc_mlcbjb_mmdglxbm);
		if (!(jc_mlcbjb_mmdglxbm.equals("")))	wheresql+=" and  (jc_mlcbjb.mmdglxbm='"+jc_mlcbjb_mmdglxbm+"')";
	}
	jc_mlcbjb_ysbm=request.getParameter("jc_mlcbjb_ysbm");
	if (jc_mlcbjb_ysbm!=null)
	{
		jc_mlcbjb_ysbm=cf.GB2Uni(jc_mlcbjb_ysbm);
		if (!(jc_mlcbjb_ysbm.equals("")))	wheresql+=" and  (jc_mlcbjb.ysbm='"+jc_mlcbjb_ysbm+"')";
	}
	jc_mlcbjb_qhjgqjbm=request.getParameter("jc_mlcbjb_qhjgqjbm");
	if (jc_mlcbjb_qhjgqjbm!=null)
	{
		jc_mlcbjb_qhjgqjbm=cf.GB2Uni(jc_mlcbjb_qhjgqjbm);
		if (!(jc_mlcbjb_qhjgqjbm.equals("")))	wheresql+=" and  (jc_mlcbjb.qhjgqjbm='"+jc_mlcbjb_qhjgqjbm+"')";
	}
	ls_sql="SELECT jc_mlcbjb.dqbm,jc_mlcbjb.mmdglxbm as mmdglxbm,jc_mmdglx.mmdglxmc as jc_mmdglx_mmdglxmc,jc_mlcbjb.ysbm as ysbm,jdm_mmczbm.mmczmc as jdm_mmczbm_mmczmc,jc_mlcbjb.qhjgqjbm as qhjgqjbm,jdm_qhjgqj.qhjgqj as jdm_qhjgqj_qhjgqj,jc_mlcbjb.ctdj as jc_mlcbjb_ctdj,jc_mlcbjb.csdj as jc_mlcbjb_csdj,jc_mlcbjb.lrr,jc_mlcbjb.lrsj,dwmc,dqmc  ";
	ls_sql+=" FROM jc_mlcbjb,jc_mmdglx,jdm_mmczbm,jdm_qhjgqj,dm_dqbm,sq_dwxx  ";
    ls_sql+=" where jc_mlcbjb.qhjgqjbm=jdm_qhjgqj.qhjgqjbm(+) and jc_mlcbjb.mmdglxbm=jc_mmdglx.mmdglxbm(+) and jc_mlcbjb.ysbm=jdm_mmczbm.mmczbm(+)";
    ls_sql+=" and jc_mlcbjb.dqbm=dm_dqbm.dqbm(+) and jc_mlcbjb.lrbm=sq_dwxx.dwbh(+)";
    ls_sql+=" and jc_mmdglx.jjfs in('21','22')";
    ls_sql+=wheresql;
    ls_sql+=" order by jc_mlcbjb.dqbm,jc_mlcbjb.mmdglxbm,jc_mlcbjb.ysbm,jc_mlcbjb.qhjgqjbm";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Jc_mlcbjbList.jsp","SelectJc_mlcbjb.jsp","","EditJc_mlcbjb.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
//������ʾ��
	String[] disColName={"jc_mmdglx_mmdglxmc","jdm_mmczbm_mmczmc","jdm_qhjgqj_qhjgqj","jc_mlcbjb_ctdj","jc_mlcbjb_csdj","lrr","lrsj","dwmc","dqmc"};
	pageObj.setDisColName(disColName);
/*
*/

//��������
	String[] keyName={"mmdglxbm","dqbm","ysbm","qhjgqjbm"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Jc_mlcbjbList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={0};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);
//������ʾ�ϲ���
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("jc_mmdglx_mmdglxmc","1");//�в����������Hash��
	spanColHash.put("jdm_mmczbm_mmczmc","1");//�в����������Hash��
	pageObj.setSpanCol(spanColHash);//�в����������Hash��
}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	String chooseitem = cf.GB2Uni(request.getParameter("chooseitem"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[1];//Ҫִ�е�SQL
		boolean needCommit=false;//����Ҫ������
		sql[0]="delete from jc_mlcbjb where "+chooseitem;
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
	<td  width="16%">��������</td>
	<td  width="12%">����</td>
	<td  width="12%">ǽ��۸�����</td>
	<td  width="9%">����ÿ�׵���</td>
	<td  width="9%">����ÿƽ�׵���</td>
	<td  width="6%">¼����</td>
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
