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
	String jc_tjxbjb_mmdglxbm=null;
	String jc_tjxbjb_ysbm=null;
	String jc_tjxbjb_dj=null;

	String lrbm=null;
	lrbm=request.getParameter("lrbm");
	if (lrbm!=null)
	{
		lrbm=cf.GB2Uni(lrbm);
		if (!(lrbm.equals("")))	wheresql+=" and  (jc_tjxbjb.lrbm='"+lrbm+"')";
	}
	String dqbm=null;
	dqbm=request.getParameter("dqbm");
	if (!(dqbm.equals("")))	wheresql+=" and  (jc_tjxbjb.dqbm='"+dqbm+"')";

	jc_tjxbjb_mmdglxbm=request.getParameter("jc_tjxbjb_mmdglxbm");
	if (jc_tjxbjb_mmdglxbm!=null)
	{
		jc_tjxbjb_mmdglxbm=cf.GB2Uni(jc_tjxbjb_mmdglxbm);
		if (!(jc_tjxbjb_mmdglxbm.equals("")))	wheresql+=" and  (jc_tjxbjb.mmdglxbm='"+jc_tjxbjb_mmdglxbm+"')";
	}
	jc_tjxbjb_ysbm=request.getParameter("jc_tjxbjb_ysbm");
	if (jc_tjxbjb_ysbm!=null)
	{
		jc_tjxbjb_ysbm=cf.GB2Uni(jc_tjxbjb_ysbm);
		if (!(jc_tjxbjb_ysbm.equals("")))	wheresql+=" and  (jc_tjxbjb.ysbm='"+jc_tjxbjb_ysbm+"')";
	}
	jc_tjxbjb_dj=request.getParameter("jc_tjxbjb_dj");
	if (jc_tjxbjb_dj!=null)
	{
		jc_tjxbjb_dj=jc_tjxbjb_dj.trim();
		if (!(jc_tjxbjb_dj.equals("")))	wheresql+=" and  (jc_tjxbjb.dj="+jc_tjxbjb_dj+") ";
	}
	ls_sql="SELECT jc_tjxbjb.dqbm,jc_tjxbjb.mmdglxbm as mmdglxbm,jc_mmdglx.mmdglxmc as jc_mmdglx_mmdglxmc,jc_tjxbjb.ysbm as ysbm,mmczmc,jc_tjxbjb.dj as jc_tjxbjb_dj,jc_tjxbjb.lrr,jc_tjxbjb.lrsj,dwmc,dqmc  ";
	ls_sql+=" FROM jdm_mmczbm,jc_mmdglx,jc_tjxbjb,dm_dqbm,sq_dwxx  ";
    ls_sql+=" where jc_tjxbjb.ysbm=jdm_mmczbm.mmczbm(+) and jc_tjxbjb.mmdglxbm=jc_mmdglx.mmdglxbm(+)";
    ls_sql+=" and jc_tjxbjb.dqbm=dm_dqbm.dqbm(+) and jc_tjxbjb.lrbm=sq_dwxx.dwbh(+)";
    ls_sql+=" and jc_mmdglx.jjfs in('41','42')";
    ls_sql+=wheresql;
    ls_sql+=" order by jc_tjxbjb.dqbm,jc_tjxbjb.mmdglxbm,jc_tjxbjb.ysbm";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Jc_tjxbjbList.jsp","SelectJc_tjxbjb.jsp","","EditJc_tjxbjb.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
//������ʾ��
	String[] disColName={"jc_mmdglx_mmdglxmc","mmczmc","jc_tjxbjb_dj","lrr","lrsj","dwmc","dqmc"};
	pageObj.setDisColName(disColName);
/*
*/

//��������
	String[] keyName={"mmdglxbm","dqbm","ysbm"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Jc_tjxbjbList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={0};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);
//������ʾ�ϲ���
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("jc_mmdglx_mmdglxmc","1");//�в����������Hash��
	pageObj.setSpanCol(spanColHash);//�в����������Hash��
}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	String chooseitem = cf.GB2Uni(request.getParameter("chooseitem"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[1];//Ҫִ�е�SQL
		boolean needCommit=false;//����Ҫ������
		sql[0]="delete from jc_tjxbjb where "+chooseitem;
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
	<td  width="20%">��������</td>
	<td  width="18%">����</td>
	<td  width="10%">����</td>
	<td  width="8%">¼����</td>
	<td  width="11%">¼��ʱ��</td>
	<td  width="15%">¼�벿��</td>
	<td  width="10%">��������</td>
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