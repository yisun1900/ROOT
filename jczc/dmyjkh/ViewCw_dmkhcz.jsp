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
	String dwbh=request.getParameter("dwbh");

	ls_sql="SELECT cw_dmkhcz.dwbh,sq_dwxx.dwmc,dm_dwjb.dwjbmc,dm_dmxs.dmxsmc,dm_ssfw.ssfwmc,sq_dwxx.dwdz,sq_dwxx.dwfzr,sq_dwxx.dwdh,cw_dmkhcz.nian,cw_dmkhcz.yue,cw_dmkhcz.khcz,cw_dmkhcz.lrr,cw_dmkhcz.lrsj  ";
	ls_sql+=" FROM dm_ssfw,dm_dmxs,dm_dwjb,sq_dwxx,cw_dmkhcz  ";
    ls_sql+=" where sq_dwxx.ssfw=dm_ssfw.ssfw(+) and sq_dwxx.dmxs=dm_dmxs.dmxs(+) and sq_dwxx.dwjb=dm_dwjb.dwjb(+) and cw_dmkhcz.dwbh=sq_dwxx.dwbh";
    ls_sql+=" and cw_dmkhcz.dwbh='"+dwbh+"'";
    ls_sql+=" order by cw_dmkhcz.dwbh,cw_dmkhcz.nian desc,cw_dmkhcz.yue";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��
//������ʾ��
	String[] disColName={"nian","yue","khcz","lrr","lrsj","dwmc","dwjbmc","dmxsmc","ssfwmc"};
	pageObj.setDisColName(disColName);

//��������
	String[] keyName={"dwbh","nian","yue"};
	pageObj.setKey(keyName);

//������ʾ�ϲ���
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("nian","1");//�в����������Hash��
	spanColHash.put("dwmc","1");//�в����������Hash��
	spanColHash.put("dwjbmc","1");//�в����������Hash��
	spanColHash.put("dmxsmc","1");//�в����������Hash��
	spanColHash.put("ssfwmc","1");//�в����������Hash��
	pageObj.setSpanCol(spanColHash);//�в����������Hash��

//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"dwbh","nian","yue"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="ViewCw_dmkhjl.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("yue",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��
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
  <B><font size="3">���濼�˲�ֵ</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="8%">��</td>
	<td  width="7%">��</td>
	<td  width="15%">���˲�ֵ</td>
	<td  width="8%">¼����</td>
	<td  width="10%">¼��ʱ��</td>
	<td  width="18%">��λ����</td>
	<td  width="10%">��λ����</td>
	<td  width="12%">������ʽ</td>
	<td  width="12%">������λ</td>
</tr>
<%
	pageObj.printDateSum();
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