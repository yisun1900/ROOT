<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String yjjzsj=request.getParameter("yjjzsj");
int curPage=0;//��ǰ��Ҫ��ʾ��ҳ���
String pageStr=request.getParameter("curPage");//��ȡ��ǰҳ��
if (pageObj.needInit(pageStr))//�ж��Ƿ���Ҫ��ʼ��������һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";

	ls_sql="SELECT b.dwmc dwbh,sjs,DECODE(zt,'2','��װ','4','����','5','���','3','<font color=\"#FF00FF\">���˵�</font>'),khbh,hth,khxm,qyrq,tdsj,sgdmc,zjxm,wdzgce,qye,suijin,suijinbfb,sjf,glf,guanlif,hbqye,zjxje,zhzjxje,zjxsuijin,kglf,kqtk,zkl,cxhdbm,sfke,jzkfkcs,jzkscsj,jzkfksj,cwsfke,cwjzkfkcs,cwjzkscsj,cwjzkfksj,ywy,a.dwmc fgsbh  ";
	ls_sql+=" FROM cw_qmjzmx,sq_dwxx a,sq_dwxx b,sq_sgd  ";
    ls_sql+=" where cw_qmjzmx.yjjzsj=TO_DATE('"+yjjzsj+"','YYYY-MM-DD') and cw_qmjzmx.fgsbh=a.dwbh(+) and cw_qmjzmx.dwbh=b.dwbh(+) and cw_qmjzmx.sgd=sq_sgd.sgd(+)";
    ls_sql+=" order by zt desc,cw_qmjzmx.fgsbh,cw_qmjzmx.dwbh,sjs,qyrq";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("ViewCw_qmjz.jsp?yjjzsj="+yjjzsj,"","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"yjjzsj","khbh","zt","khxm","hth","sjs","wdzgce","qye","suijin","suijinbfb","sjf","glf","guanlif","hbqye","zjxje","zhzjxje","zjxsuijin","kglf","kqtk","zkl","cxhdbm","qyrq","tdsj","sgd","zjxm","sfke","jzkfkcs","jzkscsj","jzkfksj","cwsfke","cwjzkfkcs","cwjzkscsj","cwjzkfksj","ywy","fgsbh","dwbh"};
	pageObj.setDisColName(disColName);
*/

//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"khbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="/khxx/ViewCrm_khxx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("khbh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��
//������ʾ�ϲ���
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("dwbh","1");//�в����������Hash��
	spanColHash.put("sjs","1");//�в����������Hash��
	spanColHash.put("fgsbh","2");//�в����������Hash��
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
  <B><font size="3">��ѯ�����ҵ����תʱ�䣺<%=yjjzsj%>��</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(250);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">ǩԼ����</td>
	<td  width="2%">���ʦ</td>
	<td  width="2%">�ͻ�����</td>
	<td  width="2%">�ͻ����</td>
	<td  width="3%">��ͬ��</td>
	<td  width="3%">�ͻ�����</td>
	<td  width="3%">ǩԼ����</td>
	<td  width="3%">�˵�ʱ��</td>
	<td  width="2%">ʩ����</td>
	<td  width="2%">�ʼ�</td>
	<td  width="4%">δ���۹��̶�</td>
	<td  width="4%">����ǩԼ��</td>
	<td  width="3%">˰��</td>
	<td  width="2%">˰��ٷֱ�</td>
	<td  width="3%">��Ʒ�</td>
	<td  width="3%">�����</td>
	<td  width="3%">�����</td>
	<td  width="2%">������ĿǩԼ��</td>
	<td  width="3%">��ǰ�ۼƹ���������</td>
	<td  width="3%">�ۺ��ۼƹ���������</td>
	<td  width="2%">������˰��</td>
	<td  width="3%">�ۼƼ�������</td>
	<td  width="3%">�ۼƼ����������</td>
	<td  width="2%">ʵ���ۿ���</td>
	<td  width="4%">�μӴ����</td>
	<td  width="4%">��װʵ�����</td>
	<td  width="2%">��װ�������</td>
	<td  width="3%">�״θ���װ��ʱ��</td>
	<td  width="3%">��װ�������ʱ��</td>
	<td  width="4%">�����װʵ�տ��</td>
	<td  width="2%">�����װ�տ�����</td>
	<td  width="3%">�����״��ռ�װ��ʱ��</td>
	<td  width="3%">�����װ����տ�ʱ��</td>
	<td  width="2%">ҵ��Ա</td>
	<td  width="4%">�����ֹ�˾���</td>
</tr>
<%
	pageObj.printDate();
	pageObj.printSum();
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
