<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%

			int curPage=0;//��ǰ��Ҫ��ʾ��ҳ���
			String ls_sql=null;
			String wheresql="";
			String xmzy=null;
			String xm=cf.GB2Uni(request.getParameter("XM"));
			xmzy=request.getParameter("xmzy");
			if (xmzy!=null)
			{
				xmzy=cf.GB2Uni(xmzy);
				if (!(xmzy.equals("")))	wheresql+="  and (jc_cgdd.xmzy='"+xmzy+"')";
			
			}
			String pageStr=request.getParameter("curPage");//��ȡ��ǰҳ��
			if (pageObj.needInit(pageStr))//�ж��Ƿ���Ҫ��ʼ��������һ�ν����ҳ������Ҫ��ʼ��
			{
				curPage=1;				
				
				ls_sql="SELECT jc_cgdd.ddbh as ddbh,jc_cgdd.xmzy,jc_cgdd.khbh as khbh,jc_cgdd.dj as jc_cgdd_dj,jc_cgdd.cgsjs as jc_cgdd_cgsjs, DECODE(jc_cgdd.kfcbz,'Y','�ɸ���','N','���ɸ���') as jc_cgdd_kfcbz,jc_cgdd.ssje as jc_cgdd_ssje, DECODE(jc_cgdd.clzt,'00','Ԥ����δ���','01','Ԥ���������','02','���ɵ�','03','�ѳ���','04','�Ѹ���','05','ǩ����ͬ','06','��ͬ��ȷ��','07','�����','08','�Ѱ�װ') as jc_cgdd_clzt, DECODE(jc_cgdd.khlx,'1','װ�޿ͻ�','2','����ͻ�') as jc_cgdd_khlx,jc_cgdd.khxm as jc_cgdd_khxm,jc_cgdd.fwdz as jc_cgdd_fwdz,jc_cgdd.hth as jc_cgdd_hth,sq_dwxx.dwmc as sq_dwxx_dwmc  ";
				ls_sql+=" FROM jc_cgdd,sq_dwxx,sq_yhxx  ";
				ls_sql+=" where jc_cgdd.dwbh=sq_dwxx.dwbh(+)  and jc_cgdd.clzt not in('08')";
				ls_sql+=wheresql ;
				ls_sql+=" order by sq_yhxx.yhmc,jc_cgdd.lrsj";
				pageObj.sql=ls_sql;
			//���ж����ʼ��
				pageObj.initPage("CggdCxList.jsp","SelectXmzy.jsp","","");
			//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
			//������ʾ��
				String[] disColName={"ddbh","xmzy","jc_cgdd_clzt","jc_cgdd_khxm","jc_cgdd_fwdz","jc_cgdd_hth","jc_cgdd_dj","jc_cgdd_cgsjs","jc_cgdd_kfcbz","jc_cgdd_ssje","jc_cgdd_khlx","sq_dwxx_dwmc"};
				pageObj.setDisColName(disColName);

			//��������
				String[] keyName={"ddbh"};
				pageObj.setKey(keyName);
			//�����г�������
				Hashtable coluParmHash=new Hashtable();
				ColuParm coluParm=null;

				coluParm=new ColuParm();//����һ���в�������
				String[] coluKey={"khbh"};//�����в�����coluParm.key������
				coluParm.key=coluKey;//�����в�����coluParm.key������
				coluParm.link="/khxx/ViewCrm_khxx.jsp";//Ϊ�в�����coluParm.link���ó�������
				coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
				coluParmHash.put("jc_cgdd_khxm",coluParm);//�в����������Hash��
				pageObj.setColuLink(coluParmHash);//�в����������Hash��

				coluParm=new ColuParm();//����һ���в�������
				String[] coluKey1={"ddbh"};//�����в�����coluParm.key������
				coluParm.key=coluKey1;//�����в�����coluParm.key������
				coluParm.link="ViewJc_cgdd.jsp";//Ϊ�в�����coluParm.link���ó�������
				coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
				coluParmHash.put("ddbh",coluParm);//�в����������Hash��
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
			  <B><font size="3"><%=xm%>��ĿרԱ���������</font></B>
			</CENTER>
			<%
				pageObj.out=out;
				pageObj.getDate(curPage);
				pageObj.printPageLink();
			%>
			<tr bgcolor="#CCCCCC"  align="center">
				<td  width="6%">�������</td>
				<td  width="6%">��ĿרԱ</td>
				<td  width="11%">����״̬</td>
				<td  width="6%">�ͻ�����</td>
				<td  width="22%">���ݵ�ַ</td>
				<td  width="9%">��ͬ��</td>
				<td  width="6%">����</td>
				<td  width="6%">�Ҿ����ʦ</td>
				<td  width="9%">�ɸ����־</td>
				<td  width="6%">ʵ�ս��</td>
				<td  width="8%">�ͻ�����</td>
				<td  width="11%">¼�벿��</td>
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
