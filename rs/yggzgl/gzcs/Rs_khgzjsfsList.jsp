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
	String ssfgs=null;
	String sjsjb=null;
	String yjxx=null;
	String yjsx=null;
	String khgz=null;
	xh=request.getParameter("xh");
	if (xh!=null)
	{
		xh=xh.trim();
		if (!(xh.equals("")))	wheresql+=" and (xh="+xh+") ";
	}
	ssfgs=request.getParameter("ssfgs");
	if (ssfgs!=null)
	{
		ssfgs=cf.GB2Uni(ssfgs);
		if (!(ssfgs.equals("")))	wheresql+=" and  (ssfgs='"+ssfgs+"')";
	}
	sjsjb=request.getParameter("sjsjb");
	if (sjsjb!=null)
	{
		sjsjb=cf.GB2Uni(sjsjb);
		if (!(sjsjb.equals("")))	wheresql+=" and  (sjsjb='"+sjsjb+"')";
	}
	yjxx=request.getParameter("yjxx");
	if (yjxx!=null)
	{
		yjxx=yjxx.trim();
		if (!(yjxx.equals("")))	wheresql+=" and  (yjxx="+yjxx+") ";
	}
	yjsx=request.getParameter("yjsx");
	if (yjsx!=null)
	{
		yjsx=yjsx.trim();
		if (!(yjsx.equals("")))	wheresql+=" and  (yjsx="+yjsx+") ";
	}
	khgz=request.getParameter("khgz");
	if (khgz!=null)
	{
		khgz=khgz.trim();
		if (!(khgz.equals("")))	wheresql+=" and  (khgz="+khgz+") ";
	}
	ls_sql="SELECT xh,dwmc,sjsjbmc,yjxx,yjsx,khgz  ";
	ls_sql+=" FROM rs_khgzjsfs,sq_dwxx,rs_sjsjb  ";
    ls_sql+=" where rs_khgzjsfs.ssfgs=sq_dwxx.dwbh(+) and rs_khgzjsfs.sjsjb=rs_sjsjb.sjsjb(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by xh";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Rs_khgzjsfsList.jsp","","","EditRs_khgzjsfs.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"xh","ssfgs","sjsjb","yjxx","yjsx","khgz"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"xh"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Rs_khgzjsfsList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
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
		sql[0]="delete from rs_khgzjsfs where "+chooseitem;
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
  <B><font size="3">���˹��ʲ�����ά��</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="12%">&nbsp;</td>
	<td  width="8%">���</td>
	<td  width="18%">�ֹ�˾</td>
	<td  width="18%">���ʦ����</td>
	<td  width="14%">ҵ������</td>
	<td  width="14%">ҵ������</td>
	<td  width="14%">���˹���</td>
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