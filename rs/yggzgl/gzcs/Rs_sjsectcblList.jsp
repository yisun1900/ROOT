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
	String xh=null;
	String fdmc=null;
	String qd=null;
	String zd=null;
	String tcbfb=null;
	String qdlx=null;
	String fgsbh=null;
	String sjsjb=null;
	xh=request.getParameter("xh");
	if (xh!=null)
	{
		xh=xh.trim();
		if (!(xh.equals("")))	wheresql+=" and (xh="+xh+") ";
	}
	fdmc=request.getParameter("fdmc");
	if (fdmc!=null)
	{
		fdmc=cf.GB2Uni(fdmc);
		if (!(fdmc.equals("")))	wheresql+=" and  (fdmc='"+fdmc+"')";
	}
	qd=request.getParameter("qd");
	if (qd!=null)
	{
		qd=qd.trim();
		if (!(qd.equals("")))	wheresql+=" and  (qd="+qd+") ";
	}
	zd=request.getParameter("zd");
	if (zd!=null)
	{
		zd=zd.trim();
		if (!(zd.equals("")))	wheresql+=" and  (zd="+zd+") ";
	}
	tcbfb=request.getParameter("tcbfb");
	if (tcbfb!=null)
	{
		tcbfb=tcbfb.trim();
		if (!(tcbfb.equals("")))	wheresql+=" and  (tcbfb="+tcbfb+") ";
	}
	qdlx=request.getParameter("qdlx");
	if (qdlx!=null)
	{
		qdlx=cf.GB2Uni(qdlx);
		if (!(qdlx.equals("")))	wheresql+=" and  (qdlx='"+qdlx+"')";
	}
	fgsbh=request.getParameter("fgsbh");
	if (fgsbh!=null)
	{
		fgsbh=cf.GB2Uni(fgsbh);
		if (!(fgsbh.equals("")))	wheresql+=" and  (fgsbh='"+fgsbh+"')";
	}
	sjsjb=request.getParameter("sjsjb");
	if (sjsjb!=null)
	{
		sjsjb=cf.GB2Uni(sjsjb);
		if (!(sjsjb.equals("")))	wheresql+=" and  (sjsjb='"+sjsjb+"')";
	}

	ls_sql="SELECT xh,dwmc,sjsjbmc,fdmc,qd,zd, DECODE(qdlx,'1','���г�����װ','2','�г�����װ','3','��װ'),tcbfb||'%'";
	ls_sql+=" FROM rs_sjsectcbl,sq_dwxx,rs_sjsjb  ";
    ls_sql+=" where rs_sjsectcbl.fgsbh=sq_dwxx.dwbh(+) and rs_sjsectcbl.sjsjb=rs_sjsjb.sjsjb(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by rs_sjsectcbl.fgsbh,rs_sjsectcbl.sjsjb,fdmc,qdlx,xh";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Rs_sjsectcblList.jsp","","","EditRs_sjsectcbl.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"xh","fdmc","qd","zd","tcbfb","qdlx","fgsbh","sjsjb"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"xh"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Rs_sjsectcblList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
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
	String[] xh = request.getParameterValues("xh");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(xh,"xh"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[1];//Ҫִ�е�SQL
		boolean needCommit=false;//����Ҫ������
		sql[0]="delete from rs_sjsectcbl where "+chooseitem;
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
	<td  width="6%">���</td>
	<td  width="14%">�ֹ�˾</td>
	<td  width="15%">���ʦ����</td>
	<td  width="15%">�ֶ�����</td>
	<td  width="10%">���</td>
	<td  width="10%">�յ�</td>
	<td  width="13%">ǩ������</td>
	<td  width="10%">��ɰٷֱ�</td>
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