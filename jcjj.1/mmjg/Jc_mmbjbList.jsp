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
	String mxbm=null;
	String jc_mmbjb_ysbm=null;
	String jc_mmbjb_qhjgqjbm=null;
	String ztmdj=null;

	String dqbm=null;
	dqbm=request.getParameter("dqbm");
	if (dqbm!=null)
	{
		dqbm=cf.GB2Uni(dqbm);
		if (!(dqbm.equals("")))	wheresql+=" and  (jc_mmbjb.dqbm='"+dqbm+"')";
	}
	String lrbm=null;
	lrbm=request.getParameter("lrbm");
	if (lrbm!=null)
	{
		lrbm=cf.GB2Uni(lrbm);
		if (!(lrbm.equals("")))	wheresql+=" and  (jc_mmbjb.lrbm='"+lrbm+"')";
	}

	mxbm=request.getParameter("mxbm");
	if (mxbm!=null)
	{
		mxbm=cf.GB2Uni(mxbm);
		if (!(mxbm.equals("")))	wheresql+=" and  (jc_mmxhb.mxbm='"+mxbm+"')";
	}
	String mmxh=null;
	mmxh=request.getParameter("mmxh");
	if (mmxh!=null)
	{
		mmxh=cf.GB2Uni(mmxh);
		if (!(mmxh.equals("")))	wheresql+=" and  (jc_mmbjb.mmxh='"+mmxh+"')";
	}
	jc_mmbjb_ysbm=request.getParameter("jc_mmbjb_ysbm");
	if (jc_mmbjb_ysbm!=null)
	{
		jc_mmbjb_ysbm=cf.GB2Uni(jc_mmbjb_ysbm);
		if (!(jc_mmbjb_ysbm.equals("")))	wheresql+=" and  (jc_mmbjb.ysbm='"+jc_mmbjb_ysbm+"')";
	}
	jc_mmbjb_qhjgqjbm=request.getParameter("jc_mmbjb_qhjgqjbm");
	if (jc_mmbjb_qhjgqjbm!=null)
	{
		jc_mmbjb_qhjgqjbm=cf.GB2Uni(jc_mmbjb_qhjgqjbm);
		if (!(jc_mmbjb_qhjgqjbm.equals("")))	wheresql+=" and  (jc_mmbjb.qhjgqjbm='"+jc_mmbjb_qhjgqjbm+"')";
	}
	ztmdj=request.getParameter("ztmdj");
	if (ztmdj!=null)
	{
		ztmdj=ztmdj.trim();
		if (!(ztmdj.equals("")))	wheresql+=" and  (jc_mmbjb.ztmdj="+ztmdj+") ";
	}
	ls_sql="SELECT distinct jc_mmbjb.dqbm,jc_mmbjb.mmxh as mmxh,mxmc,jc_mmbjb.ysbm as ysbm,jdm_mmczbm.mmczmc,jc_mmbjb.qhjgqjbm,jdm_qhjgqj.qhjgqj,jc_mmbjb.ztmdj as ztmdj,dmsjg,dmtjg,mtjg,dkmtjg,zdmjjl,yksmjjl,zmmjg,ysbljjl,tlmpmdj,jc_mmbjb.lrr,jc_mmbjb.lrsj,dwmc,dqmc,jc_mmbjb.bz  ";
	ls_sql+=" FROM jdm_mmczbm,jc_mmbjb,jdm_qhjgqj,jc_mmxhb,jdm_mxbm,dm_dqbm,sq_dwxx  ";
    ls_sql+=" where jc_mmbjb.qhjgqjbm=jdm_qhjgqj.qhjgqjbm(+) and jc_mmbjb.ysbm=jdm_mmczbm.mmczbm(+)";
    ls_sql+=" and jc_mmbjb.mmxh=jc_mmxhb.mmxh(+) and jc_mmxhb.mxbm=jdm_mxbm.mxbm(+)";
    ls_sql+=" and jc_mmbjb.dqbm=dm_dqbm.dqbm(+) and jc_mmbjb.lrbm=sq_dwxx.dwbh(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by jc_mmbjb.dqbm,jc_mmbjb.mmxh,jc_mmbjb.ysbm,jc_mmbjb.qhjgqjbm";
    pageObj.sql=ls_sql;
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Jc_mmbjbList.jsp","SelectJc_mmbjb.jsp","","EditJc_mmbjb.jsp");
	pageObj.setPageRow(200);//����ÿҳ��ʾ��¼��
//������ʾ��
	String[] disColName={"mmxh","mxmc","mmczmc","qhjgqj","ztmdj","dmsjg","dmtjg","mtjg","dkmtjg","zmmjg","zdmjjl","yksmjjl","ysbljjl","tlmpmdj","lrr","lrsj","dwmc","dqmc","bz"};
	pageObj.setDisColName(disColName);
/*
*/

//��������
	String[] keyName={"mmxh","dqbm","ysbm","qhjgqjbm"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Jc_mmbjbList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={0};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);
//������ʾ�ϲ���
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("mmxh","1");//�в����������Hash��
	spanColHash.put("mxmc","1");//�в����������Hash��
	spanColHash.put("mmczmc","1");//�в����������Hash��
	pageObj.setSpanCol(spanColHash);//�в����������Hash��
}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	String chooseitem = request.getParameter("chooseitem");
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[1];//Ҫִ�е�SQL
		boolean needCommit=false;//����Ҫ������
		sql[0]="delete from jc_mmbjb where "+chooseitem;
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
  <B><font size="3">ľ�ű���-ά��</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(190);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">&nbsp;</td>
	<td  width="5%">ľ���ͺ�</td>
	<td  width="6%">����</td>
	<td  width="8%">����</td>
	<td  width="6%">ǽ��۸�����</td>
	<td  width="4%">�����ŵ���</td>
	<td  width="4%">�����ȼ۸�</td>
	<td  width="4%">�����׼۸�</td>
	<td  width="4%">˫������ÿ�׵���</td>
	<td  width="4%">��������ÿ�׵���</td>
	<td  width="4%">��ĸ�żӼ���</td>
	<td  width="4%">�۵��żӼ���</td>
	<td  width="4%">�ƿ���ľ���ɲļӼ���</td>
	<td  width="4%">���������Ӽ���</td>
	<td  width="4%">������ÿƽ�׵���</td>
	<td  width="3%">¼����</td>
	<td  width="5%">¼��ʱ��</td>
	<td  width="7%">¼�벿��</td>
	<td  width="3%">����</td>
	<td  width="12%">��ע</td>
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
