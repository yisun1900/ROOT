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
	String rs_yggzbg_ygbh=null;
	String rs_yggzbg_sjqd=null;
	String rs_yggzbg_sjzd=null;
	String rs_yggzbg_xm=null;
	String rs_yggzbg_xzzwbm=null;
	String rs_yggzbg_ssfgs=null;
	String rs_yggzbg_dwbh=null;
	String rs_yggzbg_lrr=null;
	String rs_yggzbg_lrsj=null;
	rs_yggzbg_ygbh=request.getParameter("rs_yggzbg_ygbh");
	if (rs_yggzbg_ygbh!=null)
	{
		rs_yggzbg_ygbh=rs_yggzbg_ygbh.trim();
		if (!(rs_yggzbg_ygbh.equals("")))	wheresql+=" and (rs_yggzbg.ygbh="+rs_yggzbg_ygbh+") ";
	}
	rs_yggzbg_sjqd=request.getParameter("rs_yggzbg_sjqd");
	if (rs_yggzbg_sjqd!=null)
	{
		rs_yggzbg_sjqd=rs_yggzbg_sjqd.trim();
		if (!(rs_yggzbg_sjqd.equals("")))	wheresql+="  and (rs_yggzbg.sjqd>=TO_DATE('"+rs_yggzbg_sjqd+"','YYYY/MM/DD'))";
	}
	rs_yggzbg_sjqd=request.getParameter("rs_yggzbg_sjqd2");
	if (rs_yggzbg_sjqd!=null)
	{
		rs_yggzbg_sjqd=rs_yggzbg_sjqd.trim();
		if (!(rs_yggzbg_sjqd.equals("")))	wheresql+="  and (rs_yggzbg.sjqd<=TO_DATE('"+rs_yggzbg_sjqd+"','YYYY/MM/DD'))";
	}
	rs_yggzbg_sjzd=request.getParameter("rs_yggzbg_sjzd");
	if (rs_yggzbg_sjzd!=null)
	{
		rs_yggzbg_sjzd=rs_yggzbg_sjzd.trim();
		if (!(rs_yggzbg_sjzd.equals("")))	wheresql+="  and (rs_yggzbg.sjzd>=TO_DATE('"+rs_yggzbg_sjzd+"','YYYY/MM/DD'))";
	}
	rs_yggzbg_sjzd=request.getParameter("rs_yggzbg_sjzd2");
	if (rs_yggzbg_sjzd!=null)
	{
		rs_yggzbg_sjzd=rs_yggzbg_sjzd.trim();
		if (!(rs_yggzbg_sjzd.equals("")))	wheresql+="  and (rs_yggzbg.sjzd<=TO_DATE('"+rs_yggzbg_sjzd+"','YYYY/MM/DD'))";
	}
	rs_yggzbg_xm=request.getParameter("rs_yggzbg_xm");
	if (rs_yggzbg_xm!=null)
	{
		rs_yggzbg_xm=cf.GB2Uni(rs_yggzbg_xm);
		if (!(rs_yggzbg_xm.equals("")))	wheresql+=" and  (rs_yggzbg.xm='"+rs_yggzbg_xm+"')";
	}
	rs_yggzbg_xzzwbm=request.getParameter("rs_yggzbg_xzzwbm");
	if (rs_yggzbg_xzzwbm!=null)
	{
		rs_yggzbg_xzzwbm=cf.GB2Uni(rs_yggzbg_xzzwbm);
		if (!(rs_yggzbg_xzzwbm.equals("")))	wheresql+=" and  (rs_yggzbg.xzzwbm='"+rs_yggzbg_xzzwbm+"')";
	}
	rs_yggzbg_ssfgs=request.getParameter("rs_yggzbg_ssfgs");
	if (rs_yggzbg_ssfgs!=null)
	{
		rs_yggzbg_ssfgs=cf.GB2Uni(rs_yggzbg_ssfgs);
		if (!(rs_yggzbg_ssfgs.equals("")))	wheresql+=" and  (rs_yggzbg.ssfgs='"+rs_yggzbg_ssfgs+"')";
	}
	rs_yggzbg_dwbh=request.getParameter("rs_yggzbg_dwbh");
	if (rs_yggzbg_dwbh!=null)
	{
		rs_yggzbg_dwbh=cf.GB2Uni(rs_yggzbg_dwbh);
		if (!(rs_yggzbg_dwbh.equals("")))	wheresql+=" and  (rs_yggzbg.dwbh='"+rs_yggzbg_dwbh+"')";
	}
	rs_yggzbg_lrr=request.getParameter("rs_yggzbg_lrr");
	if (rs_yggzbg_lrr!=null)
	{
		rs_yggzbg_lrr=cf.GB2Uni(rs_yggzbg_lrr);
		if (!(rs_yggzbg_lrr.equals("")))	wheresql+=" and  (rs_yggzbg.lrr='"+rs_yggzbg_lrr+"')";
	}
	rs_yggzbg_lrsj=request.getParameter("rs_yggzbg_lrsj");
	if (rs_yggzbg_lrsj!=null)
	{
		rs_yggzbg_lrsj=rs_yggzbg_lrsj.trim();
		if (!(rs_yggzbg_lrsj.equals("")))	wheresql+="  and (rs_yggzbg.lrsj>=TO_DATE('"+rs_yggzbg_lrsj+"','YYYY/MM/DD'))";
	}
	rs_yggzbg_lrsj=request.getParameter("rs_yggzbg_lrsj2");
	if (rs_yggzbg_lrsj!=null)
	{
		rs_yggzbg_lrsj=rs_yggzbg_lrsj.trim();
		if (!(rs_yggzbg_lrsj.equals("")))	wheresql+="  and (rs_yggzbg.lrsj<=TO_DATE('"+rs_yggzbg_lrsj+"','YYYY/MM/DD'))";
	}

	ls_sql="SELECT rs_yggzbg.sjqd,rs_yggzbg.sjzd,a.dwmc ssbm,rs_yggzbg.xm,rs_yggzbg.xzzwbm,rs_yggzbg.gzsm,rs_yggzbg.gzsj,rs_yggzbg.lrr,rs_yggzbg.lrsj,b.dwmc ssfgs,rs_yggzbg.ygbh  ";
	ls_sql+=" FROM rs_yggzbg,sq_dwxx a,sq_dwxx b  ";
    ls_sql+=" where rs_yggzbg.dwbh=a.dwbh and rs_yggzbg.ssfgs=b.dwbh";
    ls_sql+=wheresql;
    ls_sql+=" order by rs_yggzbg.lrsj desc";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Rs_yggzbgList.jsp","","","EditRs_yggzbg.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"ygbh","sjqd","rs_yggzbg_sjzd","rs_yggzbg_xm","rs_yggzbg_xzzwbm","rs_yggzbg_ssfgs","rs_yggzbg_dwbh","rs_yggzbg_gzsm","rs_yggzbg_gzsj","rs_yggzbg_lrr","rs_yggzbg_lrsj","sq_dwxx_dwmc"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"ygbh","sjqd"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Rs_yggzbgList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={0};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);

/*
//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"saleid","corpid"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="link.jsp?";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("saleid",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��
//������������ʾ��ʽ
	pageObj.setKeyMark("SQL");//SQL��������SQL�ķ�ʽ��ʾ��PARAM��������"123*we*4455"�ķ�ʽ��ʾ
*/
}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	String chooseitem = cf.GB2Uni(request.getParameter("chooseitem"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[1];//Ҫִ�е�SQL
		boolean needCommit=false;//����Ҫ������
		sql[0]="delete from rs_yggzbg where "+chooseitem;
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
  <B><font size="3">Ա����������-ά��</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(200);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">&nbsp;</td>
	<td  width="5%">����ʱ�����</td>
	<td  width="5%">����ʱ���յ�</td>
	<td  width="7%">��������</td>
	<td  width="5%">����</td>
	<td  width="5%">ְ��</td>
	<td  width="46%">����˵��</td>
	<td  width="4%">����ʱ��</td>
	<td  width="4%">¼����</td>
	<td  width="5%">¼��ʱ��</td>
	<td  width="6%">�����ֹ�˾</td>
	<td  width="4%">Ա�����</td>
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