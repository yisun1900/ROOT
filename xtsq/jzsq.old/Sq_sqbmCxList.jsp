<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>


<%
if (cf.check((String)session.getAttribute("yhdlm"),request.getRemoteHost(),"010215")==0) 
{
	out.print(new String("ϵͳ����ʱ������������µ�¼��"));
	return;
}
%>

<%
int curPage=0;//��ǰ��Ҫ��ʾ��ҳ���
String pageStr=request.getParameter("curPage");//��ȡ��ǰҳ��
if (pageObj.needInit(pageStr))//�ж��Ƿ���Ҫ��ʼ��������һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";

	String sq_yhxx_yhmc=null;
	String sq_yhxx_dwbh=null;

	String zwbm=null;


	String sqbm=null;
	sqbm=request.getParameter("sqbm");
	if (sqbm!=null)
	{
		sqbm=cf.GB2Uni(sqbm);
		if (!(sqbm.equals("")))	wheresql+=" and  (sq_sqbm.dwbh='"+sqbm+"')";
	}
	
	String ygbh=null;
	ygbh=request.getParameter("ygbh");
	if (ygbh!=null)
	{
		if (!(ygbh.equals("")))	wheresql+=" and  (sq_yhxx.ygbh='"+ygbh+"')";
	}
	String bianhao=null;
	bianhao=request.getParameter("bianhao");
	if (bianhao!=null)
	{
		bianhao=cf.GB2Uni(bianhao);
		if (!(bianhao.equals("")))	wheresql+=" and  (sq_yhxx.bianhao='"+bianhao+"')";
	}


	
	String fgs=null;
	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (sq_yhxx.ssfgs='"+fgs+"')";

	String sjsbh=null;
	sjsbh=request.getParameter("sjsbh");
	if (sjsbh!=null)
	{
		if (!(sjsbh.equals("")))	wheresql+=" and  (sq_yhxx.sjsbh='"+sjsbh+"')";
	}
	zwbm=request.getParameter("zwbm");
	if (zwbm!=null)
	{
		if (!(zwbm.equals("")))	wheresql+=" and  (sq_yhxx.zwbm='"+zwbm+"')";
	}

	sq_yhxx_yhmc=request.getParameter("sq_yhxx_yhmc");
	if (sq_yhxx_yhmc!=null)
	{
		sq_yhxx_yhmc=cf.GB2Uni(sq_yhxx_yhmc);
		if (!(sq_yhxx_yhmc.equals("")))	wheresql+=" and  (sq_yhxx.yhmc like '%"+sq_yhxx_yhmc+"%')";
	}
	sq_yhxx_dwbh=request.getParameter("sq_yhxx_dwbh");
	if (sq_yhxx_dwbh!=null)
	{
		sq_yhxx_dwbh=cf.GB2Uni(sq_yhxx_dwbh);
		if (!(sq_yhxx_dwbh.equals("")))	wheresql+=" and  (sq_yhxx.dwbh='"+sq_yhxx_dwbh+"')";
	}


	ls_sql="SELECT b.dwmc ssfgs,a.dwmc as ssdw,yhmc,DECODE(sq_yhxx.yhjs,'A0','�ܲ�','A1','�ܲ�����','F0','�ֹ�˾','F1','�ֹ�˾����','F2','����','F3','����С��','S0','ʩ����','G0','��Ӧ��','J0','������') as yhjs,xzzwbm,zwmc,c.dwmc sqbm,d.dwmc sqbmssfgs";
	ls_sql+=" FROM sq_yhxx,sq_dwxx a,sq_dwxx b,sq_dwxx c,sq_dwxx d,dm_zwbm,sq_sqbm";
    ls_sql+=" where sq_yhxx.dwbh=a.dwbh(+) and sq_yhxx.ssfgs=b.dwbh(+) and sq_yhxx.zwbm=dm_zwbm.zwbm(+)";
	ls_sql+=" and sq_yhxx.yhdlm not in(select yhdlm from sq_yhssz where yhzbh='000000')";
	ls_sql+=" and sq_yhxx.ygbh=sq_sqbm.ygbh and sq_sqbm.dwbh=c.dwbh and sq_sqbm.ssfgs=d.dwbh";
	ls_sql+=wheresql;
    ls_sql+=" order by sq_yhxx.ssfgs,sq_yhxx.dwbh,sq_yhxx.yhmc,sq_sqbm.dwbh";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Sq_sqbmCxList.jsp","SelectCxSq_sqbm.jsp","","");
	pageObj.setPageRow(100);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"ygbh","sq_yhxx_yhmc","sq_yhxx_yhkl","sq_yhxx_yhjs","sq_dwxx_dwmc","sq_yhxx_dh","sq_yhxx_email"};
	pageObj.setDisColName(disColName);
*/



//sq_yhxx_yhjs,ssdw,zwmc,ckjgbz,zdyhbz,kdlxtbz,bjjb,sq_yhxx_dh
//������ʾ�ϲ���
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("ssfgs","1");//�в����������Hash��
	spanColHash.put("ssdw","1");//�в����������Hash��
	spanColHash.put("yhmc","1");//�в����������Hash��
	spanColHash.put("yhjs","1");//�в����������Hash��
	spanColHash.put("xzzwbm","1");//�в����������Hash��
	spanColHash.put("zwmc","1");//�в����������Hash��
	pageObj.setSpanCol(spanColHash);//�в����������Hash��
}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=Integer.parseInt(pageStr);
}
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">�粿����Ȩ��ѯ</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(110);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="13%">�ֹ�˾</td>
	<td  width="16%">��������</td>
	<td  width="9%">Ա������</td>
	<td  width="10%">��ɫ</td>
	<td  width="12%">ְ��</td>
	<td  width="11%">����</td>
	<td  width="16%">��Ȩ����</td>
	<td  width="13%">��Ȩ���������ֹ�˾</td>
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